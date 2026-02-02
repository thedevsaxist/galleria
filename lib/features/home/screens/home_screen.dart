import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:uicons/uicons.dart';
import '../controller/home_controller.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for errors
    ref.listen(homeControllerProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${next.error}')));
      }
    });

    final assetsAsync = ref.watch(homeControllerProvider);
    final selectedAssets = ref.watch(selectedAssetsProvider);
    final isSelectionMode = selectedAssets.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isSelectionMode ? "${selectedAssets.length} Selected" : "Galleria",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: isSelectionMode
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  ref.read(selectedAssetsProvider.notifier).clear();
                },
              )
            : null,
        centerTitle: false,
        actionsPadding: .only(right: 20),
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16.r)),
            menuPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
            enableFeedback: true,
            position: PopupMenuPosition.under,
            color: Colors.white,
            offset: Offset(-5.w, 5.h),
            padding: EdgeInsetsGeometry.zero,
            icon: Icon(UIcons.regularRounded.cloud_upload, color: Colors.black),
            itemBuilder: (context) => [
              PopupMenuItem(
                padding: EdgeInsets.zero,
                value: "Upload selected",
                onTap: () {
                  if (selectedAssets.isNotEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('Uploading selected images...')));
                    ref.read(homeControllerProvider.notifier).uploadAssets(selectedAssets.toList());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No images selected')));
                  }
                },
                child: Text(
                  "Upload selected",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp),
                ),
              ),
              PopupMenuItem(
                padding: EdgeInsets.zero,
                value: "Upload all",
                onTap: () {
                  final assets = assetsAsync.value;
                  if (assets != null && assets.isNotEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('Uploading all images...')));
                    ref.read(homeControllerProvider.notifier).uploadAssets(assets);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No images to upload')));
                  }
                },
                child: Text(
                  "Upload all",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ],
      ),
      body: assetsAsync.when(
        data: (assets) {
          if (assets.isEmpty) {
            return Center(child: Icon(UIcons.regularRounded.folder, size: 120, color: Colors.grey));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: assets.length,
            itemBuilder: (context, index) {
              final asset = assets[index];
              final isSelected = selectedAssets.contains(asset);

              return GestureDetector(
                onLongPress: () {
                  ref.read(selectedAssetsProvider.notifier).toggle(asset);
                },
                onTap: () {
                  if (isSelectionMode) {
                    ref.read(selectedAssetsProvider.notifier).toggle(asset);
                  } else {
                    // Open image viewer or do nothing
                  }
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AssetEntityImage(
                      asset,
                      isOriginal: false,
                      thumbnailSize: const ThumbnailSize.square(200),
                      fit: BoxFit.cover,
                    ),
                    if (isSelected)
                      Container(
                        color: Colors.black45,
                        child: const Center(child: Icon(Icons.check_circle, color: Colors.white, size: 32)),
                      ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeControllerProvider.notifier).pickImage();
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
