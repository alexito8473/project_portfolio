import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/ui/utils/CheckSize.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.08, bottom: size.height * 0.02),
          width: size.width * 0.70,
          child: Text(
            AppLocalizations.of(context)!.aboutMe,
            style: const TextStyle(fontSize: 40),
          ),
        ),
        Container(
            padding: EdgeInsets.only(
                bottom: size.height * .06, top: size.height * .03),
            width: size.width * 0.7,
            child: Text(
              AppLocalizations.of(context)!.aboutMeDescription,
              style: TextStyle(
                  fontSize: CheckSize.isMobile(size) ? 18 : 20,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.justify,
            ))
      ],
    );
  }
}
