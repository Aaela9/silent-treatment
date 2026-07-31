import 'package:flutter/material.dart';

class RoundedCircularButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // This will accept the function to call when pressed

  const RoundedCircularButton({
    super.key,
    required this.text,
    required this.onPressed, // Add onPressed as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Use the passed callback
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
