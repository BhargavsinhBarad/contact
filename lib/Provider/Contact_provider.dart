import 'package:flutter/material.dart';
import '../Modal/model_page.dart';

class ContactProvider extends ChangeNotifier {
  static List<Contacts> allContacts = [];
  static List<Contacts> hiddenContact = [];

  void addContacts(Contacts add) {
    allContacts.add(add);
    notifyListeners();
  }

  void removeContact(Contacts remove) {
    allContacts.remove(remove);
    notifyListeners();
  }

  void addhiddenContacts(Contacts add) {
    hiddenContact.add(add);
    notifyListeners();
  }
}
