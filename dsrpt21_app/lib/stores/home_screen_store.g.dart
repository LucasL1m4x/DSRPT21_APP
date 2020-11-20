// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompraStore on _CompraStoreBase, Store {
  Computed<int> _$countItemsComputed;

  @override
  int get countItems =>
      (_$countItemsComputed ??= Computed<int>(() => super.countItems,
              name: '_CompraStoreBase.countItems'))
          .value;
  Computed<double> _$totalComputed;

  @override
  double get total => (_$totalComputed ??=
          Computed<double>(() => super.total, name: '_CompraStoreBase.total'))
      .value;

  final _$selectedItemsAtom = Atom(name: '_CompraStoreBase.selectedItems');

  @override
  ObservableList<ItemsStore> get selectedItems {
    _$selectedItemsAtom.reportRead();
    return super.selectedItems;
  }

  @override
  set selectedItems(ObservableList<ItemsStore> value) {
    _$selectedItemsAtom.reportWrite(value, super.selectedItems, () {
      super.selectedItems = value;
    });
  }

  final _$_CompraStoreBaseActionController =
      ActionController(name: '_CompraStoreBase');

  @override
  void add(Product product) {
    final _$actionInfo = _$_CompraStoreBaseActionController.startAction(
        name: '_CompraStoreBase.add');
    try {
      return super.add(product);
    } finally {
      _$_CompraStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(ItemsStore item) {
    final _$actionInfo = _$_CompraStoreBaseActionController.startAction(
        name: '_CompraStoreBase.remove');
    try {
      return super.remove(item);
    } finally {
      _$_CompraStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedItems: ${selectedItems},
countItems: ${countItems},
total: ${total}
    ''';
  }
}
