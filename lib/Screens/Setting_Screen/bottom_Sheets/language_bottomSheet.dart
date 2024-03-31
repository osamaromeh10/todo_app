import 'package:flutter/material.dart';
import 'package:islami_app/config/Theming/my_Theme_Data.dart';
import 'package:islami_app/myprovider/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.english,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.languageCode == "en"
                            ? MyThemeData.PrimaryColor
                            : Colors.black)),
                const Spacer(),
                provider.languageCode == "en"
                    ? Icon(
                        Icons.done,
                        color: provider.languageCode == "en"
                            ? MyThemeData.PrimaryColor
                            : Colors.black54,
                        size: 35,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.languageCode == "ar"
                            ? MyThemeData.PrimaryColor
                            : Colors.black)),
                const Spacer(),
                provider.languageCode == "en"
                    ? const SizedBox.shrink()
                    : Icon(
                        Icons.done,
                        color: provider.languageCode == "ar"
                            ? MyThemeData.PrimaryColor
                            : Colors.black,
                        size: 35,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
