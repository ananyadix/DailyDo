import 'package:ecommerce/Models/category_model.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProductController extends GetxController{
  var subCategory=[];
  var quantity=0.obs;
  var cost=0.obs;
  var isFavorite=false.obs;
  getSubcategory(title) async{
    subCategory.clear();
    var data=await rootBundle.loadString("lib/services/category.json");
    var decode=categoryFromJson(data);
    var s=decode.categories.where((element) => element.name==title).toList();
    for(var e in s[0].subcategory){
      subCategory.add(e);
    }
  }
  incQty(total){
    if(quantity.value<total){
      quantity.value++;
    }
  }
  decQty(){
    if(quantity.value>0){
      quantity.value--;
    }
  }
  totalCost(price){
    cost.value=price*quantity.value;
  }
  addToCart(title,img,qty,price,context) async{
    await firestore.collection(cartCollection).doc().set({
      'title':title,
      'img':img,
      'qty':qty,
      'price':price,
      'added_by':currentUser!.uid
    }).catchError((e){
      VxToast.show(context, msg: e.toString());
    });
  }
  resetValues(){
    cost.value=0;
    quantity.value=0;
  }
  addToWishlist(docId,context) async{
    await firestore.collection(productsCollection).doc(docId).set({'p_wishlist':FieldValue.arrayUnion([currentUser!.uid])},SetOptions(merge:true));
    isFavorite(true);
    VxToast.show(context, msg: "Added to Wishlist");
  }
  removeFromWishlist(docId,context) async{
    await firestore.collection(productsCollection).doc(docId).set({'p_wishlist':FieldValue.arrayRemove([currentUser!.uid])},SetOptions(merge:true));
    isFavorite(false);
    VxToast.show(context, msg: "Removed from Wishlist");
  }
  checkIfFavourite(data) async{
    if(data['p_wishlist'].contains(currentUser!.uid)){
      isFavorite(true);
    }
    else{
      isFavorite(false);
    }
  }
}