
// Institution Model
import 'package:medicare/expermentaly/model/goodsmodel.dart';
import 'package:medicare/expermentaly/model/supplierModel.dart';
import 'package:medicare/expermentaly/model/walletModel.dart';

class Institution {
  String name;
  String address;
  int id;
  int extraId;
  Wallet wallet;
  List<Goods> inventory = [];
  List<Supplier> distributors = [];

  Institution(this.name, this.address, this.id, this.extraId, double initialBalance)
      : wallet = Wallet();

  void addSupplier(Supplier supplier) {
    distributors.add(supplier);
    supplier.partners.add(this);
    print("$name is now partnered with ${supplier.name}.");
  }

  void receiveGoods(Goods goods) {
    inventory.add(goods);
    print("$name received ${goods.quantity} units of ${goods.name}.");
  }

  void sellGoods(Supplier supplier, String goodsName, int quantity, double sellingPrice) {
    Goods? goods = inventory.firstWhere(
            (item) => item.name == goodsName && item.quantity >= quantity,
        orElse: () => Goods("", 0, 0));

    if (goods.name.isEmpty) {
      print("$name does not have enough stock of $goodsName to sell!");
      return;
    }

    double totalRevenue = sellingPrice * quantity;
    wallet.deposit(totalRevenue);
    goods.quantity -= quantity;

    supplier.addGoods(Goods(goodsName, sellingPrice, quantity));
    print("$name sold $quantity units of $goodsName to ${supplier.name}.");
  }
}
