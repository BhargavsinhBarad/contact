import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Provider/Contact_provider.dart';
import '../utils/global_varibal.dart';
import '../utils/model_page.dart';

class Contact extends StatefulWidget {
  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  int initialIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Contact page"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ContactProvider>(context, listen: false).addContacts(
                Contacts(
                  Email: Globals.EmailController.text,
                  FirstName: Globals.NameController.text,
                  LastName: Globals.LastnameController.text,
                  MobileNumber: Globals.PhoneController.text,
                ),
              );
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Stepper(
          onStepCancel: () {
            if (initialIndex != 0) {
              setState(() {
                initialIndex--;
              });
            }
          },
          onStepContinue: () {
            if (initialIndex != 3) {
              setState(() {
                initialIndex++;
              });
            }
          },
          currentStep: initialIndex,
          steps: [
            Step(
              state:
                  (initialIndex == 0) ? StepState.editing : StepState.indexed,
              isActive: (initialIndex == 0) ? true : false,
              title: const Text("Your Photo"),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      final XFile? image = await Global.picker
                          .pickImage(source: ImageSource.camera);
                      setState(() {
                        Global.pic = image;
                      });
                    },
                    child: const Icon(Icons.camera_alt_rounded),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      final XFile? image = await Global.picker
                          .pickImage(source: ImageSource.gallery);
                      setState(() {
                        Global.pic = image;
                      });
                    },
                    child: const Icon(Icons.photo_camera_back_rounded),
                  ),
                ],
              ),
              subtitle: const Text("Enter Your Photo"),
            ),
            Step(
                state:
                    (initialIndex == 1) ? StepState.editing : StepState.indexed,
                isActive: (initialIndex == 1) ? true : false,
                title: const Text('Your Name'),
                subtitle: const Text('Add Your Name'),
                content: Column(
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        Name = val;
                      },
                      controller: Globals.NameController,
                      decoration: InputDecoration(
                          hintText: "Enter Your Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: Globals.LastnameController,
                      decoration: InputDecoration(
                        hintText: "Enter Your Last Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSaved: (val) {
                        Lastname = val;
                      },
                    ),
                  ],
                )),
            Step(
              state:
                  (initialIndex == 2) ? StepState.editing : StepState.indexed,
              isActive: (initialIndex == 2) ? true : false,
              title: const Text('Mobile Number'),
              subtitle: const Text('Enter Your Mobile Number'),
              content: TextFormField(
                maxLength: 10,
                controller: Globals.PhoneController,
                decoration: InputDecoration(
                  hintText: "Enter Your Mobiler Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (val) {
                  Mobilenumber = val;
                },
              ),
            ),
            Step(
              state:
                  (initialIndex == 3) ? StepState.editing : StepState.indexed,
              isActive: (initialIndex == 3) ? true : false,
              title: const Text('Your Email'),
              subtitle: const Text('Enter Your Email'),
              content: TextFormField(
                controller: Globals.EmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (val) {
                  Email = val;
                },
              ),
            ),
          ]),
    );
  }
}
