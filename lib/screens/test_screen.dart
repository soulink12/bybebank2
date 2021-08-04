import 'package:bybebank2/firestore/webclient.dart';
import 'package:bybebank2/models/contact.dart';
import 'package:bybebank2/models/transaction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _Teste createState() => _Teste();
}

class _Teste extends State<Test> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        debugPrint(snapshot.toString());
        if (snapshot.hasError) {
          return Information('error');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Information('complete');
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Information('esperando');
      },
    );
  }
}

class Information extends StatelessWidget {
  final String appBarName;

  Information(this.appBarName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          save(TransactionModel(1826172, Contact('Lasudas', 485415)));
        },
      ),
    );
  }
}
