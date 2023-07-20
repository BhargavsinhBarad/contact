import 'dart:io';

import 'package:contact/Modal/model_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Provider/Contact_provider.dart';
import '../utils/global_varibal.dart';

class details extends StatelessWidget {
  const details({super.key});

  @override
  Widget build(BuildContext context) {
    Contacts cotact = ModalRoute.of(context)!.settings.arguments as Contacts;

    int index = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'hidden') {
                Navigator.of(context).pushNamed('hidden');
                Provider.of<ContactProvider>(context).removeContact(cotact);
                Provider.of<ContactProvider>(context).addhiddenContacts(cotact);
              } else if (value == 'setting') {}
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'hidden',
                child: Text("Hidden Contacts"),
              ),
              const PopupMenuItem(
                value: 'setting',
                child: Text("Settings"),
              ),
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (Global.pic == null)
            const CircleAvatar(
              radius: 85,
              child: Text("No Image"),
            )
          else
            CircleAvatar(
              radius: 85,
              foregroundImage: FileImage(File(Global.pic!.path)),
            ),
          const SizedBox(height: 20),
          Text(
            "${cotact.FirstName}",
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final XFile? image =
                      await Global.picker.pickImage(source: ImageSource.camera);
                  //    setState(() {
                  //   Global.pic = image;
                  // });
                },
                child: const Icon(Icons.camera_alt_rounded),
              ),
              ElevatedButton(
                onPressed: () async {
                  final XFile? image = await Global.picker
                      .pickImage(source: ImageSource.gallery);
                  //  setState(() {
                  //   Global.pic = image;
                  // });
                },
                child: const Icon(Icons.photo_camera_back_rounded),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  launchUrl(
                    Uri(scheme: 'sms', path: "${cotact.MobileNumber}"),
                  );
                },
                icon: const Icon(Icons.sms),
              ),
              IconButton(
                onPressed: () async {
                  launchUrl(
                    Uri(scheme: 'tel', path: "${cotact.MobileNumber}"),
                  );
                },
                icon: const Icon(Icons.phone),
              ),
              IconButton(
                onPressed: () async {
                  launchUrl(
                    Uri(scheme: 'mailto', path: "${cotact.Email}"),
                  );
                },
                icon: const Icon(Icons.mail),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
