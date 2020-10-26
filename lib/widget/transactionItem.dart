import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.tx,
    @required Function deleteTx,
  })  : _deleteTx = deleteTx,
        super(key: key);

  final Transaction tx;
  final Function _deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColor = [
      Colors.red,
      Colors.amber,
      Colors.blue,
      Colors.purple,
      Colors.deepOrange
    ];
    _bgColor = availableColor[Random().nextInt(5)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('\$${widget.tx.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.tx.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.tx.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: const Icon(Icons.delete_sharp),
                textColor: Theme.of(context).errorColor,
                onPressed: () => widget._deleteTx(widget.tx.id),
                label: const Text('Delete'),
              )
            : IconButton(
                icon: const Icon(Icons.delete_sharp),
                color: Theme.of(context).errorColor,
                onPressed: () => widget._deleteTx(widget.tx.id),
              ),
      ),
    );
  }
}
