import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future_builder/Modal/github_user.dart';
import 'package:http/http.dart' as http;


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Future<GithubUser> getData() async {
      var response = await http.get(Uri.parse("https://api.github.com/users/m-ammar-p"));
      return GithubUser.fromJson(jsonDecode(response.body));
    } // getData

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: FutureBuilder<GithubUser>(
        future: getData(),
        builder: (childContext, snapshot){
          // if Loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Text("Something is wrong :D");
          }
          else{
            return Image.network(snapshot.data?.avatarUrl ?? "");
          }
        }, // builder
      ),
    );
  } // build
} // Home
