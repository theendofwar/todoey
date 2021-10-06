import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/LoginModel.dart';
import 'package:todoey/model/auth_service.dart';
import 'package:todoey/widget/helpWidget/roundbutton.dart';
import 'package:todoey/widget/helpWidget/textfieldWidget.dart';

class LoginScreen extends StatelessWidget {
  final uController = TextEditingController();
  final pController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginModel(),
      builder: (context, widget) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ProductName"),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextFieldWidget(
                  hintText: "Username",
                  prefixIconData: Icons.email_outlined,
                  textController: uController,
                  obscureText: false,
                  onchanged: () {},
                  suffixIconData: Icons.email,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextFieldWidget(
                  obscureText:
                      Provider.of<LoginModel>(context).isVisible ? false : true,
                  hintText: "Password",
                  prefixIconData: Icons.lock_outline,
                  textController: pController,
                  suffixIconData: Provider.of<LoginModel>(context).isVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onchanged: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundIconButton(
                      width: 100,
                      height: 60,
                      fillcolor: Colors.blue,
                      hovercolor: Colors.green,
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                      onPressed: () async {
                        await authService.signinWithEmailandPassword(
                            uController.text, pController.text);
                        //httpR.post({"username": uController.text, "password": pController.text});
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "username: ${uController.text}, password: ${pController.text}")));
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RoundIconButton(
                      width: 100,
                      height: 60,
                      fillcolor: Colors.orange,
                      hovercolor: Colors.red,
                      child: Center(
                          child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('SignUpPage'),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
