import 'package:flutter/material.dart';

class AdminliftItem {
  final String title;
  final String image;
  final String time;
  final Color colorText;
  final Color colorBorder;

  const AdminliftItem({
    required this.title,
    required this.image,
    required this.time,
    required this.colorText,
    required this.colorBorder,    
  });
}