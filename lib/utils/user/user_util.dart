import 'package:hem_capstone_app/models/user_model.dart';

class UserUtil {
  static UserModel? _user;
  static void setUser(UserModel user) {
    _user = user;
  }
  static UserModel? getUser() {
    return _user!;
  }
}
