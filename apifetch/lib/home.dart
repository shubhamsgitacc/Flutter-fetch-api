import 'dart:convert';

import 'package:apifetch/models/emp.dart';
import 'package:apifetch/page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  List<Empmodels> emplist = <Empmodels>[];
  webservice() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    print('$data helo');
    data.forEach((json) {
      Empmodels emp = new Empmodels();
      emp = Empmodels.fromjson(json);
      emplist.add(emp);
      emplist.forEach((element) {
        element.id;
        element.name;
        element.email;
        element.username;
      });
      return emplist;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // webservice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DataFetch'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              Container(margin: EdgeInsets.only(top: 8)),
              FutureBuilder(

                  future: webservice(),
                  builder: (context, snapshot) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: emplist.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 160,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: InkWell(
                            onTap: () {
                              print(emplist[index].id);
                              // Getdata(
                              //     emplist[index].name,
                              //     emplist[index].username,
                              //     emplist[index].id,
                              //     emplist[index].email);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          MynavWidget(
                                            empmodels: emplist[index],
                                          )),
                                  (route) => false);
                            },
                            child: ListTile(
                              tileColor: Colors.amberAccent,
                              title: Column(
                                children: [
                                  Container(margin: EdgeInsets.only(top: 11)),
                                  Text(
                                    emplist[index].name,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(emplist[index].username,
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.black)),
                                  Text(emplist[index].email,
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.black)),
                                  Text(emplist[index].id.toString(),
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.black)),
                                ],
                              ),
                            ),
                          ));
                    });
              })
            ],
          ),
        ));
  }
}
