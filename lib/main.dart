import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app-state/page-state/page_state.dart';
import 'package:kb_mobile_app/constants/custom_color.dart';
import 'package:kb_mobile_app/modules/splash/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => PageState())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: CustomColor.defaultPrimaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: SafeArea(child: SplashPage()),
        ));
  }
}
