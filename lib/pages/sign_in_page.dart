import 'package:auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final auth = Provider.of<AuthService>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            child: const Text('Sign In'),
            onPressed: () async {
              final msg = await auth.signIn(
                email: emailController.text,
                password: passwordController.text,
              );
              Fluttertoast.showToast(msg: msg);
            },
          ),
        ],
      ),
    );
  }
}
