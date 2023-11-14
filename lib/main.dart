import 'package:flutter/material.dart';
import 'package:flutter_database/screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
      
        title: Text(widget.title),actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const FormScreen();
          }));
        }, icon: const Icon(Icons.add))] ,
      ),
    body: ListView.builder(itemBuilder: (context,int index){
      return const Card(
        elevation: 5,
        margin: EdgeInsets.all(10,),
        child: ListTile(title: Text("Menu")),
      );
    }),
    );
  }
}
