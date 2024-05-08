import 'package:calendar_timeline/calendar_timeline.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/task_model.dart';

import 'package:todo_app/Screens/Tasks/task_item.dart';
import 'package:todo_app/Shared/FireBase/firebase_functions.dart';
import 'package:todo_app/Shared/Styles/app_Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Providers/my_provider.dart';


class TasksTab extends StatefulWidget {
  static const String routeName = "Taskstap";

  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);


    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10 ,),
              CalendarTimeline(

                initialDate: selectedDate,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
                leftMargin: 25,
                monthColor: pro.modeApp==ThemeMode.light?primaryColor:whiteColor,
                dayColor:pro.modeApp==ThemeMode.light? primaryColor.withOpacity(0.70):Colors.white,
                activeDayColor: whiteColor,
                activeBackgroundDayColor: pro.modeApp==ThemeMode.light?primaryColor:primaryColor,
                dotsColor: pro.modeApp==ThemeMode.light?whiteColor:secondaryColor,
                selectableDayPredicate: (date) => true,
                locale:pro.languageCode,
              ),
              StreamBuilder(
                stream: FireBaseFunctions.getTasks(selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }
                  List<TaskModel> tasks =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  if (tasks.isEmpty) {
                    return const Center(child: Text("No Tasks"));
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return TaskItem(task: tasks[index]);
                      },
                      itemCount: tasks.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


