import 'package:fier/ui/router/app_navigator.dart';
import 'package:flutter/material.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: ApppNavigator.initRoute,
      routes: ApppNavigator.routes,
      debugShowCheckedModeBanner: false,
      
    );
  }
}