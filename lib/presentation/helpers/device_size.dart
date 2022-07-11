import 'package:flutter/cupertino.dart';
extension DeviceSize on BuildContext {
  width() => MediaQuery.of(this).size.width;
  height() => MediaQuery.of(this).size.height;
}

