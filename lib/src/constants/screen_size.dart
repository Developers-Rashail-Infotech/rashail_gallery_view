import 'package:flutter/cupertino.dart';


// Function to get screen height
double screenHeight(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return screenHeight;
}

// Function to get screen width
double screenWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth;
}
// Function to get text size of the screen
double textSize(BuildContext context) {
  double screenWidth = MediaQuery.of(context).textScaleFactor;
  return screenWidth;
}
