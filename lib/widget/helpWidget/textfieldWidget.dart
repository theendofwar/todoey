import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/LoginModel.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onchanged;
  final TextEditingController textController;

  const TextFieldWidget(
      {required this.hintText,
      required this.prefixIconData,
      required this.suffixIconData,
      required this.obscureText,
      required this.onchanged,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);

    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            prefixIconData,
            size: 18,
            color: Colors.blue,
          ),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey)),
          filled: true,
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
      controller: textController,
      obscureText: obscureText,
    );
  }
}
