import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/LoginModel.dart';
import 'package:todoey/model/auth_service.dart';
import 'package:todoey/model/taskModel.dart';

import 'package:todoey/screen/LoginFolder/loginScreen.dart';
import 'package:todoey/screen/LoginFolder/signUp.dart';
import 'package:todoey/screen/LoginFolder/wrapper.dart';
import 'package:todoey/screen/taskScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(create: (_)=>TaskModel())
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          'loginScreen': (context) => LoginScreen(),
          'taskScreen': (context) => TaskScreen(),
          'SignUpPage': (context) => SignUpPage(),
        },
      ),
    );
  }
}
