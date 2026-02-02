import 'package:galleria/core/logger/logger_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gal/gal.dart';
import 'package:photo_manager/photo_manager.dart';
import '../services/supabase_service.dart';
import '../models/galleria_asset.dart';

part 'home_controller.g.dart';

@riverpod
class SelectedAssets extends _$SelectedAssets {
  @override
  Set<AssetEntity> build() {
    return {};
  }

  void toggle(AssetEntity asset) {
    if (state.contains(asset)) {
      state = {...state}..remove(asset);
    } else {
      state = {...state, asset};
    }
  }

  void selectAll(List<AssetEntity> assets) {
    state = {...assets};
  }

  void clear() {
    state = {};
  }

  bool isSelected(AssetEntity asset) {
    return state.contains(asset);
  }
}

@riverpod
class UploadedAssets extends _$UploadedAssets {
  late final SupabaseService _supabaseService;

  @override
  FutureOr<Set<String>> build() async {
    _supabaseService = ref.watch(supabaseServiceProvider);
    try {
      final ids = await _supabaseService.getUploadedAssetIds();
      return ids.toSet();
    } catch (e) {
      return {};
    }
  }

  void markMultipleAsUploaded(Iterable<String> ids) {
    state.whenData((current) {
      state = AsyncData({...current, ...ids});
    });
  }
}

@riverpod
class HomeController extends _$HomeController {
  late final LoggerService _loggerService;

  @override
  FutureOr<List<GalleriaAsset>> build() async {
    _loggerService = ref.watch(loggerServiceProvider);

    // Watch uploaded assets to trigger rebuild when cloud status changes
    final uploadedIds = await ref.watch(uploadedAssetsProvider.future);
    final assets = await _fetchAssets();

    return assets
        .map((asset) => GalleriaAsset(asset: asset, id: asset.id, isUploaded: uploadedIds.contains(asset.id)))
        .toList();
  }

  Future<List<AssetEntity>> _fetchAssets() async {
    final PermissionState permissionState = await PhotoManager.requestPermissionExtend();
    if (!permissionState.isAuth) {
      if (permissionState.hasAccess) {
        // Access is granted (limited or full)
      } else {
        return [];
      }
    }

    // Fetch albums
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      filterOption: FilterOptionGroup(orders: [const OrderOption(type: OrderOptionType.createDate, asc: false)]),
    );

    // Find 'Galleria' album
    AssetPathEntity? galleriaAlbum;
    for (final album in albums) {
      if (album.name == 'Galleria') {
        galleriaAlbum = album;
        break;
      }
    }

    if (galleriaAlbum == null) {
      return [];
    }

    final int assetCount = await galleriaAlbum.assetCountAsync;
    final List<AssetEntity> assets = await galleriaAlbum.getAssetListRange(start: 0, end: assetCount);

    return assets;
  }

  String _sanitizeId(String id) {
    // Replace characters that cause issues in paths (like / on iOS) or parsing (like _)
    return id.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '-');
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    try {
      final access = await Gal.hasAccess();
      if (!access) {
        await Gal.requestAccess();
      }

      await Gal.putImage(image.path, album: 'Galleria');
      ref.invalidateSelf();
    } catch (e) {
      _loggerService.e('Error capturing image: $e');
      rethrow;
    }
  }

  Future<void> uploadAssets(List<AssetEntity> assets) async {
    if (assets.isEmpty) return;

    try {
      final List<String> successfulIds = [];
      final supabase = ref.read(supabaseServiceProvider);

      await Future.wait(
        assets.map((asset) async {
          final file = await asset.file;
          if (file != null) {
            final sanitizedId = _sanitizeId(asset.id);
            // Deterministic filename: galleria_{sanitizedId}.jpg
            // We use the ID as the unique identifier in storage.
            final fileName = 'galleria_$sanitizedId.jpg';

            // Upload with metadata as requested
            await supabase.uploadImage(
              file,
              fileName,
              metadata: {
                'localId': asset.id,
                'originalName': asset.title ?? 'unknown',
                'uploadedAt': DateTime.now().toIso8601String(),
              },
            );

            // Record in DB for efficient tracking (avoids listing bucket)
            await supabase.recordAssetUpload(asset.id, fileName);

            successfulIds.add(asset.id);
          }
        }),
      );

      _loggerService.i('Uploaded ${assets.length} images successfully');

      // Update uploaded status in cloud tracker
      ref.read(uploadedAssetsProvider.notifier).markMultipleAsUploaded(successfulIds);

      // Clear selection
      ref.read(selectedAssetsProvider.notifier).clear();
    } catch (e) {
      _loggerService.e('Error uploading assets: $e');
      rethrow;
    }
  }
}
