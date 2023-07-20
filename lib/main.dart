import 'package:contact/view/Contact_page.dart';
import 'package:contact/view/Hiddenpage.dart';
import 'package:contact/view/Homepage.dart';
import 'package:contact/view/details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/Contact_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<ContactProvider>(
          create: (ctx) => ContactProvider(),
        ),
      ],
      builder: (ctx, _) => MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Homepage(),
          'contact_page': (context) => Contact(),
          'details': (context) => const details(),
          'hidden': (context) => Hiddenpage(),
        },
      ),
    ),
  );
}
