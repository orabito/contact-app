
import 'package:flutter/material.dart';

import '../../../models/contact_model.dart';
import '../../../style/reusable_components/assets_manager.dart';
import '../../../style/reusable_components/colors_manager.dart';

class ContactsWidget extends StatelessWidget {
  ContactsWidget({super.key, required this.contact,required this.onTap});

  ContactModel contact;
 Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                contact.imageFile == null
                    ? Image.asset(
                        AssetsManager.imageDefault,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.file(
                          contact.imageFile!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 8, left: 7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    contact.userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.primary,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.mail),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(contact.email,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.phone_in_talk),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "+2${contact.phone}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    onTap();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: ColorsManager.secondary,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Delete",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.secondary,
                            fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
