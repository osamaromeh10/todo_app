import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  String label;
  Function()? onTap;

 MyButton({super.key,required this.label,required this.onTap,});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width:  120,
        height: 50,
        decoration: BoxDecoration(
        color: Color(0xff4e5ae8),
          borderRadius: BorderRadius.circular(20)

        ),
        child: Center(
          child: Text(widget.label,style: TextStyle(

          color: Colors.white,
          )),
        ),
      ),

    );
  }
}
