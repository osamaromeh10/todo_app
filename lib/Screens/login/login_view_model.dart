import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Screens/login/Login_Connector.dart';
import 'package:todo_app/base.dart';

class LoginViewModel extends BaseViewModel<LoginConnector>{

  // This Class Contain a Logic of Login
 Future<void>login(String email,String password)async{
   connector?.showLoading("");
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(credential.user?.uid!=null){

     connector!.hidePopup();
     connector!.goToHome();
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
    connector!.hidePopup();
connector!.showMessage("Wrong Email Or Password");



    }
  }

}