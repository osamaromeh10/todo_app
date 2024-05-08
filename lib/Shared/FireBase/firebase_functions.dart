import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/Models/task_model.dart';
import 'package:todo_app/Models/user_model.dart';

class FireBaseFunctions {
  static Future<void> addTask(TaskModel taskModel) async {
    var collection = getTasksCollections();
    var docRef = collection.doc();   //if you make id manual doc("1");  but now is Generated
    taskModel.id = docRef.id;
    docRef.set(taskModel);
  }
  static CollectionReference<TaskModel> getTasksCollections() {
    return FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _){
        return value.toJson();
      },

    );
  }
  static CollectionReference<userModel> getUserCollections() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<userModel>(
      fromFirestore: (snapshot, _) {
        return userModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.tojson();
      },
    );
  }
  static void updateTask(TaskModel task) {
    getTasksCollections().doc(task.id).update(task.toJson());
  }
  static deleteTask(String id) {
    getTasksCollections().doc(id).delete();
  }
  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    return getTasksCollections()
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("date", isEqualTo: dateTime.microsecondsSinceEpoch)
        .snapshots();
  }

//Firebase Auth
  static Future<void> addUserToFirestore(userModel usermodel) {
    var collection = getUserCollections();
    var docRef = collection.doc(usermodel.id);
    return docRef.set(usermodel);
  }

  static Future<void> createUser(String name, int age, String email, String password, Function onSuccess, Function onErorr) async {
    try {
      final credential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.uid != null) {
        userModel user = userModel(
            id: credential.user!.uid, name: name, email: email, age: age);
        addUserToFirestore(user).then((value) {
          onSuccess();
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onErorr(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onErorr(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
static Future<void>login(String email,String  password,Function onSuccess,Function onError)async {
    try{
final credential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
    password: password);

if(credential.user?.uid!=null){
  onSuccess();
}
    }on FirebaseAuthException catch (e){
      if(e.code=="user_not_found"){
        onError(e.message);
      }
    }

}
  static Future<userModel?> readUserFromFirestore(String id) async {
    DocumentSnapshot<userModel> doc = await getUserCollections().doc(id).get();
    return doc.data();
  }
}
