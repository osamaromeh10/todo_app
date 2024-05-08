import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/task_model.dart';
import 'package:todo_app/Screens/Tasks/Edit_task.dart';
import 'package:todo_app/Shared/Styles/app_Colors.dart';
import 'package:todo_app/Shared/FireBase/firebase_functions.dart';

import '../../Providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';


class TaskItem extends StatelessWidget {
 TaskModel task;


 TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
     var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Slidable(
          startActionPane: ActionPane(motion: const DrawerMotion(), children: [
            SlidableAction(
              onPressed: (context) {
                FireBaseFunctions.deleteTask(task.id??"");
              },
              label: AppLocalizations.of(context)!.delete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13), topRight: Radius.circular(13)),
            ),
            SlidableAction(
            onPressed: (context) {
     Navigator.pushNamed(context, editTaskScreen.routeName,arguments:task );
            },
              label: AppLocalizations.of(context)!.edit,
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(13), topRight: Radius.circular(13)),
            ),
          ]),
          child:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 3,
                  decoration: BoxDecoration(
                     color: primaryColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title??"",style: TextStyle(
                   color: primaryColor
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(task.Description??""),

                  ],
                ),
                const Spacer(),
               task.isDone?
               Container(

                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                 decoration: BoxDecoration(
                     color: Colors.green,
                     borderRadius: BorderRadius.circular(8)
                 ),
                 child: Text("Done!",style: GoogleFonts.lato(
                   color: Colors.white
                 )),
               )
               :InkWell(
                 onTap: () {
                   task.isDone=true;
                   FireBaseFunctions.updateTask(task);
                 },
                 child:
                 Container(

                   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                   decoration: BoxDecoration(
                       color: Colors.blue,
                     borderRadius: BorderRadius.circular(8)
                   ),
                   child: Icon(Icons.done,color: Colors.white),
                 ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
