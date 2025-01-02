import 'dart:io';


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/contact_model.dart';
import '../../../style/reusable_components/TextStylesManager.dart';
import '../../../style/reusable_components/assets_manager.dart';
import '../../../style/reusable_components/colors_manager.dart';
import 'custom_textfield.dart';

class AddBottomSheet extends StatefulWidget {
  AddBottomSheet(
      {super.key, required this.contacts, required this.addContactButton});

  List<ContactModel> contacts;
  Function addContactButton;

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  @override
  late List<ContactModel> contacts;
  XFile? file;
  File? imageTemp;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: ColorsManager.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: Colors.white60)),
                            child: Center(
                              child: file == null
                                  ? GestureDetector(
                                      onTap: () async {
                                        ImagePicker picker = ImagePicker();
                                        file = await picker.pickImage(
                                            source: ImageSource.gallery);
                                        if (file != null) {
                                          imageTemp = File(file!.path);
                                        }
                                        setState(() {});
                                      },
                                      child:
                                          Lottie.asset(AssetsManager.animation),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: file != null
                                          ? Image.file(
                                              File(file!.path),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nameController.text.isEmpty
                                    ? "User Name"
                                    : nameController.text,
                                style: TextStylesManager.style,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Divider(
                                  color: ColorsManager.secondary,
                                  thickness: 1,
                                ),
                              ),
                              Text(
                                emailController.text.isEmpty
                                    ? "example@email.com"
                                    : emailController.text,
                                style: TextStylesManager.style,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Divider(
                                  color: ColorsManager.secondary,
                                  thickness: 1,
                                ),
                              ),
                              Text(
                                phoneController.text.isEmpty
                                    ? "+200000000000"
                                    : phoneController.text,
                                style: TextStylesManager.style,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: nameController,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          controller: emailController,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          controller: phoneController,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              addContact();
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text("Enter user",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void addContact() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      widget.contacts.add(ContactModel(
        userName: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        imageFile: imageTemp,
      ));
      widget.addContactButton();

      Navigator.pop(context);

    }
  }
}
