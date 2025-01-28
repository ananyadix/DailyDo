import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController{
  var emailC=TextEditingController();
  var passwordC=TextEditingController();
  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;
    try{
      userCredential=await auth.signInWithEmailAndPassword(email: emailC.text, password: passwordC.text);
    }
    on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  Future<UserCredential?> signupMethod({email,password,context}) async{
    UserCredential? userCredential;
    try{
      userCredential=await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  storeUserData({uname,uemail,upassword}){
    DocumentReference store=firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({uname,upassword,uemail,''});
  }
  signOut(context) async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}