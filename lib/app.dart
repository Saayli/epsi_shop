import 'package:epsi_shop/page/cart_page.dart';
import 'package:epsi_shop/page/details_page.dart';
import 'package:epsi_shop/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bo/article.dart';

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => HomePage(), routes: [
    GoRoute(
      path: 'cart',
      builder: (_, __) => CartPage(),
    ),
    GoRoute(
      path: 'details',
      builder: (_, state) => DetailsPage(article: state.extra as Article),
    ),
  ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Panier Flutter Sales',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          // ···
          brightness: Brightness.dark,
        ),
      ),
      routerConfig: _router,
    );
  }
}
