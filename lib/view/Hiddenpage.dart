import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Provider/Contact_provider.dart';

class Hiddenpage extends StatefulWidget {
  const Hiddenpage({super.key});

  @override
  State<Hiddenpage> createState() => _HiddenpageState();
}

class _HiddenpageState extends State<Hiddenpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hidden Cotact"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(Icons.chevron_left),
        ),
      ),
      body: (ContactProvider.hiddenContact.isNotEmpty)
          ? ListView.builder(
              itemCount: ContactProvider.hiddenContact.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "${ContactProvider.hiddenContact[index].FirstName}",
                  ),
                  subtitle: Text(
                      "${ContactProvider.hiddenContact[index].MobileNumber}"),
                  trailing: IconButton(
                    onPressed: () async {
                      launchUrl(
                        Uri(
                            scheme: 'tel',
                            path:
                                "${ContactProvider.hiddenContact[index].MobileNumber}"),
                      );
                    },
                    icon: const Icon(Icons.phone),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                "Hidde Contacts Not Available...",
                style: TextStyle(fontSize: 24),
              ),
            ),
    );
  }
}
