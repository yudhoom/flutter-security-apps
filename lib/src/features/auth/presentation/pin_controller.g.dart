// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_controller.dart';

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

String $PinCreationGenControllerHash() =>
    r'5748ee92ed6ea64cac58d7407278a9d54bcc9aec';

/// See also [PinCreationGenController].
final pinCreationGenControllerProvider =
    AutoDisposeAsyncNotifierProvider<PinCreationGenController, JwtDomain?>(
  PinCreationGenController.new,
  name: r'pinCreationGenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $PinCreationGenControllerHash,
);
typedef PinCreationGenControllerRef
    = AutoDisposeAsyncNotifierProviderRef<JwtDomain?>;

abstract class _$PinCreationGenController
    extends AutoDisposeAsyncNotifier<JwtDomain?> {
  @override
  FutureOr<JwtDomain?> build();
}

String $ValidateDefaultPinGenControllerHash() =>
    r'9df576e1e08b0a35c988f44dc008ae2ce43337b3';

/// See also [ValidateDefaultPinGenController].
final validateDefaultPinGenControllerProvider =
    AutoDisposeAsyncNotifierProvider<ValidateDefaultPinGenController,
        JwtDomain?>(
  ValidateDefaultPinGenController.new,
  name: r'validateDefaultPinGenControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $ValidateDefaultPinGenControllerHash,
);
typedef ValidateDefaultPinGenControllerRef
    = AutoDisposeAsyncNotifierProviderRef<JwtDomain?>;

abstract class _$ValidateDefaultPinGenController
    extends AutoDisposeAsyncNotifier<JwtDomain?> {
  @override
  FutureOr<JwtDomain?> build();
}
