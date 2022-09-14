
import 'package:flutter/material.dart';

GetPercentageColor(double value) {
  if (value > 0) {
    return TextStyle(color: Colors.green);
  } else if (value < 0) {
    return TextStyle(color: Colors.red[600]);
  } else {
    return TextStyle(color: Colors.white);
  }
}