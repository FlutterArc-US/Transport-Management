// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_verification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$initiateVerificationHash() =>
    r'205936d38aed0e665ecfbb0591971ccb301c7c37';

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

/// See also [initiateVerification].
@ProviderFor(initiateVerification)
const initiateVerificationProvider = InitiateVerificationFamily();

/// See also [initiateVerification].
class InitiateVerificationFamily extends Family<AsyncValue<void>> {
  /// See also [initiateVerification].
  const InitiateVerificationFamily();

  /// See also [initiateVerification].
  InitiateVerificationProvider call(
    String phone,
  ) {
    return InitiateVerificationProvider(
      phone,
    );
  }

  @override
  InitiateVerificationProvider getProviderOverride(
    covariant InitiateVerificationProvider provider,
  ) {
    return call(
      provider.phone,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'initiateVerificationProvider';
}

/// See also [initiateVerification].
class InitiateVerificationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [initiateVerification].
  InitiateVerificationProvider(
    String phone,
  ) : this._internal(
          (ref) => initiateVerification(
            ref as InitiateVerificationRef,
            phone,
          ),
          from: initiateVerificationProvider,
          name: r'initiateVerificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$initiateVerificationHash,
          dependencies: InitiateVerificationFamily._dependencies,
          allTransitiveDependencies:
              InitiateVerificationFamily._allTransitiveDependencies,
          phone: phone,
        );

  InitiateVerificationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phone,
  }) : super.internal();

  final String phone;

  @override
  Override overrideWith(
    FutureOr<void> Function(InitiateVerificationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InitiateVerificationProvider._internal(
        (ref) => create(ref as InitiateVerificationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phone: phone,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _InitiateVerificationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InitiateVerificationProvider && other.phone == phone;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InitiateVerificationRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `phone` of this provider.
  String get phone;
}

class _InitiateVerificationProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with InitiateVerificationRef {
  _InitiateVerificationProviderElement(super.provider);

  @override
  String get phone => (origin as InitiateVerificationProvider).phone;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
