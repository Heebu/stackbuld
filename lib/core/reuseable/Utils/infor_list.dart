import 'package:flutter/material.dart';

import 'images.dart';

List<String> sexGender = ['Male', 'Female'];
List<String> categories = [
  'Women',
  'Men',
  'Teens',
  'Kids',
  'Old Men',
  'Old women',
  'Others',
];
List catImages = [
  AllImages().womenImage,
  AllImages().menImage,
  AllImages().teenImage,
  AllImages().kidImage,
  AllImages().oldMenImage,
  AllImages().oldWomenImage,
  AllImages().othersImage,
];
List<String> itemTypes = [
  'Bag',
  'Watch',
  'Wallet',
  'Underwear',
  'shoe',
  'belt',
  'Jewelries',
  'Others',
];

List<String> sizes = [
  'S',
  'M',
  'L',
  'XL',
  'XXL',
  'XXXL',
];

List<String> colorItem = [
  'Red',
  'Blue',
  'Black',
  'White',
  'Sliver',
  'Golden',
  'Green',
  'Pink',
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
    color: Colors.green.shade100,
  ),
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
