import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/task_model.dart';
import 'package:todo_app/Shared/FireBase/firebase_functions.dart';
import 'package:todo_app/Shared/Styles/app_Colors.dart';

import '../../Providers/my_provider.dart';
import '../../Shared/Styles/app_Fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
             AppLocalizations.of(context)!.addNewTask,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: pro.modeApp==ThemeMode.light?Colors.black:whiteColor),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppFonts.validatorTitle;
                }
                return null;
              },
              controller: titleController,
              decoration: InputDecoration(
                  label:  Text(AppLocalizations.of(context)!.taskTitle,style: TextStyle(
                    color: pro.modeApp==ThemeMode.light?Colors.grey:whiteColor
                  )),
                  border:
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:  BorderSide(color: pro.modeApp==ThemeMode.light?Colors.blueAccent:whiteColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:  BorderSide(color: pro.modeApp==ThemeMode.light?Colors.blueAccent:Colors.white))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppFonts.validatorDescription;
                }
                return null;
              },
              controller: descriptionController,
              decoration: InputDecoration(
                  label:  Text(AppLocalizations.of(context)!.taskDescription,style: TextStyle(color: pro.modeApp==ThemeMode.light?Colors.grey:whiteColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:  BorderSide(color: pro.modeApp==ThemeMode.light?Colors.blueAccent:whiteColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:  BorderSide(color:pro.modeApp==ThemeMode.light? Colors.blueAccent:whiteColor))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.selectedDate,
              style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: pro.modeApp==ThemeMode.light?Colors.black:whiteColor),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                selectDate(context);
              },
              child: Text(
                selectedDate.toString().substring(0, 10),
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: pro.modeApp==ThemeMode.light?Colors.blueAccent:whiteColor),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),side: const BorderSide(
          color: Colors.transparent
      )
      ))
    ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {


                    TaskModel taskModel = TaskModel(
                      userId: FirebaseAuth.instance.currentUser!.uid,
                        title: titleController.text,
                        Description: descriptionController.text,
                        date: DateUtils.dateOnly(selectedDate)
                            .microsecondsSinceEpoch);
                   FireBaseFunctions.addTask(taskModel);
                      Navigator.pop(context);

                  }
                },
                child:  Text(AppLocalizations.of(context)!.saveTask))
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ));
    if(chosenDate==null){
      return ;
    }

    setState(() {
      selectedDate=chosenDate;
    });

    }
  }

