import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Provider/Contact_provider.dart';
import '../Provider/theme_provider.dart';
import '../utils/global_varibal.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<themeprovider>(context).changetheme();
              },
              icon: Icon(Icons.brightness_4)),
          PopupMenuButton(
            onSelected: (Value) async {
              if (Value == 'hidden') {
                LocalAuthentication authen = LocalAuthentication();
                bool bio = await authen.canCheckBiometrics;
                bool device = await authen.isDeviceSupported();

                try {
                  if (bio == true && device == true) {
                    bool aut = await authen.authenticate(localizedReason: "");
                    if (aut == true) {
                      Navigator.of(context).pushNamed('hidden');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("successfully "),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Faild.."),
                        ),
                      );
                    }
                  }
                } catch (e) {
                  print(e);
                }
              } else if (Value == 'Theme') {
                GestureDetector(
                  onTap: () {},
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'hidden',
                child: Text("Hidden Contacts"),
              ),
              PopupMenuItem(
                value: 'Theme',
                child: Text("Change Theme"),
              ),
            ],
          )
        ],
        centerTitle: true,
        title: const Text(" Home page "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("contact_page");
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: (ContactProvider.allContacts.isNotEmpty)
          ? ListView.builder(
              itemCount: ContactProvider.allContacts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'details',
                        arguments: ContactProvider.allContacts[index]);
                  },
                  child: ListTile(
                    title: Text(
                      "${ContactProvider.allContacts[index].FirstName}",
                    ),
                    subtitle: Text(
                        "${ContactProvider.allContacts[index].MobileNumber}"),
                    leading: CircleAvatar(
                      radius: 25,
                      foregroundImage: FileImage(File(Global.pic!.path)),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        launchUrl(
                          Uri(
                              scheme: 'tel',
                              path:
                                  "${ContactProvider.allContacts[index].MobileNumber}"),
                        );
                      },
                      icon: const Icon(Icons.phone),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Contacts ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
    );
  }
}
