import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// widgets
import 'package:silent_treatment/widgets/rounded_button.dart';
import 'package:silent_treatment/widgets/rounded_text_form_field.dart';

// pages
import 'package:silent_treatment/main.dart';
import 'package:silent_treatment/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

final storage = FlutterSecureStorage();
bool rememberMe = false;

@override
void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}

Future<void> login(dynamic _emailController, dynamic _passwordController) async {
  String email = _emailController.text.trim();
  String password = _passwordController.text;

  // authentication logic here (e.g., API call, validation, etc.)
  try {
    response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  
  if (response.user != null && mounted) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage(title: 'Silent Treatment')),
      );
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Authentication Failed: ${error.toString()}")),
      );
    }
  }
  
  await storage.write(key: 'username', value: 'flutter_user');
  if (mounted) {
  Navigator.pushReplacement(context,
    MaterialPageRoute(
      builder: (context) => const HomePage(
        title: 'Silent Treatment',
        )
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    return Scaffold(
      body: Center(
        child: Padding( 
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: .spaceBetween,
            children: [
              topButtons(),
              bottomButtons(),
            ]
          ),
        ),
      ),
    );
  }

  Widget topButtons() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        children: [
          // email field
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, top: 12.0),
            child: RoundedTextFormField(
              obscureText: false,
              prefixIcon: Icons.email_outlined,
              suffixIcon: null,
              hintText: "Email Address",
              controller: _emailController,
              ),
            ),
                // password field
            RoundedTextFormField(
                obscureText: true,
                prefixIcon: Icons.password_outlined,
                suffixIcon: null,
                hintText: "Password",
                controller: _passwordController,
              ),
            Row(
              mainAxisAlignment: .end,
              children: [
                Text(
                  style: TextStyle(color: Colors.white60),
                  "Remember me"
                ),
            Checkbox(
              value: rememberMe,
              activeColor: Colors.white60,
              side: const BorderSide(color: Colors.white60),
              onChanged: (bool? value) { // bool tri-state, value can be true, false, or null
                setState(() {
                  rememberMe = value ?? false; // if null, use false
                }
              );
            },
          ),
          ]
        ),
        ]
      )
    );
  }
  Widget bottomButtons() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: RoundedCircularButton(
              text: 'LOGIN', 
              onPressed: () {
                login();
              },
            ),
          ), 
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: .end,
              children: [
                Text("Don't have an account?",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    fontSize: 11.0,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const SignupPage()
                        )
                      );
                    },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero
                  ),
                  child:
                  Text("Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]
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



// i just try to make it look good for now