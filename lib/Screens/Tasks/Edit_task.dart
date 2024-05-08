import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Layout/home_layout.dart';
import 'package:todo_app/Models/task_model.dart';
import 'package:todo_app/Shared/FireBase/firebase_functions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/Shared/Styles/app_Colors.dart';

import '../../Providers/my_provider.dart';

class editTaskScreen extends StatefulWidget {
  static const String routeName = "editscreen";

  @override
  State<editTaskScreen> createState() => _editTaskScreenState();
}

class _editTaskScreenState extends State<editTaskScreen> {
  var selectedDate = DateTime.now();
  TextEditingController editTitle = TextEditingController();

  TextEditingController editDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as TaskModel;

    return Scaffold(
      backgroundColor:
          pro.modeApp == ThemeMode.light ? mintColor : secondaryColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.editTaskScreen),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.editYourTask,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: 23, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: editTitle,
                  onChanged: (value) {
                    args.title = editTitle.text;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Edit The Task ";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                      label: Text(
                        AppLocalizations.of(context)!.editYourTask,
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: pro.modeApp == ThemeMode.light
                                ? Colors.black
                                : Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.blueAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.blueAccent))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: editDescription,
                  onChanged: (value) {
                  args.Description =  editDescription.text;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Edit Task Details ";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                      label: Text(
                        AppLocalizations.of(context)!.editYourDescription,
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: pro.modeApp == ThemeMode.light
                                ? Colors.black
                                : Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.blueAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.blueAccent))),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  AppLocalizations.of(context)!.selectedDate,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 600)));

                    if (date == null) {
                      return;
                    }

                    setState(() {
                      selectedDate = date;
                    });
                  },
                  child: Text(
                    selectedDate.toString().substring(0, 10),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                                const BorderSide(color: Colors.transparent)))),
                    onPressed: ()  {
                      Navigator.pop(context);
                      FireBaseFunctions.updateTask(args);

                    },
                    child: Text(
                      "Save Changes",
                      style:
                          GoogleFonts.lato(fontSize: 20, color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
