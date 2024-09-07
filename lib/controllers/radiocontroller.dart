// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioController extends GetxController {
  int selectedRadio = 0;

  void handleRadioValueChange(int? value) {
    selectedRadio = value!;
    print(selectedRadio);
    update();
  }
}
