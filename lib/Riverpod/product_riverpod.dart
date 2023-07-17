import 'package:flutter/material.dart';
import 'package:streetanimals/models/product_info.dart';
import 'package:streetanimals/utils/db_firebase.dart';

class productProvider extends ChangeNotifier {
  Productinfo ? product;
  List<Productinfo> ? products ;
  bool? state ;
  double totalCoin = 0;

  Future refreshProducts() async {
     products = await dbFirebase().readProducts();
     return products;
  }

  void setProduct(Productinfo product){
    this.product = product;
    notifyListeners();
  }

  void addTotal(double sayi){
    totalCoin += sayi;
  }
  void resetTotal(){
    totalCoin = 0 ;
  }
  void changeState(){
    state != state;
    notifyListeners();
  }
}