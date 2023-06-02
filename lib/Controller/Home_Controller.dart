import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ref = FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetData();
  }

  //initialize variable
    String name = '';
    String phone = '';
    String email = '';
    String photo='';
  Future<void> GetData() async {

    User? user = FirebaseAuth.instance.currentUser;
    name =user?.displayName?? '';
    phone =user?.phoneNumber?? '-----------';
    email =user?.email?? '';

    photo = user?.photoURL??'https://commons.wikimedia.org/wiki/File:Unknown_person.jpg';

    print('phone:$phone');

    //get uid
    // String UID = '';
    // if (user != null) {
    //   UID = user.uid;
    //   print(UID);
    // } else {
    //   print('No user is currently authenticated');
    // }


    // DatabaseEvent event =
    //     await ref.child('UserData').child('ProfileData').child(UID).once();
    // if (event.snapshot.value != null) {
    //   final data = event.snapshot.value as Map<dynamic, dynamic>;
    //   name = data['name'];
    //   phone = data['phone'];
    //   email = data['email'];
    // } else {
    //   print('Email not found or snapshot is empty');
    //   return null; // Handle the case when email is not found
    // }
  }
}
