import 'package:flutter/material.dart';
import 'package:todo_app/Screens/login/login_Screen.dart';
import 'package:todo_app/Screens/login/login_tab.dart';
import 'package:todo_app/Shared/FireBase/firebase_functions.dart';

class SignUpTab extends StatelessWidget {
  static const String routeName = "signup tap";
  final formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                    controller: nameController,
                    style: const TextStyle(color: Colors.black),
                    //Text you will write
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xff475a69)),
                      ),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your Name";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    //Text you will write
                    decoration: InputDecoration(
                      hintText: 'age',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xff475a69)),
                      ),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your age";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    //Text you will write
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xff475a69)),
                      ),
                    ),
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your email";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your password";
                    }
                    return null;
                  },
                  controller: passwordController,
                  style: const TextStyle(color: Colors.black),
                  //Text you will write
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xff475a69)),
                    ),
                  ),

                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        FireBaseFunctions.createUser(
                          nameController.text,
                            int.parse(ageController.text),
                            emailController.text,
                            passwordController.text,
                                (){
                              Navigator.pushNamedAndRemoveUntil(context,LoginScreen.routeName, (route) => false);
                        },(error){
                              showDialog(context: context,
barrierDismissible: false,
                                  builder:(context) => AlertDialog(
                                    title: const Text("Error"),
                                    content: Text(error),
                                    actions: [
                                      ElevatedButton(onPressed: (){
                                        Navigator.pop(context);
                                      },
                                          child: const Text(
                                            "Okay"
                                          )),
                                    ],

                                  ), );
                        });
                      }
                    },
                    child: Text("SignUp"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
