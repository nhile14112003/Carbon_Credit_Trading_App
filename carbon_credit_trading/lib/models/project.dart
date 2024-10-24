import 'dart:io';

class Project {
  final String projectName;
  final String startDate;
  final String endDate;
  final String location;
  final String scale;
  final String scope;
  final String partners;
  final String issuer;
  final String availableCredits;
  final String certificates;
  final String price;
  final List<File> projectImages;
  final List<File> creditImages;
  final List<String> paymentMethods;

  Project({
    required this.projectName,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.scale,
    required this.scope,
    required this.partners,
    required this.issuer,
    required this.availableCredits,
    required this.certificates,
    required this.price,
    this.projectImages = const [], 
    this.creditImages = const [],
    this.paymentMethods = const [],
  });
}
