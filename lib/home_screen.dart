// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app/colors.dart';
import 'package:food_app/screen.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Main_Screen extends StatefulWidget {
  Main_Screen({super.key});

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  List trendingmovies = ['title'];

  final String apikey = '54875d8641f8abfa8870499bd6ee5f12';

  final apiaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NDg3NWQ4NjQxZjhhYmZhODg3MDQ5OWJkNmVlNWYxMiIsInN1YiI6IjY1YjYwNmE1MmZhZjRkMDE2M2RjZGI0MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4BkbX_LO76iT88Fyfh7zG1Ex57ZyTVFECBpcecmRW84';
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomlogs = TMDB(ApiKeys(apikey, apiaccesstoken),
        logConfig: ConfigLogger(
          showErrorLogs: true,
          showLogs: true,
        ));
    Map trendingresult = await tmdbWithCustomlogs.v3.trending.getTrending();
    setState(() {
      trendingmovies = trendingresult['result'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Trending_Movies(trending: trendingmovies);
  }
}

class MyDropdownButton extends StatefulWidget {
  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: DropdownButton<String>(
        dropdownColor: background_colour,
        elevation: 8,
        borderRadius: BorderRadius.circular(20),
        value: selectedOption,
        onChanged: (newValue) {
          setState(() {
            selectedOption = newValue!;
          });
        },
        items: <String>['Option 1', 'Option 2', 'Option 3']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class modified_text extends StatelessWidget {
  final String text;
  final String color;
  final double size;
  const modified_text(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
