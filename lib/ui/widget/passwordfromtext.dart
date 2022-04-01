import 'package:flutter/material.dart';
import 'package:foodme/constant/colors.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constant/padding.dart';

class PasswordUserFormFiled extends StatefulWidget {
  const PasswordUserFormFiled(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.validator})
      : super(key: key);

  final String hintText;

  final IconData icon;
  final FieldValidator validator;

  @override
  State<PasswordUserFormFiled> createState() => _PasswordFormFiledState();
}

bool _isPasswordVision = true;

class _PasswordFormFiledState extends State<PasswordUserFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        }
      },
      obscureText: _isPasswordVision,
      decoration: InputDecoration(
        filled: true,
        fillColor: textFieldBg,
        prefixIcon: const Padding(
            padding: EdgeInsets.only(
              left: leftMainPadding,
              right: rightMainPadding * 0.75,
            ),
            child: Icon(
              Icons.lock,
              size: 22,
              color: Colors.black,
            )),
        suffixIcon: Padding(
          padding: EdgeInsets.only(left: leftMainPadding * 0.4),
          child: IconButton(
            icon: Icon(
              _isPasswordVision ? Icons.visibility : Icons.visibility_off,
              size: 22,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVision = !_isPasswordVision;
              });
            },
          ),
        ),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
