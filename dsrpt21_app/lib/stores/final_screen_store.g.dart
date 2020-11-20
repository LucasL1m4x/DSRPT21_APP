// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VitrineStore on _VitrineStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_VitrineStoreBase.loading'))
      .value;
  Computed<bool> _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_VitrineStoreBase.hasError'))
          .value;

  final _$productsAtom = Atom(name: '_VitrineStoreBase.products');

  @override
  ObservableFuture<List<Product>> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableFuture<List<Product>> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$_VitrineStoreBaseActionController =
      ActionController(name: '_VitrineStoreBase');

  @override
  void reload() {
    final _$actionInfo = _$_VitrineStoreBaseActionController.startAction(
        name: '_VitrineStoreBase.reload');
    try {
      return super.reload();
    } finally {
      _$_VitrineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
loading: ${loading},
hasError: ${hasError}
    ''';
  }
}
