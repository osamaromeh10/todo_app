import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Models/user_model.dart';
import 'package:todo_app/Shared/FireBase/firebase_functions.dart';

import 'PrefsHelper.dart';

class MyProvider extends ChangeNotifier{
  String languageCode = "en";
  ThemeMode modeApp=ThemeMode.light;
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
 void intit()async{
   String? newLang=PrefsHelper.getLanguage();
   changeLanguage(newLang??"en");
   String mode=PrefsHelper.getMode();
   if(mode=="dark"){
     changeTheme(ThemeMode.dark);
   }else{
     changeTheme(ThemeMode.light);
   }
 }
 void changeLanguage(String langCode) {
   languageCode = langCode;
   PrefsHelper.saveLanguage(langCode);
   notifyListeners();
 }
 changeTheme(ThemeMode mode){
   modeApp=mode;
   if(mode ==ThemeMode.dark){
     PrefsHelper.saveTheme("dark");
   }else{
     PrefsHelper.saveTheme("light");
   }
   notifyListeners();
 }
}