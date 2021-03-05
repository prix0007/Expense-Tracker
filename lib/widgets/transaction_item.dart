import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tx;
  final Function _deleteTx;

  TransactionItem(this.tx, this._deleteTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${tx.amount}')),
          ),
        ),
        title: Text(tx.title, style: Theme.of(context).textTheme.headline6),
        subtitle: Text(DateFormat.yMMMd().format(tx.date),
            style: TextStyle(fontSize: 12, color: Colors.grey)),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                onPressed: () {
                  _deleteTx(tx.id);
                },
                icon: Icon(Icons.delete),
                label: Text('Delete Tx'))
            : IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  _deleteTx(tx.id);
                }),
      ),
    );
  }
}
