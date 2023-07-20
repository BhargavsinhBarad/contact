import 'package:contact/view/Contact_page.dart';
import 'package:contact/view/Hiddenpage.dart';
import 'package:contact/view/Homepage.dart';
import 'package:contact/view/details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/Contact_provider.dart';
import 'Provider/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<ContactProvider>(
          create: (ctx) => ContactProvider(),
        ),
        ListenableProvider<themeprovider>(
          create: (ctx) => themeprovider(),
        ),
      ],
      builder: (ctx, _) => MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode:
            (Provider.of<themeprovider>(ctx, listen: true).theme.isdark ==
                    false)
                ? ThemeMode.light
                : ThemeMode.dark,
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
