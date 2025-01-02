
import 'package:flutter/material.dart';

import '../../../models/contact_model.dart';
import '../../../style/reusable_components/colors_manager.dart';
import '../widget/add_bottom_sheet.dart';
import '../widget/appBar_widget.dart';
import '../widget/contacts_isEmpty.dart';
import '../widget/floatingActionButton_widget.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String routName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactModel> contacts = [];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtonWidget(
        showDelete: contacts.isNotEmpty,
        addContact: addContact,
        removeContact: removeContact,
      ),
      backgroundColor: ColorsManager.primary,
      appBar: const AppbarWidget(),
      body: contacts.isEmpty
          ? ContactsIsEmpty()
          : ContactScreen(contacts: contacts,
      indexContactRemove:indexRemoveContact ,),
    );
  }

  void addContact(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddBottomSheet(
            addContactButton: () {
              setState(() {});
            },
            contacts: contacts,
          );
        });
  }

  removeContact() {
    // contacts.removeAt(index);
    contacts.removeLast();
    setState(() {});
  }
  indexRemoveContact(int index) {
     contacts.removeAt(index);
     setState(() {});

  }
}
