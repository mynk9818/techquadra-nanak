import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../helpers/shared_pref_helper.dart';
import '../modal/pet_modal.dart';
import 'custom_text_field.dart';
import 'custom_toggle_button.dart';
import 'image_picker.dart';
import 'text_field_label.dart';

class TaskTwo extends StatefulWidget {
  const TaskTwo({super.key});

  @override
  State<TaskTwo> createState() => _TaskTwoState();
}

class _TaskTwoState extends State<TaskTwo> {
  @override
  void dispose() {
    nameController.dispose();
    typeController.dispose();
    breedController.dispose();
    dobController.dispose();
    genderController.dispose();
    weightController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SharedPrefHelper.getPet().then((value) {
        nameController.text = value.name ?? "";
        typeController.text = value.type ?? "";
        breedController.text = value.breed ?? "";
        dobController.text = value.dob ?? "";
        genderController.text = value.gender ?? "";
        weightController.text = value.weight ?? "";
        descriptionController.text = value.description ?? "";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text("New Pet"),
        backgroundColor: AppColors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImagePicker(mediaQuery: mediaQuery),
                CustomTextField(
                  controller: nameController,
                  label: "Name",
                  hint: "Enter Pet Name",
                ),
                CustomTextField(
                  controller: typeController,
                  label: "Type",
                  hint: "Enter Type Of Pet",
                ),
                CustomTextField(
                  controller: breedController,
                  label: "Breed",
                  hint: "Enter Breed Of Pet",
                ),
                CustomTextField(
                  controller: dobController,
                  label: "Date Of Birth",
                  hint: "Enter Date Of Birth Of Pet",
                ),
                const TextFieldLabel(label: "Gender"),
                CustomToggleButton(
                  currentSelected:
                      genderController.text.toLowerCase() == "female" ? 1 : 0,
                  onChange: (index) {
                    genderController.text = (index == 1) ? "female" : "male";
                  },
                ),
                CustomTextField(
                  controller: weightController,
                  label: "Weight",
                  hint: "Enter Weight Of Pet",
                ),
                CustomTextField(
                  controller: descriptionController,
                  label: "Description",
                  hint: "Enter Description Of Pet",
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await SharedPrefHelper.setPet(
                            PetModal(
                              breed: breedController.text,
                              description: descriptionController.text,
                              dob: dobController.text,
                              gender: genderController.text,
                              image: "",
                              name: nameController.text,
                              type: typeController.text,
                              weight: weightController.text,
                            ),
                          ).then(
                            (value) =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Data Saved Successfully"),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.crayola,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 24),
                        ),
                        child: const Text("Save"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
