// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/custom_textformfield.dart';
import '../../../global_widgets/text_theme.dart';
import '../../auth/forget_page/themehelper.dart';

class JobBody extends StatefulWidget {
  const JobBody({Key? key}) : super(key: key);

  @override
  State<JobBody> createState() => _JobPageCreate();
}

List<String> exp = [
"Trainer"
  "0-Experince",
  "1-5 years",
  "5-10 years",
  "10-15 years",
  "15 OR more",
];

class _JobPageCreate extends State<JobBody> {
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
  ];

  final Map<String, List<String>> languages = {
    'Web Developer': ['HTML/CSS', 'JavaScript', 'PHP', 'Python', 'Ruby', 'Java', 'C#'],
    'Mobile App Developer': ['Swift', 'Kotlin/Java', 'React Native', 'Flutter'],
    'Software Engineer': ['Python', 'Java', 'C/C++', 'C#', 'JavaScript'],
    'Data Scientist': ['Python (Pandas, NumPy, Scikit-Learn)', 'R', 'SQL', 'Scala'],
    'Network Engineer': ['Cisco IOS', 'Juniper Junos', 'Python', 'PowerShell'],
    'Cybersecurity Analyst': ['Python', 'C/C++', 'Java', 'PowerShell', 'Bash Scripting'],
    'Database Administrator': ['SQL', 'Oracle', 'MySQL', 'MongoDB'],
    'System Administrator': ['Linux/Unix Shell Scripting', 'PowerShell', 'Python'],
    'AI Developer': ['Python (TensorFlow, PyTorch)', 'R', 'Java'],
    'DevOps Engineer': ['Linux/Unix Shell Scripting', 'Ansible', 'Docker', 'Kubernetes'],
    // Add programming languages for other jobs here
  };

  String selectedExperience = '0-Experince';
  String selectedjob = 'Web Developer';
  Map<String, bool> isSelected = {};

  void addToSelectedLanguages(String language) {
    setState(() {
      isSelected[language] = !(isSelected[language] ?? false);
      if (isSelected[language]!) {
        selectedLanguages.add(language);
      } else {
        selectedLanguages.remove(language);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    for (var languageList in languages.values) {
      for (var language in languageList) {
        isSelected[language] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 16.0),
            const CustomTextFormField (
              label: "Job Title",
               prefixIcon:  Icon(Icons.work),
            ),
              const SizedBox(height: 8.0),
             const CustomTextFormField (
              label: "Job Discripton",
                             prefixIcon:  Icon(Icons.description),
            ),
              
              const SizedBox(height: 8.0),
            
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                 
                  border: Border.all(color: Colors.purple),
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Jobs:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: jobs.length,
                        itemBuilder: (context, index) {
                          final job = jobs[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedjob = job;
                                selectedLanguages = List.from(languages[job] ?? []);
                                selectedLanguages.retainWhere((language) => isSelected[language] ?? false);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedjob == job ? const Color.fromARGB(255, 1, 26, 46) : Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                child: Text(
                                  job,
                                  style: TextStyle(
                                    color: selectedjob == job ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple),
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Programming Languages:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: languages[selectedjob]?.length ?? 0,
                        itemBuilder: (context, index) {
                          final language = languages[selectedjob]![index];
                          return GestureDetector(
                            onTap: () {
                              addToSelectedLanguages(language);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected[language] ?? false ? const Color.fromARGB(255, 65, 5, 76) : Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                child: Text(
                                  language,
                                  style: TextStyle(
                                    color: isSelected[language] ?? false ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text('Select Experience:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
    const SizedBox(height: 8.0),
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.all(4.0),
      child: DropdownButton<String>(
        hint: const Text('                                                      Select Experience'),
        value: selectedExperience.isNotEmpty && exp.contains(selectedExperience) ? selectedExperience : null,
        onChanged: (String? value) {
          setState(() {
            selectedExperience = value ?? '';
            if (kDebugMode) {
              print('Selected Experience: $selectedExperience');
            }
          });
        },
        items: exp.map((String experience) {
          return DropdownMenuItem<String>(
            value: experience,
            child: Text(experience),
          );
        }).toList(),
      ),
    ),
  ],
),
  const SizedBox(height: 20),
         Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          backgroundColor: Get.theme.colorScheme.primary,
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        ),
                        onPressed: () {
                       
                        },
                        child: Text(
                          "Create ",
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.button.copyWith(
                            color: Get.theme.colorScheme.background,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

