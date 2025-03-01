import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController{
var isLoading=false.obs;
var nameC=TextEditingController();
var passC=TextEditingController();
var oldPassC=TextEditingController();
updateProfile(name,password) async{
  var store=firestore.collection(userCollection).doc(currentUser!.uid);
  await store.set({
    "name": name,
    "password": password
  }, SetOptions(merge: true));
isLoading=false.obs;
}

changeAuthPassword(email,password,newPassword) async{
  final cred=EmailAuthProvider.credential(email: email, password: password);
  await currentUser!.reauthenticateWithCredential(cred).then((value) {
    currentUser!.updatePassword(newPassword);
  }).catchError((error){
    print(error.toString());
  });
}
}