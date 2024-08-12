import 'dart:ui';
import 'package:flutter/cupertino.dart';
import '../../models/Technology.dart';

List<Technology> createListTechnology() {
  return [
    const Technology(
        name: "Java",
        urlIcon: "assets/svg/programLanguage/java.svg",
        color: Color.fromRGBO(224, 31, 34, 1),
        typeLanguage: TypeLanguage.BACKEND,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "Python",
        urlIcon: "assets/svg/programLanguage/python.svg",
        color: Color.fromRGBO(48, 105, 152, 1),
        typeLanguage: TypeLanguage.LEARNING,
        typeDescription: TypeDescription.PYTHON),
    const Technology(
        name: ".Net MAUI",
        urlIcon: "assets/svg/programLanguage/maui.svg",
        color: Color.fromRGBO(160, 139, 232, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.NET_MAUI),
    const Technology(
        name: "PHP",
        urlIcon: "assets/svg/programLanguage/php.svg",
        color: Color.fromRGBO(97, 124, 190, 1),
        typeLanguage: TypeLanguage.BACKEND,
        typeDescription: TypeDescription.PHP),
    const Technology(
        name: "Kotlin",
        urlIcon: "assets/svg/programLanguage/kotlin.svg",
        color: Color.fromRGBO(241, 142, 0, 1),
        typeLanguage: TypeLanguage.BACKEND,
        typeDescription: TypeDescription.KOTLIN),
    const Technology(
        name: "Sprint Boot",
        urlIcon: "assets/svg/programLanguage/spring.svg",
        color: Color.fromRGBO(139, 195, 74, 1),
        typeLanguage: TypeLanguage.LEARNING,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "Flutter",
        urlIcon: "assets/svg/programLanguage/flutter.svg",
        color: Color.fromRGBO(95, 201, 248, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.FLUTTER),
    const Technology(
        name: "Android",
        urlIcon: "assets/svg/programLanguage/android.svg",
        color: Color.fromRGBO(151, 192, 36, 1),
        typeLanguage: TypeLanguage.MOBILE,
        typeDescription: TypeDescription.ANDROID),
    const Technology(
        name: "HTML",
        urlIcon: "assets/svg/programLanguage/html.svg",
        color: Color.fromRGBO(228, 77, 38, 1),
        typeLanguage: TypeLanguage.FRONTEND,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "CSS",
        urlIcon: "assets/svg/programLanguage/css.svg",
        color: Color.fromRGBO(38, 77, 228, 1),
        typeLanguage: TypeLanguage.FRONTEND,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "JavaScript",
        urlIcon: "assets/svg/programLanguage/javascript.svg",
        color: Color.fromRGBO(214, 186, 50, 1),
        typeLanguage: TypeLanguage.LEARNING,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "GIT",
        urlIcon: "assets/svg/git.svg",
        color: Color.fromRGBO(240, 80, 51, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "Github",
        urlIcon: "assets/svg/github.svg",
        color: Color.fromRGBO(36, 41, 47, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "IntelliJ",
        urlIcon: "assets/svg/intellij.svg",
        color: Color.fromRGBO(18, 124, 239, 1),
        typeLanguage: TypeLanguage.TOOLS,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "MySQL",
        urlIcon: "assets/svg/programLanguage/mysql.svg",
        color: Color.fromRGBO(0, 116, 143, 1),
        typeLanguage: TypeLanguage.SERVERS,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "MongoDb",
        urlIcon: "assets/svg/programLanguage/mongoDb.svg",
        color: Color.fromRGBO(87, 174, 71, 1),
        typeLanguage: TypeLanguage.SERVERS,
        typeDescription: TypeDescription.JAVA),
    const Technology(
        name: "Firebase",
        urlIcon: "assets/svg/programLanguage/firebase.svg",
        color: Color.fromRGBO(255, 196, 0, 1),
        typeLanguage: TypeLanguage.SERVERS,
        typeDescription: TypeDescription.JAVA),
  ];
}
