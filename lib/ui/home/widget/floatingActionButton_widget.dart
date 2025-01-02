
import 'package:flutter/material.dart';

import '../../../style/reusable_components/colors_manager.dart';



class FloatingActionButtonWidget extends StatelessWidget {
  FloatingActionButtonWidget(
      {super.key, required this.showDelete, required this.addContact, required this.removeContact});

  bool showDelete;
  Function addContact;
  Function removeContact;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 5,
        ),
        showDelete == false
            ? SizedBox.shrink()
            : FloatingActionButton(
          onPressed: () {
            removeContact(

            );
          },
          backgroundColor: Colors.red,
          tooltip: "Delete",
          heroTag: 'deleteButton',
          child: Icon(
            Icons.delete_rounded,
            color: ColorsManager.secondary,
            size: 28,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            addContact(context);
          },
          backgroundColor: Colors.red,
          tooltip: "Add",
          heroTag: 'Add',
          child: Icon(
            Icons.add,
            color: ColorsManager.secondary,
            size: 28,
          ),
        )
      ],
    );
  }
}
