import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController transactionName = TextEditingController();
    final TextEditingController transactionAmount = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text("หน้าที่ 2"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "ชื่อรายการ"),
                  controller: transactionName,
                ),
                TextFormField(
                    decoration:
                        const InputDecoration(labelText: "ใส่จำนวนเงิน"),
                    controller: transactionAmount,
                    keyboardType: TextInputType.number),
                TextButton(
                    onPressed: () {
                      String name = transactionName.text;
                      String amount = transactionName.text;
                      print(name);
                      print(amount);
                      Navigator.pop(context);
                    },
                    child: const Text("Add"))
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.

        );
  }
}
