import 'package:galleria/core/logger/logger_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gal/gal.dart';
import 'package:photo_manager/photo_manager.dart';
import '../services/supabase_service.dart';

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
class HomeController extends _$HomeController {
  late final LoggerService _loggerService;
  @override
  FutureOr<List<AssetEntity>> build() async {
    _loggerService = ref.watch(loggerServiceProvider);
    return _fetchAssets();
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

    // If 'Galleria' doesn't exist (or we can't find it), return empty list
    if (galleriaAlbum == null) {
      // It's possible the album doesn't exist yet if no photos are saved.
      return [];
    }

    // Fetch assets from the album
    final int assetCount = await galleriaAlbum.assetCountAsync;
    final List<AssetEntity> assets = await galleriaAlbum.getAssetListRange(start: 0, end: assetCount);

    return assets;
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

      // Refresh the list of assets
      ref.invalidateSelf();
    } catch (e) {
      _loggerService.e('Error uploading image: $e');
      rethrow;
    }
  }

  Future<void> uploadAssets(List<AssetEntity> assets) async {
    if (assets.isEmpty) return;

    // Show some loading state if needed, or rely on UI to show it?
    // For now, we just upload sequentially or in parallel.

    try {
      // Future.wait for parallel upload
      await Future.wait(
        assets.map((asset) async {
          final file = await asset.file;
          if (file != null) {
            final fileName = 'galleria_${asset.id}_${DateTime.now().millisecondsSinceEpoch}.jpg';
            await ref.read(supabaseServiceProvider).uploadImage(file, fileName);
          }
        }),
      );

      _loggerService.i('Uploaded ${assets.length} images successfully');

      // Clear selection after successful upload
      ref.read(selectedAssetsProvider.notifier).clear();
    } catch (e) {
      _loggerService.e('Error uploading assets: $e');
      // Handle error (maybe show snackbar in UI via listener)
      rethrow;
    }
  }
}
