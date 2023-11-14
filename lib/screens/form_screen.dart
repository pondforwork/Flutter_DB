import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ),
                TextFormField(
                    decoration:
                        const InputDecoration(labelText: "ใส่จำนวนเงิน"),
                    keyboardType: TextInputType.number),
                TextButton(onPressed: () {}, child: const Text("Add"))
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.

        );
  }
}
