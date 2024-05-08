import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class  BaseConnecotr{
  showLoading(String txt);
  showMessage(String message);
  hidePopup();

}
class BaseViewModel<CON extends BaseConnecotr>extends ChangeNotifier{
  CON? connector;


}
abstract class BaseView <VM extends BaseViewModel,S extends StatefulWidget> extends State<S> implements BaseConnecotr{
late VM viewModel;
VM initviewModel();
initState(){
  super.initState();
  viewModel =initviewModel();
}

showLoading(String message) {
  Center(child: CircularProgressIndicator(),);
}
hidePopup() {
  Navigator.pop(context);
}
showMessage(String message) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
              child: Text("Okay"))
        ],
      ));
}
}