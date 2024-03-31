import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Models/user_model.dart';
import 'package:todo_app/Shared/FireBase/firebase_functions.dart';

class MyProvider extends ChangeNotifier{
 userModel? usermodel;
 User? firebaseUser;
 MyProvider(){
   firebaseUser=FirebaseAuth.instance.currentUser;
   if(firebaseUser !=null){
     initUser();
   }
 }
 initUser()async{
  firebaseUser= FirebaseAuth.instance.currentUser;
   usermodel =await FireBaseFunctions.readUserFromFirestore(firebaseUser!.uid);
   notifyListeners();


 }
}