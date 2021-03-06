import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widget/transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function _deleteTx;

  TransactionList(this._userTransaction, this._deleteTx);

  @override
  Widget build(BuildContext context) {
    return _userTransaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transaction added!!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: _userTransaction
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      tx: tx,
                      deleteTx: _deleteTx,
                    ))
                .toList());
  }
}
