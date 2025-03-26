import 'package:first_app/components/my_button.dart';
import 'package:first_app/components/my_textfield.dart';
import 'package:first_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async{
    // auth service er instance
    final _authService = AuthService();

    //sign in try
    try {
      await _authService.signInWithEmailPassword(
        emailController.text, 
        passwordController.text,
      );
    }

    // error display
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
      );
    }
  }

  //forgot password
  void forgotPw() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text("User Tapped Forgot Password."),
        ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(
                  // ekhane image dewa lagbe
                  Icons.food_bank,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                    
                const SizedBox(height: 15),
                    
                Text(
                  "Ahar Express",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                  ),
                ),
                    
                const SizedBox(height: 25),
                    
                //email field
                MyTextField(
                    controller: emailController,
                    hinText: "Email",
                    obscureText: false),
                    
                const SizedBox(height: 10),
                    
                //password field
                MyTextField(
                    controller: passwordController,
                    hinText: "Password",
                    obscureText: true),
                    
                const SizedBox(height: 10),
                    
                //sign in button
                MyButton(
                  text: "Sign In",
                  onTap: login,
                ),
                    
                const SizedBox(height: 25),
                    
                //not a member,register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Register Now",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
