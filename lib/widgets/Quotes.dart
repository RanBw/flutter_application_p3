import 'package:flutter/material.dart';
import 'package:flutter_application_3_v2/main.dart';

class AllTheQuotes extends StatelessWidget {
  final String quote;
  final String author;
  final Function deleteQuote;
  final Quote q;

  const AllTheQuotes(
      {super.key,
      required this.author,
      required this.quote,
      required this.deleteQuote,
      required this.q});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      borderOnForeground: true,
      color: Color.fromARGB(255, 231, 231, 231),
      margin: EdgeInsets.all(22),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textDirection: TextDirection.ltr,
              quote,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      deleteQuote(q);
                    },
                    icon: Icon(Icons.delete)),
                Text(
                  author,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
