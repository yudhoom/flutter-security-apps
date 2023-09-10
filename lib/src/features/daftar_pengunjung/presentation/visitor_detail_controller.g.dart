// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $VisitorDetailControllerHash() =>
    r'01ae54d705e8c02145abbdd00c33a745efb31a88';

/// See also [VisitorDetailController].
class VisitorDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<VisitorDetailController,
        VisitorDetail?> {
  VisitorDetailControllerProvider(
    this.username,
    this.idEvent,
    this.idManifest,
  ) : super(
          () => VisitorDetailController()
            ..username = username
            ..idEvent = idEvent
            ..idManifest = idManifest,
          from: visitorDetailControllerProvider,
          name: r'visitorDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $VisitorDetailControllerHash,
        );

  final String username;
  final String idEvent;
  final String idManifest;

  @override
  bool operator ==(Object other) {
    return other is VisitorDetailControllerProvider &&
        other.username == username &&
        other.idEvent == idEvent &&
        other.idManifest == idManifest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, idEvent.hashCode);
    hash = _SystemHash.combine(hash, idManifest.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<VisitorDetail?> runNotifierBuild(
    covariant _$VisitorDetailController notifier,
  ) {
    return notifier.build(
      username,
      idEvent,
      idManifest,
    );
  }
}

typedef VisitorDetailControllerRef
    = AutoDisposeAsyncNotifierProviderRef<VisitorDetail?>;

/// See also [VisitorDetailController].
final visitorDetailControllerProvider = VisitorDetailControllerFamily();

class VisitorDetailControllerFamily extends Family<AsyncValue<VisitorDetail?>> {
  VisitorDetailControllerFamily();

  VisitorDetailControllerProvider call(
    String username,
    String idEvent,
    String idManifest,
  ) {
    return VisitorDetailControllerProvider(
      username,
      idEvent,
      idManifest,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<VisitorDetailController, VisitorDetail?>
      getProviderOverride(
    covariant VisitorDetailControllerProvider provider,
  ) {
    return call(
      provider.username,
      provider.idEvent,
      provider.idManifest,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'visitorDetailControllerProvider';
}

abstract class _$VisitorDetailController
    extends BuildlessAutoDisposeAsyncNotifier<VisitorDetail?> {
  late final String username;
  late final String idEvent;
  late final String idManifest;

  FutureOr<VisitorDetail?> build(
    String username,
    String idEvent,
    String idManifest,
  );
}

String $VisitorDetailVipControllerHash() =>
    r'3daf81ee429231564c87ff13890fa0def2c73416';

/// See also [VisitorDetailVipController].
class VisitorDetailVipControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<VisitorDetailVipController,
        VisitorDetail?> {
  VisitorDetailVipControllerProvider(
    this.username,
    this.idManifest,
  ) : super(
          () => VisitorDetailVipController()
            ..username = username
            ..idManifest = idManifest,
          from: visitorDetailVipControllerProvider,
          name: r'visitorDetailVipControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $VisitorDetailVipControllerHash,
        );

  final String username;
  final String idManifest;

  @override
  bool operator ==(Object other) {
    return other is VisitorDetailVipControllerProvider &&
        other.username == username &&
        other.idManifest == idManifest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, idManifest.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<VisitorDetail?> runNotifierBuild(
    covariant _$VisitorDetailVipController notifier,
  ) {
    return notifier.build(
      username,
      idManifest,
    );
  }
}

typedef VisitorDetailVipControllerRef
    = AutoDisposeAsyncNotifierProviderRef<VisitorDetail?>;

/// See also [VisitorDetailVipController].
final visitorDetailVipControllerProvider = VisitorDetailVipControllerFamily();

class VisitorDetailVipControllerFamily
    extends Family<AsyncValue<VisitorDetail?>> {
  VisitorDetailVipControllerFamily();

  VisitorDetailVipControllerProvider call(
    String username,
    String idManifest,
  ) {
    return VisitorDetailVipControllerProvider(
      username,
      idManifest,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<VisitorDetailVipController,
      VisitorDetail?> getProviderOverride(
    covariant VisitorDetailVipControllerProvider provider,
  ) {
    return call(
      provider.username,
      provider.idManifest,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'visitorDetailVipControllerProvider';
}

abstract class _$VisitorDetailVipController
    extends BuildlessAutoDisposeAsyncNotifier<VisitorDetail?> {
  late final String username;
  late final String idManifest;

  FutureOr<VisitorDetail?> build(
    String username,
    String idManifest,
  );
}

String $VisitorDetailRegularControllerHash() =>
    r'21eb1eb2dcc7267b50b7d5322e0dbb8c743e5072';

/// See also [VisitorDetailRegularController].
class VisitorDetailRegularControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<VisitorDetailRegularController,
        VisitorDetail?> {
  VisitorDetailRegularControllerProvider(
    this.username,
    this.idManifest,
  ) : super(
          () => VisitorDetailRegularController()
            ..username = username
            ..idManifest = idManifest,
          from: visitorDetailRegularControllerProvider,
          name: r'visitorDetailRegularControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $VisitorDetailRegularControllerHash,
        );

  final String username;
  final String idManifest;

  @override
  bool operator ==(Object other) {
    return other is VisitorDetailRegularControllerProvider &&
        other.username == username &&
        other.idManifest == idManifest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, idManifest.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<VisitorDetail?> runNotifierBuild(
    covariant _$VisitorDetailRegularController notifier,
  ) {
    return notifier.build(
      username,
      idManifest,
    );
  }
}

typedef VisitorDetailRegularControllerRef
    = AutoDisposeAsyncNotifierProviderRef<VisitorDetail?>;

/// See also [VisitorDetailRegularController].
final visitorDetailRegularControllerProvider =
    VisitorDetailRegularControllerFamily();

class VisitorDetailRegularControllerFamily
    extends Family<AsyncValue<VisitorDetail?>> {
  VisitorDetailRegularControllerFamily();

  VisitorDetailRegularControllerProvider call(
    String username,
    String idManifest,
  ) {
    return VisitorDetailRegularControllerProvider(
      username,
      idManifest,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<VisitorDetailRegularController,
      VisitorDetail?> getProviderOverride(
    covariant VisitorDetailRegularControllerProvider provider,
  ) {
    return call(
      provider.username,
      provider.idManifest,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'visitorDetailRegularControllerProvider';
}

abstract class _$VisitorDetailRegularController
    extends BuildlessAutoDisposeAsyncNotifier<VisitorDetail?> {
  late final String username;
  late final String idManifest;

  FutureOr<VisitorDetail?> build(
    String username,
    String idManifest,
  );
}

String $VisitorDetailRealizationControllerHash() =>
    r'37ed33ce6a2e56d1e3838bca2d159e059a789bc0';

/// See also [VisitorDetailRealizationController].
class VisitorDetailRealizationControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        VisitorDetailRealizationController, VisitorDetail?> {
  VisitorDetailRealizationControllerProvider(
    this.username,
    this.idManifest,
  ) : super(
          () => VisitorDetailRealizationController()
            ..username = username
            ..idManifest = idManifest,
          from: visitorDetailRealizationControllerProvider,
          name: r'visitorDetailRealizationControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $VisitorDetailRealizationControllerHash,
        );

  final String username;
  final String idManifest;

  @override
  bool operator ==(Object other) {
    return other is VisitorDetailRealizationControllerProvider &&
        other.username == username &&
        other.idManifest == idManifest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, idManifest.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<VisitorDetail?> runNotifierBuild(
    covariant _$VisitorDetailRealizationController notifier,
  ) {
    return notifier.build(
      username,
      idManifest,
    );
  }
}

typedef VisitorDetailRealizationControllerRef
    = AutoDisposeAsyncNotifierProviderRef<VisitorDetail?>;

/// See also [VisitorDetailRealizationController].
final visitorDetailRealizationControllerProvider =
    VisitorDetailRealizationControllerFamily();

class VisitorDetailRealizationControllerFamily
    extends Family<AsyncValue<VisitorDetail?>> {
  VisitorDetailRealizationControllerFamily();

  VisitorDetailRealizationControllerProvider call(
    String username,
    String idManifest,
  ) {
    return VisitorDetailRealizationControllerProvider(
      username,
      idManifest,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<VisitorDetailRealizationController,
      VisitorDetail?> getProviderOverride(
    covariant VisitorDetailRealizationControllerProvider provider,
  ) {
    return call(
      provider.username,
      provider.idManifest,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'visitorDetailRealizationControllerProvider';
}

abstract class _$VisitorDetailRealizationController
    extends BuildlessAutoDisposeAsyncNotifier<VisitorDetail?> {
  late final String username;
  late final String idManifest;

  FutureOr<VisitorDetail?> build(
    String username,
    String idManifest,
  );
}

String $VisitorPostGateInControllerHash() =>
    r'bd2a10fd9bdc43e0cdff6ebd85e1913333178e8b';

/// See also [VisitorPostGateInController].
final visitorPostGateInControllerProvider = AutoDisposeAsyncNotifierProvider<
    VisitorPostGateInController, VisitorGateInOut?>(
  VisitorPostGateInController.new,
  name: r'visitorPostGateInControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $VisitorPostGateInControllerHash,
);
typedef VisitorPostGateInControllerRef
    = AutoDisposeAsyncNotifierProviderRef<VisitorGateInOut?>;

abstract class _$VisitorPostGateInController
    extends AutoDisposeAsyncNotifier<VisitorGateInOut?> {
  @override
  FutureOr<VisitorGateInOut?> build();
}

String $VisitorPutGateOutControllerHash() =>
    r'c17e94412ab09dfb21cca589dc4f82e4b9f945d8';

/// See also [VisitorPutGateOutController].
final visitorPutGateOutControllerProvider = AutoDisposeAsyncNotifierProvider<
    VisitorPutGateOutController, VisitorGateInOut?>(
  VisitorPutGateOutController.new,
  name: r'visitorPutGateOutControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $VisitorPutGateOutControllerHash,
);
typedef VisitorPutGateOutControllerRef
    = AutoDisposeAsyncNotifierProviderRef<VisitorGateInOut?>;

abstract class _$VisitorPutGateOutController
    extends AutoDisposeAsyncNotifier<VisitorGateInOut?> {
  @override
  FutureOr<VisitorGateInOut?> build();
}
