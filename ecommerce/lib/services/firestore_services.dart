import 'package:ecommerce/consts/consts.dart';

class FirestoreService{
  static getUser(uid){
    return firestore.collection(userCollection).where('id',isEqualTo: uid).snapshots();
  }

  static getProduct(category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo: category).snapshots();
  }

  static getCart(uid){
    return firestore.collection(cartCollection).where('added_by',isEqualTo: uid).snapshots();
  }

  static deleteItem(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  static getOrders(){
    return firestore.collection(orderCollection).where('order_by',isEqualTo: currentUser!.uid).snapshots();
  }

  static getCount() async {
    var res=await Future.wait([
      firestore.collection(cartCollection).where('added_by',isEqualTo: currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
      firestore.collection(productsCollection).where('p_wishlist',arrayContains: currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
      firestore.collection(orderCollection).where('order_by',isEqualTo: currentUser!.uid).get().then((value){
        return value.docs.length;
      }),
    ]);
    return res;
  }

}



