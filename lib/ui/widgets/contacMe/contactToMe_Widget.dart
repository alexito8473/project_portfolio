import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/models/Message.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:proyect_porfolio/ui/widgets/customWidget/titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../data/services/SendMessage.dart';
import '../customWidget/customButton_widget.dart';

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
  bool _isDesactivateButton = true;
  bool _isSendMessage = false;
  bool _isFinishSentMessage = false;
  bool _isCorrectMessage = false;
  void checkIsDesactivateButton() {
    final isCurrentDesactivateButton = _controllerName.text.isEmpty ||
        _controllerEmail.text.isEmpty ||
        _controllerMessage.text.isEmpty ||
        _controllerSubject.text.isEmpty ||
        !EmailValidator.validate(_controllerEmail.text);
    if (isCurrentDesactivateButton != _isDesactivateButton) {
      setState(() {
        _isDesactivateButton = isCurrentDesactivateButton;
      });
    }
  }

  void _sendEmail() async {
    if (_isDesactivateButton) {
      return;
    }
    final name = _controllerName.text;
    final email = _controllerEmail.text;
    final message = _controllerMessage.text;
    final subject = _controllerSubject.text;
    bool isCorrect = false;
    setState(() {
      _controllerName.text = "";
      _controllerEmail.text = "";
      _controllerMessage.text = "";
      _controllerSubject.text = "";
      _isSendMessage = true;
      _isFinishSentMessage = false;
    });
    isCorrect = await SendMessage.getInstance()!.sendEmail(
        Message(name: name, subject: subject, message: message, email: email));
    setState(() {
      _isSendMessage = false;
      _isFinishSentMessage = true;
      _isCorrectMessage = isCorrect;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<AppThemeBloc>().state.isDarkMode();
    return Column(
      children: [
        const SizedBox(
          height: 100
        ),
        TitleHome(title: AppLocalizations.of(context)!.contact_me),
        Container(
            margin: EdgeInsets.only(
                top: ResponsiveBreakpoints.of(context).isMobile
                    ? 0
                    : ResponsiveBreakpoints.of(context).screenHeight * 0.01),
            padding: EdgeInsets.symmetric(
                vertical: ResponsiveBreakpoints.of(context).screenHeight * 0.02,
                horizontal:
                    ResponsiveBreakpoints.of(context).screenWidth * 0.08),
            width: ResponsiveBreakpoints.of(context).isMobile
                ? ResponsiveBreakpoints.of(context).screenWidth * .8
                : ResponsiveBreakpoints.of(context).screenWidth * .7,
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
                    isDarkMode ? Colors.black : Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContactToMeFormField(
                    myController: _controllerName,
                    icon: const Icon(Icons.person),
                    title: AppLocalizations.of(context)!.formName,
                    isBigMessage: false,
                    checkIsDesactivateButton: checkIsDesactivateButton),
                ContactToMeFormField(
                    myController: _controllerEmail,
                    icon: const Icon(Icons.email),
                    title: AppLocalizations.of(context)!.formEmail,
                    isBigMessage: false,
                    checkIsDesactivateButton: checkIsDesactivateButton),
                ContactToMeFormField(
                    myController: _controllerSubject,
                    title: AppLocalizations.of(context)!.formSubject,
                    isBigMessage: false,
                    checkIsDesactivateButton: checkIsDesactivateButton,
                    icon: const Icon(Icons.subject)),
                ContactToMeFormField(
                    myController: _controllerMessage,
                    icon: const Icon(CupertinoIcons.pen),
                    title: AppLocalizations.of(context)!.formMessage,
                    isBigMessage: true,
                    checkIsDesactivateButton: checkIsDesactivateButton),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: ButtonSentEmail(
                        isDesactivate: _isDesactivateButton,
                        sendEmail: _sendEmail,
                      ),
                    ),
                    if (_isFinishSentMessage)
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: AutoSizeText(
                                _isCorrectMessage
                                    ? AppLocalizations.of(context)!
                                        .formRequestCorrect
                                    : AppLocalizations.of(context)!
                                        .formRequestInCorrect,
                                maxLines: 3,
                                style: const TextStyle(fontSize: 18),
                              ))),
                    if (_isSendMessage) const CircularProgressIndicator()
                  ],
                )
              ],
            )),
      ],
    );
  }
}

class ContactToMeFormField extends StatelessWidget {
  final Function checkIsDesactivateButton;
  final TextEditingController myController;
  final Icon icon;
  final String title;
  final bool isBigMessage;
  const ContactToMeFormField(
      {super.key,
      required this.myController,
      required this.icon,
      required this.title,
      required this.isBigMessage,
      required this.checkIsDesactivateButton});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<AppThemeBloc>().state.isDarkMode();
    return TextFormField(
      onChanged: (value) => checkIsDesactivateButton(),
      controller: myController,
      maxLines: isBigMessage ? 5 : 1,
      decoration: InputDecoration(
          labelText: title,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: isDarkMode ? Colors.white : Colors.blue, width: 2.5)),
          floatingLabelStyle:
              TextStyle(color: isDarkMode ? Colors.white : null, height: 20),
          disabledBorder: InputBorder.none,
          prefixIcon: icon,
          filled: true,
          fillColor: isDarkMode ? Colors.grey.shade700 : Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
