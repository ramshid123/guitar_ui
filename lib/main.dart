import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guitar_ui/features/presentation/home%20page/view/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(392.72727272727275, 803.6363636363636),
      child: MaterialApp(
        title: 'Guitar UI',
        home: HomePage(),
      ),
    );
  }
}
