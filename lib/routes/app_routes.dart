part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const INIT = _Paths.INIT;
  static const START = _Paths.START;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const SIGNUP = _Paths.SIGNUP;
  static const CERTCOPY = _Paths.CERTCOPY;
  static const CERTON = _Paths.CERTON;
  static const HELP = _Paths.HELP;
  static const ENTERBIRTH = _Paths.ENTERBIRTH;
  static const ENTERPWD = _Paths.ENTERPWD;
}

abstract class _Paths {
  static const INIT = '/';
  static const START = '/start';
  static const DASHBOARD = '/dashboard';
  static const SIGNUP = '/signup';
  static const CERTCOPY = '/certcopy';
  static const CERTON = '/certon';
  static const HELP = '/help';
  static const ENTERBIRTH = '/enterbirth';
  static const ENTERPWD = '/enterpwd';
}
