import 'package:eigital_task/features/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1366, 1942),
        minTextAdapt: true,
        splitScreenMode: true,

      child: MaterialApp(
        title: 'Eigital Task',
        
        
        home: const DashboardScreen(),
      ),
    );
  }
}

