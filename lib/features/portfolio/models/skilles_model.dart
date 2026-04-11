class SkillesModel {
  String? title;
  String? description;
  String? imagePath1;
  String? imagePath2;
  SkillesModel({
    this.title,
    this.description,
    this.imagePath1,
    this.imagePath2,
  });
}

List<SkillesModel> skillsList = [
  SkillesModel(
    title: "Flutter",
    description: "Cross-platform mobile app development framework.",
    imagePath1: "assets/images/flutter_logo.png",
  ),
  SkillesModel(
    title: "Dart",
    description: "Programming language used with Flutter.",
    imagePath1: "assets/images/dart_logo.png",
  ),
  SkillesModel(
    title: "OOP",
    description: "Object-oriented programming concepts.",
    imagePath1: "assets/images/oop_icon.png",
  ),
  SkillesModel(
    title: "Firebase",
    description: "Backend platform for building mobile and web applications.",
    imagePath1: "assets/images/firebase_logo.png",
  ),
  SkillesModel(
    title: "Git & GitHub",
    description: "Version control system for tracking changes in code.",
    imagePath1: "assets/images/git_logo.png",
    imagePath2: "assets/images/github_icon.png",
  ),
  SkillesModel(
    title: "State Management",
    description: "Managing the state of a Flutter application.",
    imagePath1: "assets/images/bloc_logo.png",
  ),
  SkillesModel(
    title: "RESTful APIs",
    description: "Building and consuming RESTful APIs for app communication.",
    imagePath1: "assets/images/api_icon.png",
  ),
  SkillesModel(
    title: "Local Storage",
    description: "Storing data locally on the device for offline access.",
    imagePath1: "assets/images/database_icon.png",
  ),
  SkillesModel(
    title: "DSA",
    description:
        "Data structures and algorithms for efficient problem-solving.",
    imagePath1: "assets/images/dsa_icon.png",
  ),
];
