import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/models/Message.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/ui/widgets/titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/services/SendMessage.dart';
import 'customButton_widget.dart';

class ContactToMeWidget extends StatefulWidget {
  const ContactToMeWidget({super.key});

  @override
  State<ContactToMeWidget> createState() => _ContactToMeWidgetState();
}

class _ContactToMeWidgetState extends State<ContactToMeWidget> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerMessage = TextEditingController();
  final TextEditingController _controllerSubject = TextEditingController();
  bool isDesactivateButton = true;
  bool isSendMessage = false;
  bool isFinishSentMessage = false;
  bool isCorrectMessage = false;
  void checkIsDesactivateButton() {
    setState(() {
      isDesactivateButton = _controllerName.text.isEmpty ||
          _controllerEmail.text.isEmpty ||
          _controllerMessage.text.isEmpty ||
          _controllerSubject.text.isEmpty ||
          !EmailValidator.validate(_controllerEmail.text);
    });
  }

  void _sendEmail() async {
    bool isCorrect = false;
    setState(() {
      isSendMessage = true;
      isFinishSentMessage = false;
    });
    if (!isDesactivateButton) {
      isCorrect = await SendMessage.getInstance()!.sendEmail(Message(
          name: _controllerName.text,
          subject: _controllerSubject.text,
          message: _controllerMessage.text,
          email: _controllerEmail.text));
      _controllerName.text = "";
      _controllerEmail.text = "";
      _controllerMessage.text = "";
      _controllerSubject.text = "";
    }
    setState(() {
      isSendMessage = false;
      isFinishSentMessage = true;
      isCorrectMessage = isCorrect;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isMobile = size.width < 600;
    bool isDarkMode = context.watch<AppThemeBloc>().state.isDarkMode();
    return Column(
      children: [
        TitleHome(
          size: size,
          title: AppLocalizations.of(context)!.contact_me,
          isMobile: isMobile,
        ),
        Container(
            margin: EdgeInsets.only(top: isMobile ? 0 : size.height * 0.1),
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.05, horizontal: size.width * 0.1),
            width: isMobile ? size.width * .8 : size.width * .7,
            height: 520,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: isDarkMode
                          ? Colors.white30
                          : Colors.blueAccent.withOpacity(0.4),
                      blurRadius: 4,
                      spreadRadius: 3)
                ],
                color:
                    isDarkMode ? Colors.black87 : Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContactToMeFormField(
                  size: size,
                  myController: _controllerName,
                  icon: const Icon(Icons.person),
                  title: AppLocalizations.of(context)!.formName,
                  isBigMessage: false,
                  checkIsDesactivateButton: checkIsDesactivateButton,
                  isMobile: isMobile,
                ),
                ContactToMeFormField(
                  size: size,
                  myController: _controllerEmail,
                  icon: const Icon(Icons.email),
                  title: AppLocalizations.of(context)!.formEmail,
                  isBigMessage: false,
                  checkIsDesactivateButton: checkIsDesactivateButton,
                  isMobile: isMobile,
                ),
                ContactToMeFormField(
                  size: size,
                  myController: _controllerSubject,
                  title: AppLocalizations.of(context)!.formSubject,
                  isBigMessage: false,
                  checkIsDesactivateButton: checkIsDesactivateButton,
                  isMobile: isMobile,
                  icon: const Icon(Icons.subject),
                ),
                ContactToMeFormField(
                  size: size,
                  myController: _controllerMessage,
                  icon: const Icon(CupertinoIcons.pen),
                  title: AppLocalizations.of(context)!.formMessage,
                  isBigMessage: true,
                  checkIsDesactivateButton: checkIsDesactivateButton,
                  isMobile: isMobile,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: ButtonContactToMe(
                        isDesactivate: isDesactivateButton,
                        sendEmail: _sendEmail,
                      ),
                    ),
                    if (isFinishSentMessage)
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: AutoSizeText(
                                isCorrectMessage
                                    ? AppLocalizations.of(context)!
                                        .formRequestCorrect
                                    : AppLocalizations.of(context)!
                                        .formRequestInCorrect,
                                maxLines: 3,
                                style: const TextStyle(fontSize: 18),
                              ))),
                    if (isSendMessage) const CircularProgressIndicator()
                  ],
                )
              ],
            )),
      ],
    );
  }
}

class ContactToMeFormField extends StatefulWidget {
  final Size size;
  final Function checkIsDesactivateButton;
  final TextEditingController myController;
  final Icon icon;
  final bool isMobile;
  final String title;
  final bool isBigMessage;
  const ContactToMeFormField(
      {super.key,
      required this.size,
      required this.myController,
      required this.icon,
      required this.title,
      required this.isBigMessage,
      required this.checkIsDesactivateButton,
      required this.isMobile});

  @override
  State<ContactToMeFormField> createState() => _ContactToMeFormFieldState();
}

class _ContactToMeFormFieldState extends State<ContactToMeFormField> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<AppThemeBloc>().state.isDarkMode();
    return TextFormField(
      onChanged: (value) => widget.checkIsDesactivateButton(),
      controller: widget.myController,
      maxLines: widget.isBigMessage ? 5 : 1,
      showCursor: true,
      decoration: InputDecoration(
          labelText: widget.title,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: isDarkMode ? Colors.white:Colors.blue,
                width: 2.5
              )),
          floatingLabelStyle:
              TextStyle(color: isDarkMode ? Colors.white : null, height: 20),
          disabledBorder: InputBorder.none,
          prefixIcon: widget.icon,
          filled: true,
          fillColor: isDarkMode ? Colors.grey.shade700 : Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
