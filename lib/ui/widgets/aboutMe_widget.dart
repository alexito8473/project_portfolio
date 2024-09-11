import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: ResponsiveBreakpoints.of(context).screenHeight * 0.08,
              bottom: ResponsiveBreakpoints.of(context).screenHeight * 0.02),
          width: ResponsiveBreakpoints.of(context).screenWidth * 0.70,
          child: Text(
            AppLocalizations.of(context)!.aboutMe,
            style: const TextStyle(fontSize: 40),
          ),
        ),
        Container(
            padding: EdgeInsets.only(
                bottom: ResponsiveBreakpoints.of(context).screenHeight * .06,
                top: ResponsiveBreakpoints.of(context).screenHeight * .03),
            width: ResponsiveBreakpoints.of(context).screenWidth * 0.7,
            child: Text(AppLocalizations.of(context)!.aboutMeDescription,
                style: TextStyle(
                    fontSize:
                        ResponsiveBreakpoints.of(context).isMobile ? 18 : 20,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify))
      ],
    );
  }
}
