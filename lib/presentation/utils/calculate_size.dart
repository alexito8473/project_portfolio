import 'dart:ui';

class CalculateSize {
 static bool isDesktop(Size size){
    return size.width>1800;
  }
 static bool isTablet(Size size){
    return  size.width>600&& size.width<=1800;
  }
 static bool isMobile(Size size){
    return size.width>0&&size.width<=600;
  }
}