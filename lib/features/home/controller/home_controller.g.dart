// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedAssets)
final selectedAssetsProvider = SelectedAssetsProvider._();

final class SelectedAssetsProvider
    extends $NotifierProvider<SelectedAssets, Set<AssetEntity>> {
  SelectedAssetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAssetsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAssetsHash();

  @$internal
  @override
  SelectedAssets create() => SelectedAssets();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<AssetEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<AssetEntity>>(value),
    );
  }
}

String _$selectedAssetsHash() => r'50b71172863bd9cfeda56ccf28c3d6b8502b204c';

abstract class _$SelectedAssets extends $Notifier<Set<AssetEntity>> {
  Set<AssetEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<AssetEntity>, Set<AssetEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<AssetEntity>, Set<AssetEntity>>,
              Set<AssetEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UploadedAssets)
final uploadedAssetsProvider = UploadedAssetsProvider._();

final class UploadedAssetsProvider
    extends $AsyncNotifierProvider<UploadedAssets, Set<String>> {
  UploadedAssetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uploadedAssetsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uploadedAssetsHash();

  @$internal
  @override
  UploadedAssets create() => UploadedAssets();
}

String _$uploadedAssetsHash() => r'e4fff789951ec13ffc53ac937902a69a157d0f2e';

abstract class _$UploadedAssets extends $AsyncNotifier<Set<String>> {
  FutureOr<Set<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Set<String>>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Set<String>>, Set<String>>,
              AsyncValue<Set<String>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(HomeController)
final homeControllerProvider = HomeControllerProvider._();

final class HomeControllerProvider
    extends $AsyncNotifierProvider<HomeController, List<GalleriaAsset>> {
  HomeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeControllerHash();

  @$internal
  @override
  HomeController create() => HomeController();
}

String _$homeControllerHash() => r'8891e5ef8256018385a5db262529f1172776efa3';

abstract class _$HomeController extends $AsyncNotifier<List<GalleriaAsset>> {
  FutureOr<List<GalleriaAsset>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<GalleriaAsset>>, List<GalleriaAsset>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<GalleriaAsset>>, List<GalleriaAsset>>,
              AsyncValue<List<GalleriaAsset>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
