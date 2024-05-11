
import 'package:cloud_firestore/cloud_firestore.dart';

class FormData {
  String brandName;
  String pocName;
  String email;
  String number;
  String? websiteLink;
  String? problemsWithGoogleSearch;

  FormData({
    required this.brandName,
    required this.pocName,
    required this.email,
    required this.number,
    this.websiteLink,
    this.problemsWithGoogleSearch,
  });

  // Convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'brandName': brandName,
      'pocName': pocName,
      'email': email,
      'number': number,
      'websiteLink': websiteLink,
      'problemsWithGoogleSearch': problemsWithGoogleSearch,
    };
  }
}