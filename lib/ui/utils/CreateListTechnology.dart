import 'dart:ui';

import 'package:flutter/cupertino.dart';
import '../../models/Technology.dart';

List<Technology> createListTechnology() {
  return [
    const Technology(
        name: "Java",
        urlIcon: "assets/images/programLanguage/java.png",
        color: Color.fromRGBO(224, 31, 34, 1),
        typeLanguage: TypeLanguage.BACKEND,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "Python",
        urlIcon: "assets/images/programLanguage/python.png",
        color: Color.fromRGBO(48, 105, 152, 1),
        typeLanguage: TypeLanguage.LEARNING,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: ".Net MAUI",
        urlIcon: "assets/images/programLanguage/maui.png",
        color: Color.fromRGBO(160, 139, 232, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "PHP",
        urlIcon: "assets/images/programLanguage/php.png",
        color: Color.fromRGBO(97, 124, 190, 1),
        typeLanguage: TypeLanguage.BACKEND,
        typeDescription: TypeDescription.PHP),
    const Technology(
        name: "Kotlin",
        urlIcon: "assets/images/programLanguage/kotlin.png",
        color: Color.fromRGBO(241, 142, 0, 1),
        typeLanguage: TypeLanguage.BACKEND,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "Sprint Boot",
        urlIcon: "assets/images/programLanguage/sprint.png",
        color: Color.fromRGBO(139, 195, 74, 1),
        typeLanguage: TypeLanguage.LEARNING,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "Flutter",
        urlIcon: "assets/images/programLanguage/flutter.png",
        color: Color.fromRGBO(95, 201, 248, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.FLUTTER),
    const Technology(
        name: "Android",
        urlIcon: "assets/images/programLanguage/android.png",
        color: Color.fromRGBO(151, 192, 36, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "HTML",
        urlIcon: "assets/images/programLanguage/html.png",
        color: Color.fromRGBO(228, 77, 38, 1),
        typeLanguage: TypeLanguage.FRONTEND,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "CSS",
        urlIcon: "assets/images/programLanguage/css.png",
        color: Color.fromRGBO(38, 77, 228, 1),
        typeLanguage: TypeLanguage.FRONTEND,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "JavaScript",
        urlIcon: "assets/images/programLanguage/javascript.png",
        color: Color.fromRGBO(214, 186, 50, 1),
        typeLanguage: TypeLanguage.LEARNING,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "GIT",
        urlIcon: "assets/images/git.png",
        color: Color.fromRGBO(240, 80, 51, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "Github",
        urlIcon: "assets/images/github.png",
        color: Color.fromRGBO(36, 41, 47, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "IntelliJ",
        urlIcon: "assets/images/intelIj.png",
        color: Color.fromRGBO(18, 124, 239, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.JAVA),
  ];
}
