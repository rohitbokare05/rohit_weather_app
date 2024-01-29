import 'package:flutter/material.dart';
import 'package:food_app/colors.dart';
import 'package:food_app/home_screen.dart';

class Trending_Movies extends StatefulWidget {
  List trending;
  Trending_Movies({super.key, required this.trending});

  @override
  State<Trending_Movies> createState() => _Trending_MoviesState();
}

class _Trending_MoviesState extends State<Trending_Movies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cine Quest")),
        backgroundColor: background_colour,
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              MyDropdownButton(),
              SizedBox(
                width: 10,
              ),
              MyDropdownButton(),
              SizedBox(
                width: 10,
              ),
              MyDropdownButton(),
              SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: 170,
                  child: TextField(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 600,
            width: 600,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 50,
              itemBuilder: (context, index) {
                return texts(title: widget.trending[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class texts extends StatelessWidget {
  const texts({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                height: 50,
                width: 220,
              ),
            ));
          }),
    );
  }
}
