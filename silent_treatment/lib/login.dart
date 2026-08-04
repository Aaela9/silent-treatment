import 'package:flutter/material.dart';
import 'package:silent_treatment/widgets/rounded_button.dart';
import 'package:silent_treatment/main.dart';

void main() {
  runApp(const App());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding( 
          padding: EdgeInsets.all(10.0),
          child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: RoundedCircularButton(
                    text: 'Login', 
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage(title: 'Silent Treatment',)),
                  );
                                },
                              ),
                ), 
          ),
        ),
      ),
    );
  }
}
// Figure out UI theme first

// Required:

// username
// OR
// email -- extra steps refer to other project

// password

// sign up page
