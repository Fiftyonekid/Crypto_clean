
import 'package:flutter/material.dart';

GetStaticStyle(double value) {
  if (value > 0) {
    return Icon(
      Icons.trending_up,
      color: Colors.green,
    );
  } else if (value < 0) {
    return Icon(
      Icons.trending_down,
      color: Colors.red,
    );
  } else {
    return Icon(Icons.trending_flat);
  }
}


