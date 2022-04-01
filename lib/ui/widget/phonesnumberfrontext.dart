import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constant/colors.dart';
import '../../constant/padding.dart';

class TextFormNumber extends StatelessWidget {
  const TextFormNumber({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  final IconData icon;
  final String hintText;
  final FieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        }
        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
          return 'Enter Valid Phone Number';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.telephoneNumber],
      decoration: InputDecoration(
          filled: true,
          fillColor: textFieldBg,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: leftMainPadding,
              right: rightMainPadding * 0.75,
            ),
            child: Icon(
              icon,
              size: 22,
              color: Colors.black,
            ),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          )),
    );
  }
}
