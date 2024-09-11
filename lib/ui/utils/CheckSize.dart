

import 'dart:ui';

class CheckSize {

  static bool isMobile(Size size){
    return size.width < 600;
  }
  static bool isOverSideWidth(Size size){
    return size.width > 1800;
  }
  static bool isStopInformationTop(Size size){
    return size.width > 1100;
  }
}