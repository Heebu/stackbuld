import 'package:flutter/material.dart';

List<String> sexGender = ['Male', 'Female'];
List<String> occupations = [
  'Student',
  'Alumni',
  'Teaching staff',
  'Non teaching staff',
  // 'Vendor',
  'Others'
];
List<String> studentType = [
  'Undergraduate',
  'Post-Graduate',
  'Masters',
  'pre Degree'
];
List<String> levels = [
  '100 level',
  '200 level',
  '300 level',
  '400 level',
  '500 level',
  '600 level'
];
List<String> locations = [
  'Gate',
  'Harmony',
  'Accord',
  'Isolu cele',
  'Main Isolu',
  'Isolu Catholic',
  'FUNIS',
  'FUNAAB Zoo',
  'MANCOT Park',
  'Camp',
  'Apakila',
  'Fatola',
  'Odoeran',
  'Oshiele',
  'Others'
];
List<String> colleges = [
  'COLFHEC',
  'COLEM',
  'COLNASS',
  'COLPHYS',
  'COBIOS',
  'COLPLANT',
  'COLVET',
  'COLAMROD',
];

class CatsModel {
  final String name;
  final Color color;

  const CatsModel({
    required this.name,
    required this.color,

  });
}



List<CatsModel> catsProperties = [
  CatsModel(
      name: 'electronics',
      color: Colors.green.shade100,),
  CatsModel(
      name: 'cloths',
      color: Colors.blueAccent.shade100,
      ),
  CatsModel(
      name: 'food stuffs',
      color: Colors.brown.shade100,
      ),
  CatsModel(
      name: 'laptops',
      color: Colors.purple.shade100,
      ),
  CatsModel(
      name: 'phones',
      color: Colors.orangeAccent.shade100,
      ),
  CatsModel(
      name: 'furniture',
      color: Colors.redAccent.shade100,
     ),
  CatsModel(
      name: 'automobiles',
      color: Colors.amber.shade100,
      ),
  CatsModel(
      name: 'others',
      color: Colors.indigoAccent.shade100,
      ),

];
