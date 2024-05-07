// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nameHash() => r'aa23bf78f03723b065d178693e4a90727df4614f';

/// See also [name].
@ProviderFor(name)
final nameProvider = AutoDisposeProvider<String>.internal(
  name,
  name: r'nameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NameRef = AutoDisposeProviderRef<String>;
String _$fetchUserHash() => r'693fc700fe921f10864f9ebdeab2f104503895b7';

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

/// See also [fetchUser].
@ProviderFor(fetchUser)
const fetchUserProvider = FetchUserFamily();

/// See also [fetchUser].
class FetchUserFamily extends Family<AsyncValue<User>> {
  /// See also [fetchUser].
  const FetchUserFamily();

  /// See also [fetchUser].
  FetchUserProvider call({
    required String userId,
    required int intValue,
    required bool boolValue,
  }) {
    return FetchUserProvider(
      userId: userId,
      intValue: intValue,
      boolValue: boolValue,
    );
  }

  @override
  FetchUserProvider getProviderOverride(
    covariant FetchUserProvider provider,
  ) {
    return call(
      userId: provider.userId,
      intValue: provider.intValue,
      boolValue: provider.boolValue,
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
  String? get name => r'fetchUserProvider';
}

/// See also [fetchUser].
class FetchUserProvider extends AutoDisposeFutureProvider<User> {
  /// See also [fetchUser].
  FetchUserProvider({
    required String userId,
    required int intValue,
    required bool boolValue,
  }) : this._internal(
          (ref) => fetchUser(
            ref as FetchUserRef,
            userId: userId,
            intValue: intValue,
            boolValue: boolValue,
          ),
          from: fetchUserProvider,
          name: r'fetchUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserHash,
          dependencies: FetchUserFamily._dependencies,
          allTransitiveDependencies: FetchUserFamily._allTransitiveDependencies,
          userId: userId,
          intValue: intValue,
          boolValue: boolValue,
        );

  FetchUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.intValue,
    required this.boolValue,
  }) : super.internal();

  final String userId;
  final int intValue;
  final bool boolValue;

  @override
  Override overrideWith(
    FutureOr<User> Function(FetchUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserProvider._internal(
        (ref) => create(ref as FetchUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        intValue: intValue,
        boolValue: boolValue,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
    return _FetchUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserProvider &&
        other.userId == userId &&
        other.intValue == intValue &&
        other.boolValue == boolValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, intValue.hashCode);
    hash = _SystemHash.combine(hash, boolValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `intValue` of this provider.
  int get intValue;

  /// The parameter `boolValue` of this provider.
  bool get boolValue;
}

class _FetchUserProviderElement extends AutoDisposeFutureProviderElement<User>
    with FetchUserRef {
  _FetchUserProviderElement(super.provider);

  @override
  String get userId => (origin as FetchUserProvider).userId;
  @override
  int get intValue => (origin as FetchUserProvider).intValue;
  @override
  bool get boolValue => (origin as FetchUserProvider).boolValue;
}

String _$streamHash() => r'6c9af351aac20bb62b3cf6d68816676691071040';

/// See also [stream].
@ProviderFor(stream)
final streamProvider = AutoDisposeStreamProvider<Object?>.internal(
  stream,
  name: r'streamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$streamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StreamRef = AutoDisposeStreamProviderRef<Object?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
