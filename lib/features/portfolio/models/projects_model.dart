class ProjectsModel {
  final String title;
  final String description;
  final String imageUrl;
  final String projectUrl;

  ProjectsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.projectUrl,
  });
}

List<ProjectsModel> projectsList = [
  ProjectsModel(
    title: "Clothing E-commerce",
    description:
        "A Flutter-based clothing e-commerce app with features like product browsing, shopping cart, and checkout.",
    imageUrl:
        "assets/images/flutter_logo.png", //"assets/images/ecommerce_project_image.png",
    projectUrl: "https://github.com/king7amza/clothing-ecommerce",
  ),
];
