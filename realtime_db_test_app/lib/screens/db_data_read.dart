import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ExampleRead extends StatefulWidget {
  const ExampleRead({super.key});

  @override
  State<ExampleRead> createState() => _ExampleReadState();
}

class _ExampleReadState extends State<ExampleRead> {
  String data = "Click the Button to view data";
  TextEditingController _controller = TextEditingController();

  final _database = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    super.initState();
  }

  void _activateListeners() {
    _database.child(_controller.text.toString()).onValue.listen((event) {
      setState(() {
        data = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Center(
              child: Text("Data in the Directory:$data"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _activateListeners();
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
