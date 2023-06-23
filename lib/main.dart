import 'package:flutter/material.dart';
import 'package:flutter_application_3_v2/widgets/Quotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BestQuotes(),
    );
  }
}

class BestQuotes extends StatefulWidget {
  const BestQuotes({super.key});

  @override
  State<BestQuotes> createState() => _BestQuotesState();
}

class Quote {
  String quote;
  String author;

  Quote({required this.quote, required this.author});
}

class _BestQuotesState extends State<BestQuotes> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  List AllQuotes = [
    Quote(
        quote: "Don't let your happiness depend on something you may lose.",
        author: "C.S. Lewis"),
    Quote(
        quote: "You cannot find peace by avoiding life.",
        author: "Virginia Woolf"),
    Quote(
        quote: "If I waited for perfection, I would never write a word.",
        author: "Margaret Atwood"),
    Quote(
        quote:
            "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.",
        author: "Albert Einstein"),
  ];
// the datatype must be Quote because we want to delete a specific quote
  deleteQuote(Quote q) {
    setState(() {
      AllQuotes.remove(q);
    });
  }

  addNewQuote() {
    //AllQuotes.add(Quote(quote: quote, author: author))

    setState(() {
      AllQuotes.add(
          Quote(quote: myController1.text, author: myController2.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: (() {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      margin: EdgeInsets.all(11),
                      height: 200,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            controller: myController1,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(11)),
                              hintText: "Write the quotes here",
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: myController2,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(11)),
                              hintText: "Write the author here",
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                addNewQuote();
                              },
                              child: Text(
                                "ADD",
                                style: TextStyle(color: Colors.deepPurple),
                              ))
                        ],
                      ),
                    ));
              });
        }),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "BEST QUOTES",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...AllQuotes.map(
              (item) => AllTheQuotes(
                quote: item.quote,
                author: item.author,
                deleteQuote: deleteQuote,
                //sending the entire quote (item) to remove it by using .remove(q) method in the deleteQuote function;
                q: item,
              ),
            )
          ],
        ),
      ),
    );
  }
}
