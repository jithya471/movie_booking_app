import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/app/routes/app_pages.dart';
import 'package:movie_booking_app/app/routes/app_routes.dart';
import 'package:movie_booking_app/app/views/home/bindings/home_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie booking App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeView,
      getPages: AppPages.pages,
      initialBinding: HomeBindings(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
