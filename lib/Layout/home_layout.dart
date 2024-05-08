import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Providers/my_provider.dart';


import 'package:todo_app/Screens/Tasks/tasks_tab.dart';


import 'package:todo_app/Shared/Styles/app_Colors.dart';
import '../Screens/Setting_Screen/settings_tab.dart';
import '../Screens/Tasks/addtas_bottomSheet.dart';
import '../Screens/login/login_Screen.dart';
import '../Shared/Styles/app_Icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> tabs = [TasksTab(), const SettingTab()];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(

     extendBody: true, // To Extend The Body on The Back Of BottomNavBar
      appBar: AppBar(

        title:  Text(
         AppLocalizations.of(context)!.appBarTitle,
          style: GoogleFonts.lato(
            color: pro.modeApp==ThemeMode.light?Colors.white:secondaryColor,fontSize: 20,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.routeName, (route) => false);
                FirebaseAuth.instance.signOut();
              },
              icon: AppIcons.logout)
        ],
      ),
      //AppBar
      body: tabs[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
backgroundColor: primaryColor,
        onPressed: () {
          _showModalSheet(context);
        },
        shape:  CircleBorder(
          side: BorderSide(color: Colors.white, width: 3),
        ),
        child: AppIcons.addTask,

      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        color: pro.modeApp==ThemeMode.light?whiteColor:Color(0xff707070),
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: pro.modeApp==ThemeMode.light?transparentColor:secondaryColor.withOpacity(0.6),
          elevation: 0.0,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon: AppIcons.list, label: ""),
            BottomNavigationBarItem(icon: AppIcons.setting, label: ""),
          ],
        ),
      ),
    );
  }

  _showModalSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskBottomSheet(),
        );
      },
    );
  }
}
