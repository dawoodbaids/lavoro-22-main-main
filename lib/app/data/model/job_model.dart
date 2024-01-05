// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lavoro/app/data/provider/user_firebase.dart';

class CreateJobAcount extends GetxController {
final String jobdescription;
final String jobuid;
final String experience;
final List<dynamic> selectedLanguage;
final List<dynamic> selectedjobs;
final String title;
  CreateJobAcount({
      required this.jobuid,
      required this.jobdescription,
      required this.experience,
      required this.selectedjobs,
      required this.title,
      required this.selectedLanguage,
  });
 static CreateJobAcount? info;

  static final Rx<CreateJobAcount?> _currentUser = Rx<CreateJobAcount?>(null);

  static CreateJobAcount? get currentUser => _currentUser.value;

  static set currentUser(CreateJobAcount? newUser) {
    _currentUser.value = newUser;
  }

  static const String _collection = "createJob";
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
    'jobdescription': jobdescription,
    'experience': experience,
    'jobs':selectedjobs,
    'Programing Language': selectedLanguage,
    'Title': title,
    'jobuid': jobuid,    };
  }

   factory CreateJobAcount.formJson(Map<String, dynamic> json) {
    info = CreateJobAcount(

        title: json['title'] ??"title",
        jobuid: json['jobuid'] ?? "jobuid",
        jobdescription: json['jobDescrption'] ?? "jobDescrption",
        experience: json['experience'] ?? "experience",
        selectedLanguage: json['selectedLanguage'] ?? ["Null"],
        selectedjobs: json['selectedjobs'] ?? ['Null']
        );
    return info!;
  }
  static void updateViewr(String thisid) async {
    try {
      DatabaseFirestore.incrementReviwed(thisid);
      // ignore: empty_catches
    } catch (e) {}
  }CreateJobAcount copyWith(
      {String ? jobuid ,
      String? title,
      String?jobdescription,
      String? experience,
      List<String>? selectedLanguage,
      List<String>? selectedjobs,
      }) {
    return CreateJobAcount(
       jobuid:  jobuid  ?? this. jobuid,
       title: title ?? this.title,
       jobdescription: jobdescription ?? this.jobdescription,
       selectedLanguage: selectedLanguage ?? this.selectedLanguage,
       experience: experience ?? this.experience,
       selectedjobs: selectedjobs ?? this.selectedjobs,
    );
  }
  @override
  String toString() {
    return '''CreateJobAcount [] ( 
    jobdescription: $jobdescription, 
    experience: $experience, 
    selectedLanguage:$selectedLanguage,
    selectedjobs:$selectedjobs,
    title: $title 
    )''';
  }
  Future<void> updateCurrentUser() async {
    try {
      currentUser = this;
      await _db.collection(_collection).doc("jobId").set(toMap());
      update();
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user account: $e');
      }
    }
  }
}
