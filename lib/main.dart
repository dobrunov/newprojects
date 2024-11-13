import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/country_provider.dart';
import '../styles/styles.dart';
import 'controllers/button_active_controller.dart';
import 'controllers/mask_controller.dart';
import 'controllers/opacity_controller.dart';
import 'controllers/text_controller.dart';
import 'pages/home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountryProvider>(create: (context) => CountryProvider()),
        ChangeNotifierProvider<HintOpacityController>(create: (context) => HintOpacityController()),
        ChangeNotifierProvider<ButtonActiveController>(create: (context) => ButtonActiveController()),
        ChangeNotifierProvider(create: (_) => TextControllers()),
        Provider<MaskController>(create: (context) => MaskController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: background,
          primaryColor: const Color(0xFFFFFFFF),
        ),
        home: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: HomePage(),
        ),
      ),
    );
  }
}
