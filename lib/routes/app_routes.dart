part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const INIT = _Paths.INIT;
  static const START = _Paths.START;
}

abstract class _Paths {
  static const INIT = '/';
  static const START = '/start';
}
