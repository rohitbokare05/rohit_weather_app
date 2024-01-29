// import 'dart:convert';
// // ignore: depend_on_referenced_packages
// import 'package:food_app/screen.dart';
// import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';

// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({super.key});

//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   late Future<Map<String, dynamic>> weather;

//   Future<Map<String, dynamic>> getCurrentWeather() async {
//     try {
//       final res = await http.get(
//         Uri.parse(
//           'http://www.omdbapi.com/?i=tt3896198&apikey=6c0b0e4a',
//         ),
//       );

//       final data = jsonDecode(res.body);

//       if (data['cod'] == '2000000000') {
//         throw 'An unexpected error occurred';
//       }

//       return data;
//     } catch (e) {
//       throw e.toString();
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     weather = getCurrentWeather();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Trending_Movies(trending: weather);
//   }
// }
