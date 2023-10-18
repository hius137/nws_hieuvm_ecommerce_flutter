import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/cart_entity.dart';

// .set là ghi đè một field còn .add là thêm một document mới cho collection

class FireStoreService{
  final CollectionReference cartCollectionReference = FirebaseFirestore.instance.collection('cart');

  Future<void> addToCart(CartEntity cartEntity)async {
    try{
      await cartCollectionReference.add(cartEntity.toJson());
    }catch(e){
      debugPrint('err =>>> $e');
    }
  }

  Future<List<CartEntity>> getCart(int id) async {
    final db = FirebaseFirestore.instance;
    List<CartEntity> cartList = [];
    await Future.delayed(const Duration(seconds: 2));
    await db.collection('cart').where('idUser', isEqualTo: id).get().then((value) {
      value.docs.map((e) {
        final cart = CartEntity.fromJson(e.data());
        cartList.add(cart);
      }).toList();
    },);
    return cartList;
  }
}