import 'package:flutter/material.dart';
import 'package:osip_app/infra/db/gtfs_database.dart';
import 'package:osip_app/screens/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGtfsDatabase();
  
  runApp(const AppCore());
}

class AppCore extends StatelessWidget {
  const AppCore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
