import 'package:flutter/material.dart';
// widgets
import 'package:silent_treatment/widgets/rounded_button.dart';
import 'package:silent_treatment/widgets/rounded_text_form_field.dart';

// pages
import 'package:silent_treatment/main.dart';

class CompromisePage extends StatefulWidget {
  const CompromisePage({super.key});

  @override
  State<CompromisePage> createState() => _CompromisePageState();
}
  class _CompromisePageState extends State<CompromisePage> {

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.amber
        ),
    );
  }
}