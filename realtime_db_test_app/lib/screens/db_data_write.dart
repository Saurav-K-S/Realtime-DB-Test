import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class ExampleWrite extends StatelessWidget {
  const ExampleWrite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    TextEditingController _controller1 = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text("Enter The Directory"),
          ),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: "Enter"),
          ),
          const Center(
            child: Text("\nEnter The Data"),
          ),
          TextField(
            controller: _controller1,
            decoration: const InputDecoration(hintText: "Enter"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DatabaseReference _testRef = FirebaseDatabase.instance
              .ref()
              .child(_controller.text.toString());
          _testRef.set(_controller1.text.toString());
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}