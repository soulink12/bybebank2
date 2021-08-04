import 'package:bybebank2/models/contact.dart';

class TransactionModel {
  final double value;
  final Contact contact;

  TransactionModel(
    this.value,
    this.contact,
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> transaction = {
      "value": value,
      "contact": contact,
    };
    return transaction;
  }

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
