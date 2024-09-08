import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/ui/widgets/titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactToMeWidget extends StatefulWidget {
  const ContactToMeWidget({super.key});

  @override
  State<ContactToMeWidget> createState() => _ContactToMeWidgetState();
}

class _ContactToMeWidgetState extends State<ContactToMeWidget> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isMobile = size.width < 600;
    bool isDarkMode = context.watch<AppThemeBloc>().state.isDarkMode();
    Color letter = Colors.black;
    return Column(
      children: [
        TitleHome(
          size: size,
          title: AppLocalizations.of(context)!.contact_me,
          isMobile: isMobile,
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          width: size.width * .7,
          height: 500,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: isDarkMode
                        ? Colors.blueAccent.withOpacity(0.9)
                        : Colors.blueAccent.withOpacity(0.4),
                    blurRadius: 4,
                    spreadRadius: 3)
              ],
              color: isDarkMode
                  ? Colors.white.withOpacity(.95)
                  : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20)),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoSizeText(
                  "Envíame un mensaje y me pondré en contacto contigo pronto.",
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: letter, fontSize: 25)),
              ContactToMeFormField(
                size: size,
                myController: _controllerName,
                icon: const Icon(Icons.person),
                title: 'Nombre',
                isBigMessage: false,
              ),
              ContactToMeFormField(
                size: size,
                myController: _controllerEmail,
                icon: const Icon(Icons.email),
                title: 'Correo electrónico',
                isBigMessage: false,
              ),
              ContactToMeFormField(
                size: size,
                myController: _controllerMessage,
                icon: const Icon(CupertinoIcons.pen),
                title: 'Mensaje',
                isBigMessage: true,
              ),
              Text(_controllerName.text)
            ],
          )),
        )
      ],
    );
  }
}

class ContactToMeFormField extends StatefulWidget {
  final Size size;
  final TextEditingController myController;
  final Icon icon;
  final String title;
  final bool isBigMessage;
  const ContactToMeFormField(
      {super.key,
      required this.size,
      required this.myController,
      required this.icon,
      required this.title,
      required this.isBigMessage});

  @override
  State<ContactToMeFormField> createState() => _ContactToMeFormFieldState();
}

class _ContactToMeFormFieldState extends State<ContactToMeFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.5,
      height: 80,
      child: TextFormField(
        controller: widget.myController,
        maxLines: widget.isBigMessage ? 10 : 1,
        decoration: InputDecoration(icon: widget.icon, hintText: widget.title),
      ),
    );
  }
}
