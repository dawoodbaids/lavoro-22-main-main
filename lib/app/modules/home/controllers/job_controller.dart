import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../data/repositorys/create_repository.dart';


class CreateJobController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  late String experience;
  late TextEditingController jobdescriptionController;
  late TextEditingController titleController;
  late RxList<String> selectedJobs = <String>[].obs;
late RxList<String> selectedLanguage = <String>[].obs;
  late String selectedExperience = "select experience";
  List<String> experiences = [
    "select experience",
    "0-Experience",
    "1-5 years",
    "5-10 years",
    "10-15",
    "15 OR more",
  ];
 
List<String> selectedLanguages = [];
  final List<String> jobs = [
    'Web Developer',
    'Mobile App Developer',
    'Software Engineer',
    'Data Scientist',
    'Network Engineer',
    'Cybersecurity Analyst',
    'Database Administrator',
    'System Administrator',
    'AI Developer',
    'DevOps Engineer',
    'Game Developer',
  ];

  final Map<String, List<String>> languages = {
    'Web Developer': ['HTML', 'JavaScript', 'PHP', 'Python', 'Ruby', 'Java', 'C#'],
    'Mobile App Developer': ['Swift', 'Kotlin', 'React-Native', 'Flutter','Java'],
    'Software Engineer': ['Python', 'Java', 'C++', 'C#', 'JavaScript'],
    'Data Scientist': ['Pandas', 'NumPy', 'Scikit-Learn', 'R', 'SQL', 'Scala'],
    'Network Engineer': ['Cisco-IOS', 'Python', 'PowerShell'],
    'Cybersecurity Analyst': ['Python', 'C++', 'Java', 'PowerShell', 'Bash-Scripting'],
    'Database Administrator': ['SQL', 'Oracle', 'MySQL', 'MongoDB'],
    'System Administrator': ['Linux-Shell-Scripting', 'PowerShell', 'Python','Unix-Shell-Scripting'],
    'AI Developer': ['TensorFlow', 'PyTorch', 'R', 'Java'],
    'DevOps Engineer': ['Linux-Shell-Scripting','Unix-Shell-Scripting', 'Ansible', 'Docker', 'Kubernetes'],
    'Game Developer': ['C++', 'C#', 'Unity', 'Unreal Engine', 'JavaScript', 'Python'],
  };

  // ignore: non_constant_identifier_names
  final UserRepo = Get.put(CreateUserRepository());

  @override
  void onInit() {
    titleController = TextEditingController();
    jobdescriptionController = TextEditingController();
    selectedJobs = <String>[].obs;
    experience = experiences[0];
    super.onInit();
  }

  User? get userInfo {
    return FirebaseAuth.instance.currentUser;
  }
// try {
//       var jobuid = userInfo?.jobuid;
     
//         jobuid: jobuid!,
//       );

  //  CreateJobAcount createJobAccount = CreateJobAcount(
  //     jobdescription: jobdescriptionController.text,
  //     title:titleController.text,
  //     experience: selectedExperience,
  //     selectedLanguage: selectedLanguage,
  //     selectedjobs: selectedJobs,
  //   jobuid:
  //   );

  //   await UserRepo.createUser(createJobAccount);
  

}