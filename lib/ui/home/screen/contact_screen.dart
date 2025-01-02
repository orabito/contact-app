
import 'package:flutter/material.dart';

import '../../../models/contact_model.dart';
import '../widget/contacts_widget.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key, required this.contacts,required this.indexContactRemove});
Function(int index) indexContactRemove;
  List<ContactModel> contacts = [

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16,childAspectRatio:.6),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
          return ContactsWidget(contact: contacts[index],onTap:()=>indexContactRemove(index) ,);

              },
          ),
        )
      ],
    );
  }

}
