// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_load_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookLoadHash() => r'd2dd35df69cb6655f2a4196dbc69811d10000171';

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

/// See also [bookLoad].
@ProviderFor(bookLoad)
const bookLoadProvider = BookLoadFamily();

/// See also [bookLoad].
class BookLoadFamily extends Family<AsyncValue<void>> {
  /// See also [bookLoad].
  const BookLoadFamily();

  /// See also [bookLoad].
  BookLoadProvider call(
    int loadId,
  ) {
    return BookLoadProvider(
      loadId,
    );
  }

  @override
  BookLoadProvider getProviderOverride(
    covariant BookLoadProvider provider,
  ) {
    return call(
      provider.loadId,
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
  String? get name => r'bookLoadProvider';
}

/// See also [bookLoad].
class BookLoadProvider extends AutoDisposeFutureProvider<void> {
  /// See also [bookLoad].
  BookLoadProvider(
    int loadId,
  ) : this._internal(
          (ref) => bookLoad(
            ref as BookLoadRef,
            loadId,
          ),
          from: bookLoadProvider,
          name: r'bookLoadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookLoadHash,
          dependencies: BookLoadFamily._dependencies,
          allTransitiveDependencies: BookLoadFamily._allTransitiveDependencies,
          loadId: loadId,
        );

  BookLoadProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.loadId,
  }) : super.internal();

  final int loadId;

  @override
  Override overrideWith(
    FutureOr<void> Function(BookLoadRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BookLoadProvider._internal(
        (ref) => create(ref as BookLoadRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        loadId: loadId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _BookLoadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookLoadProvider && other.loadId == loadId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, loadId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookLoadRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `loadId` of this provider.
  int get loadId;
}

class _BookLoadProviderElement extends AutoDisposeFutureProviderElement<void>
    with BookLoadRef {
  _BookLoadProviderElement(super.provider);

  @override
  int get loadId => (origin as BookLoadProvider).loadId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
