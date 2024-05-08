
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Providers/my_provider.dart';
import 'Providers/PrefsHelper.dart';
import 'firebase_options.dart';
import 'my_app.dart';





void main()async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
 FirebaseFirestore.instance.disableNetwork();
  runApp( ChangeNotifierProvider(
      create: (context) => MyProvider()..intit(),
      child: const MyApp()));
}


