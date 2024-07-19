import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_design_login_register/firebase_options.dart';
import 'package:ui_design_login_register/services/auth_service.dart';

Future<void> setUpFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> registerService() async {
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthService>(AuthService());
}
