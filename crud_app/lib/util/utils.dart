import 'package:flutter/widgets.dart';

class Utils {
  final Color backgroundColor = const Color.fromARGB(255, 218, 171, 226);

  Size mediaQuery(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return screenSize;
  }
}
