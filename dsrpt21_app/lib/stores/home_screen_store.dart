import 'package:mobx/mobx.dart';
part 'home_screen_store.g.dart';

class HomeScreenStore = _CompraStoreBase with _$CompraStore;

abstract class _CompraStoreBase with Store {
  @observable
  ObservableList<ItemsStore> selectedItems = <ItemsStore>[].asObservable();

  @computed
  int get countItems => selectedItems.length;

  @computed
  double get total => selectedItems.fold(
      0, (previousValue, element) => previousValue + element.total);

  @action
  void add(Product product) {
    selectedItems.add(ItemsStore(product));
  }

  @action
  void remove(ItemsStore item) {
    selectedItems.remove(item);
  }

  bool contains(Product product) {
    if (selectedItems.contains(ItemsStore(product))) {
      return true;
    }
    return false;
  }
}

class Product {}

class ItemsStore {
  ItemsStore(Product product);

  num get total => null;

  get product => null;
}
