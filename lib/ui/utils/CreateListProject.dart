import '../../models/Project.dart';

List<Project> createListProject() {
  return [
    const Project(
        name: "TastyDash",
        imgUrl: [
          "assets/images/projects/tasty/1.webp",
          "assets/images/projects/tasty/2.webp",
          "assets/images/projects/tasty/3.webp",
          "assets/images/projects/tasty/4.webp",
          "assets/images/projects/tasty/5.webp",
        ],
        projectDescription: ProjectDescription.TASTY_DASH,
        imgIconLanguage: [
          "assets/svg/programLanguage/flutter.svg",
          "assets/svg/programLanguage/firebase.svg",
          "assets/svg/intellij.svg",
        ],
        repositoryUrl: 'https://github.com/alexito8473/TastyDashProject',
        isApplicationMobile: true),
    const Project(
        name: "Gomoku",
        imgUrl: [
          "assets/images/projects/goReversi/1.webp",
        ],
        projectDescription: ProjectDescription.GOMOKU,
        imgIconLanguage: [
          "assets/svg/programLanguage/java.svg",
          "assets/svg/eclipse.svg",
        ],
        repositoryUrl:
            'https://github.com/alexito8473/gomoku-Alejandro-Aguilar',
        isApplicationMobile: false),
    const Project(
        name: "TastyDashProject",
        imgUrl: [
          "assets/images/projects/tasty/1.webp",
          "assets/images/projects/tasty/2.webp",
          "assets/images/projects/tasty/3.webp",
          "assets/images/projects/tasty/4.webp",
          "assets/images/projects/tasty/5.webp",
        ],
        projectDescription: ProjectDescription.TASTY_DASH,
        imgIconLanguage: ["assets/svg/programLanguage/android.svg"],
        repositoryUrl: 'https://github.com/alexito8473/TastyDashProject',
        isApplicationMobile: true),
    const Project(
        name: "TastyDashProject",
        imgUrl: [
          "assets/images/projects/tasty/1.webp",
          "assets/images/projects/tasty/2.webp",
          "assets/images/projects/tasty/3.webp",
          "assets/images/projects/tasty/4.webp",
          "assets/images/projects/tasty/5.webp",
        ],
        projectDescription: ProjectDescription.TASTY_DASH,
        imgIconLanguage: ["assets/svg/programLanguage/android.svg"],
        repositoryUrl: 'https://github.com/alexito8473/TastyDashProject',
        isApplicationMobile: true),
    const Project(
        name: "TastyDashProject",
        imgUrl: [
          "assets/images/projects/tasty/1.webp",
          "assets/images/projects/tasty/2.webp",
          "assets/images/projects/tasty/3.webp",
          "assets/images/projects/tasty/4.webp",
          "assets/images/projects/tasty/5.webp",
        ],
        projectDescription: ProjectDescription.TASTY_DASH,
        imgIconLanguage: ["assets/svg/programLanguage/android.svg"],
        repositoryUrl: 'https://github.com/alexito8473/TastyDashProject',
        isApplicationMobile: true),
  ];
}
