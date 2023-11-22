import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../utils/themes.dart';

void main() {
  runApp(const PlaneCalculator());
}

class PlaneCalculator extends StatelessWidget {
  const PlaneCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plane Calculator',
      theme: ThemeData(
        fontFamily: 'QuicksandRegular',
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: PlaneColors.primary,
        focusColor: PlaneColors.primary,
        dividerColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
    );
  }
}
