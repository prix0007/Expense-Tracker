import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
              children: [
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.title),
                SizedBox(height: 30),
                Container(
                    height: constraint.maxHeight * 0.4,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(transactions[index].title,
                      style: Theme.of(context).textTheme.title),
                  subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? TextButton.icon(
                          onPressed: () {
                            _deleteTransaction(transactions[index].id);
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Delete Tx'))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            _deleteTransaction(transactions[index].id);
                          }),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
