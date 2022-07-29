import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int cases = 0;
int deaths = 0;
int recoverd = 0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _getCovidDetails();
  }

  void _getCovidDetails() async {
    var url = Uri.parse('https://coronavirus-19-api.herokuapp.com/all');
    var response = await http.post(url);

    var map = jsonDecode(response.body);
    cases = map['cases'];
    deaths = map['deaths'];
    recoverd = map['recoverd'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Data Fetch'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(cases.toString()),
              subtitle: const Text('Cases'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(deaths.toString()),
              subtitle: const Text('Deaths'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(recoverd.toString()),
              subtitle: const Text('Recoverd'),
            ),
          ),
        ],
      ),
    );
  }
}
