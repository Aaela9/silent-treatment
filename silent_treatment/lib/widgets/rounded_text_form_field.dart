import 'package:flutter/material.dart';

class RoundedTextFormField extends StatelessWidget {

  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  // ignore: prefer_typing_uninitialized_variables
  final controller;

  const RoundedTextFormField({super.key, required this.prefixIcon, required this.hintText, this.obscureText = false, this.controller, this.onChanged, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
       color: Color.fromRGBO(
          67, 
          71, 
          77, 
          0.38
          ),
          spreadRadius: 2,
          blurRadius: 12,
          offset: Offset(0, 7),
          ),
        ],
      ),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
              ),
            ),
          child: TextFormField(
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.blue,
                ),
              suffixIcon: suffixIcon,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 10,
                  color: 	Color.fromRGBO(
                    131, 
                    143, 
                    160, 
                    100
                    ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}