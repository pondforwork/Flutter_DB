import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController transactionName = TextEditingController();
    final TextEditingController transactionAmount = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("หน้าที่ 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                key: Key('transactionName'),
                decoration: const InputDecoration(labelText: "ชื่อรายการ"),
                controller: transactionName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    print("empty");
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "ใส่จำนวนเงิน"),
                controller: transactionAmount,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Input Amount';
                  }
                  // Parse the entered value as a double (assuming it's a numeric field)
                  double? enteredValue = double.tryParse(value);

                  // Check if the entered value is less than 0
                  if (enteredValue != null && enteredValue < 0) {
                    return 'Please enter a value greater than or equal to 0';
                  }

                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
