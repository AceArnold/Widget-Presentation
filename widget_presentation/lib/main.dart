import 'package:flutter/material.dart';

void main() => runApp(const QuotesApp());

const Color kOrange = Color(0xFFC1440E);
const Color kOrangeLight = Color(0xFFFCEFE7);

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes Feed',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: kOrange,
        appBarTheme: const AppBarTheme(
          backgroundColor: kOrange,
          foregroundColor: Colors.white,
        ),
        fontFamily: 'Roboto',
      ),
      home: const QuotesFeedPage(),
    );
  }
}

class Quote {
  final String text;
  final String author;
  const Quote(this.text, this.author);
}

const List<Quote> quotes = [
  Quote('The only way to do great work is to love what you do.', 'Steve Jobs'),
  Quote('Simplicity is the soul of efficiency.', 'Austin Freeman'),
  Quote('Code is like humor. When you have to explain it, it’s bad.', 'Cory House'),
  Quote('First, solve the problem. Then, write the code.', 'John Johnson'),
  Quote('Make it work, make it right, make it fast.', 'Kent Beck'),
  Quote('Programs must be written for people to read.', 'Harold Abelson'),
  Quote('Any fool can write code a computer can understand.', 'Martin Fowler'),
  Quote('Talk is cheap. Show me the code.', 'Linus Torvalds'),
];

class QuotesFeedPage extends StatefulWidget {
  const QuotesFeedPage({super.key});

  @override
  State<QuotesFeedPage> createState() => _QuotesFeedPageState();
}

class _QuotesFeedPageState extends State<QuotesFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quotes Feed')),
      body: ListView.builder(
        scrollDirection: Axis.vertical, 
        padding: const EdgeInsets.all(16), 
        itemExtent: 110, 
        itemCount: quotes.length,
        itemBuilder: (context, index) => QuoteCard(quote: quotes[index]),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final Quote quote;
  const QuoteCard({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: kOrange, width: 4)),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            quote.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, height: 1.3),
          ),
          const SizedBox(height: 8),
          Text(
            '— ${quote.author}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: kOrange,
            ),
          ),
        ],
      ),
    );
  }
}