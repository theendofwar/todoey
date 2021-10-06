import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/LoginModel.dart';
import 'package:todoey/model/auth_service.dart';

class SignUpPage extends StatelessWidget {
  final _signKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    // This control model is used for both password and confirm password field

    final authService = Provider.of<AuthService>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginModel(),
      builder: (context, widget) {
        final model = Provider.of<LoginModel>(context);
        return Scaffold(
          body: FormBuilder(
            key: _signKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SignUpTextField(
                    name: 'username',
                    hintText: 'Username:',
                    prefixIcon: Icons.email,
                    suffixIconData: Icons.email,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SignUpTextField(
                    suffixIconData: model.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    obscureText: model.isVisible ? false : true,
                    name: 'password',
                    hintText: 'Password:',
                    prefixIcon: Icons.lock,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SignUpTextField(
                      name: 'repeatPassword',
                      hintText: 'Confirm Password:',
                      prefixIcon: Icons.lock,
                      suffixIconData: model.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      obscureText: model.isVisible ? false : true,
                      // this validator will check if password match the repeatPassword
                      validator: (value) {
                        final str =
                            _signKey.currentState!.fields["password"]!.value;
                        if (str != value) {
                          return 'password not equal';
                        } else {
                          return null;
                        }
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    // The onPressed button would pop up a snackbar and show all the text fields.
                    // if not valid, it won't save the fields.
                    onPressed: () async {
                      final valid = _signKey.currentState!.validate();
                      if (valid) {
                        _signKey.currentState!.save();
                      }

                      final allField = _signKey.currentState!.value;
                      await authService.createWithEmailandPassword(
                          allField['username'], allField['password']);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('allField: $allField ')));
                    },
                    child: Text('Read Content')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back to LogIn'))
              ],
            ),
          ),
        );
      },
    );
  }
}

//This class is an extension of textfield, for my own customization.
class SignUpTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final String name;
  final validator;
  final bool obscureText;
  final IconData suffixIconData;
  const SignUpTextField({
    required this.hintText,
    required this.prefixIcon,
    required this.name,
    this.validator,
    this.obscureText = false,
    required this.suffixIconData,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);

    return FormBuilderTextField(
        name: name,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey)),
            filled: true,
            prefixIcon: Icon(
              prefixIcon,
              size: 18,
              color: Colors.blue,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                model.isVisible = !model.isVisible;
              },
              child: Icon(
                suffixIconData,
                size: 18,
                color: Colors.blue,
              ),
            )),
        validator: validator);
  }
}
