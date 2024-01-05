import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/job_model.dart';

// Make sure to import the correct model

class CreateUserRepository extends GetxController {
  static CreateUserRepository get instance => Get.find();
  final _firestore = FirebaseFirestore.instance;

  Future<void> createUser(CreateJobAcount createJob) async {
    try {
      await _firestore.collection("createJob").add(createJob.toMap()); // Update collection name
      Get.snackbar(
        "Success",
        "Job details have been added",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    } catch (error) {
      Get.snackbar(
        "Error",
        "Failed to add job details: $error",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }
}
