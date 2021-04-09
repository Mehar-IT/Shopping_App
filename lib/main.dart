import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cartModel.dart';
import 'package:flutter_application_1/pages/cart.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:provider/provider.dart';
import 'pages/homePage.dart';
import 'widgets/theme.dart';

void main() => runApp(ChangeNotifierProvider<CartModel>(
      create: (context) => CartModel(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // initialRoute: MyRoutes.home,
      routes: {
        '/': (context) => Login(),
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.cartList: (context) => MyCart(),
      },
    );
  }
}
