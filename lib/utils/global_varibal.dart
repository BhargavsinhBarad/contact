import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

String? Name;
String? Lastname;
String? Mobilenumber;
String? Email;

class Global {
  static XFile? pic;
  static ImagePicker picker = ImagePicker();
}

class Globals {
  static TextEditingController NameController = TextEditingController();
  static TextEditingController LastnameController = TextEditingController();
  static TextEditingController EmailController = TextEditingController();
  static TextEditingController PhoneController = TextEditingController();
}
