import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/auth_service.dart';
import 'package:todoey/screen/LoginFolder/loginScreen.dart';
import 'package:todoey/screen/taskScreen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<Myuser?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<Myuser?> snapshot) {
      if (snapshot.connectionState == ConnectionState.active) {
        final Myuser? user = snapshot.data;
        return user == null ? LoginScreen() : TaskScreen();
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
