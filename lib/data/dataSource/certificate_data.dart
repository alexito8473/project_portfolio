enum Certificate {
  AWARD_ALGECIRAS(
      urlImg: "assets/images/certificates/premioAlgeciras.webp",
      title: "2º edición del premio Algeciras TechTalent al mejor trabajo fin de grado."),
  JAVA(
      urlImg: "assets/images/certificates/certificate_java.webp",
      title: "Certificado de java"),
  ESTRUCTURE_BLOC(
      urlImg: "assets/images/certificates/certificate_bloc.webp",
      title: "Estructura tu proyecto de Flutter con BLoC"),
  REACT_AI(
      urlImg: "assets/images/certificates/certificate_react_ai.webp",
      title: "React AI Chatbot built with ChatGPT and Gemini AI"),
  SPRING_AI(
      urlImg: "assets/images/certificates/certificate_spring_ai.webp",
      title: "Spring AI: Beginner to Guru"),
  TECHNOLOGY_5G_IA(
      urlImg: "assets/images/certificates/technologia5gIA.webp",
      title: "PROGRAMACIÓN EN INTELIGENCIA ARTIFICIAL Y BIG DATA APICABLES EN ENTORNOS 5G"),
  SANTANDER(
      urlImg: "assets/images/certificates/certificate_santander.jpg",
      title: "Pronting responsable: maxima la IA en tu negocio."),
  CERTIFICATE_IOT(
      urlImg: "assets/images/certificates/certificate_iot.webp",
      title: "PROGRAMACIÓN PARA SOLUCIONES DE IOT Y SMART CITY APLICABLES A ENTORNOS 5G."),
  CERTIFICATE_PROGRAMMING_C(
      urlImg: "assets/images/certificates/certificate_programming_c.webp",
      title: "The Complete C Programming Course for Basic to Expert"),
  CERTIFICATE_DART_MASTERING(
      urlImg: "assets/images/certificates/certificate_dart_mastery.webp",
      title: "Dart Mastery - Become a Dart Master From Zero to Hero."),
  CERTIFICATE_FLUTTER_ZERO_TO_FULL_PROJECT(
      urlImg: "assets/images/certificates/certificate_flutter_zero_project.webp",
      title: "Flutter desde 0 a proyectos"),
  CERTIFICATE_FLUTTER_REST_APP(
      urlImg: "assets/images/certificates/certificate_flutter_rest_app.webp",
      title: "Flutter REST Movie App: Master Flutter REST API Development"),
  CERTIFICATE_INTRODUCTION_DATA_SCIENCE(
      urlImg: "assets/images/certificates/certificate_introduction_data_science.webp",
      title: "Introducción a la ciencia de datos"),
  CERTIFICATE_CRUD_MONGODB(
      urlImg: "assets/images/certificates/certificate_crud_mongoDb.webp",
      title: "Operaciones crud, modelado y consultas con MongoDB");


  final String urlImg;
  final String title;

  const Certificate({required this.urlImg, required this.title});
}
