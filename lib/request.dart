import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:future_builder/api_helper.dart';
import 'package:future_builder/screen1.dart';
import 'package:future_builder/screen2.dart';

class Request extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: LinearProgressIndicator());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data % 2 == 1) {
              return Screen1(title: snapshot.data);
            } else {
              return Screen2(title: snapshot.data);
            }
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<int> fetchData() async {
    int random = new Random().nextInt(10) + 1;
    final response = await ApiHelper.getInstance().get("api/users/" + random.toString());
    if (response != null) {
      var decodedJson = json.decode(response.toString());
      return decodedJson["data"]["id"];
    }

    return null;
  }
}
