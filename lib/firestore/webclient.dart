import 'package:bybebank2/models/contact.dart';
import 'package:bybebank2/models/transaction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<List<TransactionModel>> findAllUsers() async {
  List<TransactionModel> datas = [];
  QuerySnapshot usersFirestore;
  try {
    usersFirestore = await FirebaseFirestore.instance
        .collection('users')
        .get(GetOptions(source: Source.server));
  } catch (e) {
    print(e);
    return datas;
  }

  try {
    usersFirestore.docs.forEach((element) {
      try {
        double _value = element.get('value');
        String _name = element.get('contact')['name'];
        int _accountNumber = element.get('contact')['accountNumber'];
        TransactionModel data =
            TransactionModel(_value, Contact(_name, _accountNumber));
        datas.add(data);
      } catch (e) {
        print(e);
      }
    });
    return datas;
  } catch (e) {
    print(e);
    return datas;
  }
}

Future<String> save(TransactionModel transaction) async {
  CollectionReference usersFirestore =
      FirebaseFirestore.instance.collection('users');

    await usersFirestore
        .add({
      'contact': transaction.toMap()['contact'].toMap(),
      'value': transaction.value
    })
        .then((value) => debugPrint("user added"))
        .catchError((error) => debugPrint(error.toString()));
    return 'user added';
}
