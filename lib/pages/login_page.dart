import 'package:first_app/components/my_button.dart';
import 'package:first_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  //text controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.food_bank ,
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
            //email field
            MyTextField(
                controller: passwordController,
                hinText: "Password",
                obscureText: true),

            const SizedBox(height: 10),
            //sign in
            MyButton(
              text: "Sign In",
              onTap: () {},
            ),
          ],
        )
      )
    );
  }
}
