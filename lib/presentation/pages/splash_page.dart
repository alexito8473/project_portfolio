import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../my_app.dart' deferred as my_app;

class SplashPage extends StatefulWidget {
  final void Function(Widget app) active;

  const SplashPage({super.key, required this.active});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Eliminamos el FutureBuilder del build y lo manejamos en initState
  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  Future<void> _initializePage() async {
    // 1. CARGA CRÍTICA: Solo lo necesario para ver la Home
    // Las rutas y sus páginas se cargan junto con MyApp en una única unidad.
    await my_app.loadLibrary();

    // 2. INICIALIZACIÓN DE DATOS
    final results = await Future.wait([
      dotenv.load(fileName: "assets/.env"),
      SharedPreferences.getInstance()
    ]);

    // 3. ARRANCAR LA APP
    // En este punto, Flutter reemplaza el Splash HTML
    widget.active(my_app.MyApp(prefs: results[1] as SharedPreferences));
  }

  @override
  Widget build(BuildContext context) {
    // Retornamos un Scaffold negro vacío.
    // Como el Splash HTML está encima, el usuario no verá el cambio
    // hasta que widget.active() sea llamado.
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.shrink()
    );
  }
}
