import 'package:auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final user = Provider.of<User>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(user.email),
          ElevatedButton(
            child: const Text('Sign Out'),
            onPressed: () async {
              final msg = await auth.signOut();
              Fluttertoast.showToast(msg: msg);
            },
          ),
        ],
      ),
    );
  }
}
