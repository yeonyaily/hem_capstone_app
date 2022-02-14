import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hem_capstone_app/public_health_info.dart';
import 'package:tilko_plugin/tilko_plugin.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PublicHealthInfo());
  TilkoPlugin.requestPermission();
}
