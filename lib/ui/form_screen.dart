import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_form/components/my_input_field.dart';
import '../models/input_models.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController pocNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController websiteLinkController = TextEditingController();
  final TextEditingController problemsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.grey,
      body:
         Container(
           decoration: const BoxDecoration(
             // gradient: kPrimaryGradient,
             image: DecorationImage(
               image: AssetImage('assets/images/darkBg.png'),
               fit: BoxFit.fill,
             ),
           ),
           child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InputFormField(
                      isOptional: false,
                      label: 'Brand Name',
                      controller: brandNameController,
                      icon: Icons.business_outlined,
                    ),
                    InputFormField(
                      isOptional: false,
                      label: 'POC Name',
                      controller: pocNameController,
                      icon: Icons.person_outline,
                    ),
                    InputFormField(
                      isOptional: false,
                      label: 'Email',
                      controller: emailController,
                      icon: Icons.email_outlined,
                    ),
                    InputFormField(
                      isOptional: false,
                      label: 'Number',
                      controller: numberController,
                      icon: Icons.phone_outlined,
                    ),
                    InputFormField(
                      isOptional: true,
                      label: 'Website Link (Optional)',
                      controller: websiteLinkController,
                      icon: Icons.link_outlined,
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    // Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(vertical: 10),
                    //     child: Text(
                    //       'Problems your business faces with Google Search',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const Text('Problems your business faces with Google Search',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center),
                    InputFormField(
                      isOptional: true,
                      label: 'Optional',
                      icon: Icons.error_outline,
                      controller: problemsController,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: SizedBox(
                        height: 50,
                        width: screenSize.width * 0.9,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              saveData();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade800,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
           ),
         ),
    );
  }

  void saveData() async {
    FormData formData = FormData(
      brandName: brandNameController.text,
      pocName: pocNameController.text,
      email: emailController.text,
      number: numberController.text,
      websiteLink: websiteLinkController.text,
      problemsWithGoogleSearch: problemsController.text,
    );

    try {
      CollectionReference forms = FirebaseFirestore.instance.collection('forms');
      await forms.add(formData.toMap());
      Navigator.pushReplacementNamed(context, '/success');
      print('Data stored successfully');
    } catch (e) {
      print('Error storing data: $e');
    }
  }
}
