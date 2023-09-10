// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_controller.dart';

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

String $VisitorRealizationGenControllerHash() =>
    r'13d7fc753e79d1caff63cc82c0db565a5e63c344';

/// See also [VisitorRealizationGenController].
final visitorRealizationGenControllerProvider =
    AutoDisposeAsyncNotifierProvider<VisitorRealizationGenController,
        VisitorTotal?>(
  VisitorRealizationGenController.new,
  name: r'visitorRealizationGenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $VisitorRealizationGenControllerHash,
);
typedef VisitorRealizationGenControllerRef
    = AutoDisposeAsyncNotifierProviderRef<VisitorTotal?>;

abstract class _$VisitorRealizationGenController
    extends AutoDisposeAsyncNotifier<VisitorTotal?> {
  @override
  FutureOr<VisitorTotal?> build();
}

String $VisitorVipGenControllerHash() =>
    r'4749ad6a80ab1837715e35be6fb0834e957691e6';

/// See also [VisitorVipGenController].
final visitorVipGenControllerProvider =
    AutoDisposeAsyncNotifierProvider<VisitorVipGenController, VisitorTotal?>(
  VisitorVipGenController.new,
  name: r'visitorVipGenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $VisitorVipGenControllerHash,
);
typedef VisitorVipGenControllerRef
    = AutoDisposeAsyncNotifierProviderRef<VisitorTotal?>;

abstract class _$VisitorVipGenController
    extends AutoDisposeAsyncNotifier<VisitorTotal?> {
  @override
  FutureOr<VisitorTotal?> build();
}

String $VisitorRegularGenControllerHash() =>
    r'f36d536f3e3780c89c67d2e479b354a3ac13ef5e';

/// See also [VisitorRegularGenController].
final visitorRegularGenControllerProvider = AutoDisposeAsyncNotifierProvider<
    VisitorRegularGenController, VisitorTotal?>(
  VisitorRegularGenController.new,
  name: r'visitorRegularGenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $VisitorRegularGenControllerHash,
);
typedef VisitorRegularGenControllerRef
    = AutoDisposeAsyncNotifierProviderRef<VisitorTotal?>;

abstract class _$VisitorRegularGenController
    extends AutoDisposeAsyncNotifier<VisitorTotal?> {
  @override
  FutureOr<VisitorTotal?> build();
}
