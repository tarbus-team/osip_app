import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:osip_app/bloc/screens/splash_screen/splash_screen_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenCubit cubit = SplashScreenCubit();
  
  @override
  void initState() {
    super.initState();
    cubit.init();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}