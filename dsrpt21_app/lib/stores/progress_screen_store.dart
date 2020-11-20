import 'package:dsrpt21_app/screens/progress_screen.dart';
import 'package:dsrpt21_app/stores/final_screen_store.dart';
import 'package:dsrpt21_app/stores/home_screen_store.dart';
import 'package:mobx/mobx.dart';
part 'progress_screen_store.g.dart';

class ProgressScreenStore = _ItemsStoreBase with _$ItemsStore;

abstract class _ItemsStoreBase with Store {
  _ItemsStoreBase(this.product);

  final ProgressScreen product;

  @observable
  int quantity = 1;

  @computed
  double get total => quantity * product.price;

  @action
  void increment() {
    quantity++;
  }

  @action
  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }

  @override
  int get hashCode => product.hashCode;

  @override
  bool operator ==(other) => other is ItemsStore && other.product == product;
}
