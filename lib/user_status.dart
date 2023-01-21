import 'package:aplication_pru/Jobs/jobs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginPage/login_screen.dart';

class UserState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshost) {
        if (userSnapshost.data == null) {
          print('El usuario no ha iniciado sesión todavía');
          return Login();
        } else if (userSnapshost.hasData) {
          print('El usuario ya ha iniciado sesión');
          return JobScreen();
        } else if (userSnapshost.hasError) {
          return const Scaffold(
            body: Center(
              child: Text(
                  'Se ha producido un error. Vuelva a intentarlo más tarde'),
            ),
          );
        } else if (userSnapshost.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: Text('Algo salió mal'),
          ),
        );
      },
    );
  }
}
