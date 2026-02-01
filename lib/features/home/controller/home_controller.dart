import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:gal/gal.dart';
import 'package:photo_manager/photo_manager.dart';
import '../services/supabase_service.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<List<AssetEntity>> build() async {
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

      // Upload to Supabase
      final file = File(image.path);
      final fileName = 'galleria_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await ref.read(supabaseServiceProvider).uploadImage(file, fileName);

      // Refresh the list of assets
      ref.invalidateSelf();
    } catch (e) {
      rethrow;
    }
  }
}
