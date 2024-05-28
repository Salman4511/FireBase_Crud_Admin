import 'package:flutter/material.dart';

class SignUpTextFormFieldWidget extends StatelessWidget {
  const SignUpTextFormFieldWidget({
    super.key,
   required this.controller, required this.label, this.validator, required this.prefixIcon, required this.isSuffixRequired, this.suffixIconOnPressed,
  });

  final TextEditingController controller;
  final String label;
 final String? Function(String?)? validator;
 final IconData prefixIcon;
 final bool isSuffixRequired;
final void Function()?  suffixIconOnPressed;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      decoration:  InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        prefixIcon:  Icon(prefixIcon),
        suffixIcon
            :isSuffixRequired? IconButton(
                icon: const Icon(Icons.visibility),
                onPressed:suffixIconOnPressed
              ):null
      ),
      validator: validator,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    );
  }
}
