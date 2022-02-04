part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const INIT = _Paths.INIT;
  static const START = _Paths.START;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const SIGNUP = _Paths.SIGNUP;
}

abstract class _Paths {
  static const INIT = '/';
  static const START = '/start';
  static const DASHBOARD = '/dashboard';
  static const SIGNUP = '/signup';
}
