class NavBarTabModel {
  final String id;
  final String name;

  const NavBarTabModel({required this.id, required this.name});
}

List<NavBarTabModel> navBarTabsList = [
  NavBarTabModel(id: "1", name: "Home"),
  NavBarTabModel(id: "2", name: "About"),
  NavBarTabModel(id: "3", name: "Education"),
  NavBarTabModel(id: "4", name: "Projects"),
  NavBarTabModel(id: "6", name: "Contact"),
  NavBarTabModel(id: "7", name: "My skills"),
];
