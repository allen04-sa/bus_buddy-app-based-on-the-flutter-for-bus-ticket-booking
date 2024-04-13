import 'package:bus_buddy/firebase_options.dart';
import 'package:bus_buddy/providers/app_provider.dart';
import 'package:bus_buddy/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(Authenticationrepository())); */
  //SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Supabase.initialize(
      url: 'https://slegdqmdyihkvwjvtpva.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNsZWdkcW1keWloa3Z3anZ0cHZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE5NzAyNTgsImV4cCI6MjAyNzU0NjI1OH0.B6rB3CiBZq0dZMtj93de_2GPWi3WYTqhhgl_d_Q62-k');
  runApp(MyApp());
}

/*class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
    /* MultiProvider(
        providers: AppProviders.providers, child: const MyApp());*/
  }
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}
