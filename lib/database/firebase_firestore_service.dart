import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/cart_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/notification_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';


class FireStoreService{
  final CollectionReference cartCollectionReference = FirebaseFirestore.instance.collection('cart');
  final CollectionReference notificationCollectionReference = FirebaseFirestore.instance.collection('notification');

  Future<void> addToCart(CartEntity cartEntity)async {
    try{
      await cartCollectionReference.add(cartEntity.toJson());
    }catch(e){
      logger.e('err =>>> $e');
    }
  }

  Future<List<CartEntity>> getCart(int id) async {
    List<CartEntity> cartList = [];
    await Future.delayed(const Duration(seconds: 2));
    await cartCollectionReference.where('idUser', isEqualTo: id).get().then((value) {
      value.docs.map((e) {
        final cart = CartEntity.fromJson(e.data());
        cartList.add(cart);
      }).toList();
    },);
    return cartList;
  }

  Future<void> deleteCart(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    final deleteCarts =  await cartCollectionReference.where('idUser', isEqualTo: id).get();
    final delete = deleteCarts.docs.map((e) => cartCollectionReference.doc(e.id).delete());
    await Future.wait(delete);
  }

  Future<void> setNotification(NotificationEntity notificationEntity)async {
    try{
      await notificationCollectionReference.add(notificationEntity.toJson());
    }catch(e){
      logger.e('err =>>> $e');
    }
  }

  Future<List<NotificationEntity>> getNotification(int id) async {
    List<NotificationEntity> listNotification = [];
    await Future.delayed(const Duration(seconds: 2));
    await notificationCollectionReference.where('idUser', isEqualTo: id).get().then((value) {
      value.docs.map((e) {
        final notification = NotificationEntity.fromJson(e.data());
        listNotification.add(notification);
      }).toList();
    },);
    return listNotification;
  }
}