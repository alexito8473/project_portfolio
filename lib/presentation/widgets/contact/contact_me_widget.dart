import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/data/models/message.dart';
import 'package:proyect_porfolio/domain/blocs/appSendMessage/app_send_message_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../domain/cubits/appTheme/app_theme_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../customWidget/custom_button_widget.dart';

class ContactToMeWidget extends StatelessWidget {
  ContactToMeWidget({super.key});

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerMessage = TextEditingController();
  final TextEditingController _controllerSubject = TextEditingController();
  final ValueNotifier<bool> _isDesactivateButton = ValueNotifier<bool>(true);

  void checkIsDesactivateButton() {
    final isCurrentDesactivateButton = _controllerName.text.isEmpty ||
        _controllerEmail.text.isEmpty ||
        _controllerMessage.text.isEmpty ||
        _controllerSubject.text.isEmpty ||
        !EmailValidator.validate(_controllerEmail.text);
    if (isCurrentDesactivateButton != _isDesactivateButton.value) {
      _isDesactivateButton.value = isCurrentDesactivateButton;
    }
  }

  void _sendEmail(BuildContext context) {
    if (_isDesactivateButton.value) return;
    final name = _controllerName.text;
    final email = _controllerEmail.text;
    final message = _controllerMessage.text;
    final subject = _controllerSubject.text;
    _controllerName.clear();
    _controllerEmail.clear();
    _controllerMessage.clear();
    _controllerSubject.clear();
    _isDesactivateButton.value = true;
    context.read<AppSendMessageBloc>().add(AppSendMessageEvent(
        message: Message(
            name: name, subject: subject, message: message, email: email)));
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale=AppLocalizations.of(context)!;
    final responsiveBreakpoints = ResponsiveBreakpoints.of(context);
    final isDarkMode = context.watch<AppThemeCubit>().state.appTheme.isDarkMode();
    return BlocBuilder<AppSendMessageBloc, AppSendMessageState>(
        builder: (context, state) {
          return SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: responsiveBreakpoints.isMobile
                          ? responsiveBreakpoints.screenWidth * 0.1
                          : responsiveBreakpoints.screenWidth * 0.15),
                  padding: EdgeInsets.symmetric(
                      vertical: responsiveBreakpoints.screenHeight * 0.02,
                      horizontal: responsiveBreakpoints.screenWidth * 0.08),
                  width: responsiveBreakpoints.isMobile
                      ? responsiveBreakpoints.screenWidth * .8
                      : responsiveBreakpoints.screenWidth * .6,
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
                            title: locale.formName,
                            isBigMessage: false,
                            checkIsDesactivateButton: checkIsDesactivateButton),
                        ContactToMeFormField(
                            myController: _controllerEmail,
                            icon: const Icon(Icons.email),
                            title: locale.formEmail,
                            isBigMessage: false,
                            checkIsDesactivateButton: checkIsDesactivateButton),
                        ContactToMeFormField(
                            myController: _controllerSubject,
                            title: locale.formSubject,
                            isBigMessage: false,
                            checkIsDesactivateButton: checkIsDesactivateButton,
                            icon: const Icon(Icons.subject)),
                        ContactToMeFormField(
                            myController: _controllerMessage,
                            icon: const Icon(CupertinoIcons.pen),
                            title: locale.formMessage,
                            isBigMessage: true,
                            checkIsDesactivateButton: checkIsDesactivateButton),
                        ValueListenableBuilder<bool>(
                            valueListenable: _isDesactivateButton,
                            builder: (context, isDesactivate, child) {
                              return Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: ButtonSentEmail(
                                            isDesactivate: isDesactivate,
                                            sendEmail: () => _sendEmail(context))),
                                    if (state.sentFinished)
                                      Expanded(
                                          child: Padding(
                                              padding:
                                              const EdgeInsets.only(right: 15),
                                              child: AutoSizeText(
                                                state.sentSuccessfully
                                                    ? locale
                                                    .formRequestCorrect
                                                    : locale
                                                    .formRequestInCorrect,
                                                maxLines: 3,
                                                style:
                                                const TextStyle(fontSize: 18),
                                              ))),
                                    if (state.sendMessage)
                                      const CircularProgressIndicator()
                                  ]);
                            })
                      ])));
        });
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
    bool isDarkMode = context.watch<AppThemeCubit>().state.appTheme.isDarkMode();
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))
    );
  }
}
