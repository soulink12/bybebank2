import 'package:bybebank2/components/centered_message.dart';
import 'package:bybebank2/components/loading.dart';
import 'package:bybebank2/firestore/webclient.dart';
import 'package:bybebank2/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<TransactionModel>>(
        initialData: [],
        future: findAllUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Loading('Loading transaction list');
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<TransactionModel> transactionsList = snapshot.data!;

              if (transactionsList.isEmpty) {
                return CenteredMessage('No transaction found');
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text(
                          transactionsList[index].contact.name,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transactionsList[index].value.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: transactionsList.length,
                );
              }
          }
          return Text('Unknown error');
        },
      ),
    );
  }
}
