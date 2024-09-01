import 'package:flutter/material.dart';

showSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text)),
  );
}
