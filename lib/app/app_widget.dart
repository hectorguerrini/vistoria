import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';
import 'package:vistoria/app/shared/splash/splash_screen.dart';

class AppWidget extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return OKToast(
              duration: Duration(seconds: 3),
              dismissOtherOnShow: true,
              position: ToastPosition.bottom,
              child: MaterialApp(
                navigatorKey: Modular.navigatorKey,
                title: 'Vistoria',
                theme: ThemeData(
                    primarySwatch: Colors.green, primaryColor: Colors.green),
                initialRoute: '/',
                onGenerateRoute: Modular.generateRoute,
              ),
            );
          }

          return Center(
            child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: CircularProgressIndicator()),
          );
        });
  }
}
