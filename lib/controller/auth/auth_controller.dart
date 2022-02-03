import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final _userCollection = firebase.collection('users');

  late Rxn<User?> _user;

  @override
  void onInit() {
    _user = Rxn<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, (_) => Get.toNamed(Routes.START));
    super.onInit();
  }
}
