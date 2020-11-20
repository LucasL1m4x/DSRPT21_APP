import 'package:dsrpt21_app/stores/home_screen_store.dart';
import 'package:dsrpt21_app/stores/progress_screen_store.dart';
import 'package:mobx/mobx.dart';
part 'final_screen_store.g.dart';

class FinalScreenStore = _VitrineStoreBase with _$VitrineStore;

abstract class _VitrineStoreBase with Store {
  ProductService _productService = new ProductService();

  _VitrineStoreBase() {
    reload();
  }

  @observable
  ObservableFuture<List<Product>> products = ObservableFuture.value(null);

  @computed
  bool get loading => products.status == FutureStatus.pending;

  @computed
  bool get hasError => products.error != null;

  @action
  void reload() {
    products = _productService.findAll().asObservable();
  }
}

class ProductService {
  findAll() {}
}
