
import 'package:flutter/material.dart';


import 'package:proyect_porfolio/presentation/screens/project_screens.dart';


class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
 return const ProjectScreens();
  }
}
