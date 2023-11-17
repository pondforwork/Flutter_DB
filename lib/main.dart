import 'package:flutter/material.dart';
import 'package:flutter_database/models/Transaction.dart';
import 'package:flutter_database/providers/transaction_provider.dart';
import 'package:flutter_database/screens/form_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FormScreen();
                  }));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body:
            Consumer(builder: ((context, TransactionProvider provider, child) {
          return ListView.builder(
            itemCount: provider.transactions.length,
            itemBuilder: (context, int index) {
              Transaction data = provider.transactions[index];
              print(data.date);
              return Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.red,
                    child: FittedBox(
                      child: Text(
                        "500", // You may want to replace this with data.title or another property from the Transaction object
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  title: Text(data
                      .title), // Replace this with the property you want to display as the title
                  subtitle: Text(data.date
                      .toString()), // Replace this with the property you want to display as the date
                ),
              );
            },
          );
        })));
  }
}
