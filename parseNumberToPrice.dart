import 'package:flutter/material.dart';

extension ParseNumberToPrice on int? {
  String parseNumberToPrice() {
    var price = this?.toInt();
    if (price == null || price == 0) {
      return '0';
    }
    if (price <= 0) {
      return price.toString();
    }
    String fixPrice = '';
    int num = price;
    List<String> characters = [];
    int d;
    while (num > 0) {
      d = num % 10;
      num = num ~/ 10;
      characters.add(d.toString());
    }

    for (var i = 0; i < characters.length; i++) {
      if (i % 3 == 0) {
        fixPrice += ',';
      }
      fixPrice += characters[i];
    }
    fixPrice = fixPrice.substring(1);
    fixPrice = fixPrice.split('').reversed.join();

    return fixPrice;
  }
}

extension RemoveSpaceFromText on String? {
  String removeSpace() {
    if(this == null)
      return '';
    String fix = '';
    for (var value in this!.characters) {
      if (value.isNotEmpty) fix += value;
    }
    return fix;
  }
}