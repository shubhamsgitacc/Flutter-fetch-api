import 'package:apifetch/home.dart';
import 'package:apifetch/models/emp.dart';
import 'package:flutter/material.dart';

class MynavWidget extends StatelessWidget {
  final Empmodels empmodels;
  const MynavWidget({Key? key, required this.empmodels}) : super(key: key);
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataFetch'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(15)),
          height: 210,
          width: 350,
          child: Column(children: [
            Container(margin: const EdgeInsets.symmetric(vertical: 10)),
            Text(empmodels.name,
                style: const TextStyle(fontSize: 30, color: Colors.black)),
            Container(margin: const EdgeInsets.symmetric(vertical: 5)),
            Text(empmodels.username,
                style: const TextStyle(fontSize: 30, color: Colors.black)),
            Container(margin: const EdgeInsets.symmetric(vertical: 5)),
            Text(empmodels.email,
                style: const TextStyle(fontSize: 23, color: Colors.black)),
            Container(margin: const EdgeInsets.symmetric(vertical: 5)),
            Text(empmodels.id.toString(),
                style: const TextStyle(fontSize: 23, color: Colors.black)),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(pageBuilder: (context, a, b) => Myhome()),
              (route) => false);
        },
        child: Icon(Icons.home),
      ),
    );
  }
}
