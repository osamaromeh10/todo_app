import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/Shared/Styles/app_Colors.dart';

import '../../../Providers/my_provider.dart';
import '../../../Shared/Styles/my_Theme_Data.dart';

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
                Text(
                    AppLocalizations.of(context)!.english,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                        color: provider.languageCode == "en"
                            ? primaryColor
                            : Colors.black),

                ),
                const Spacer(),
                provider.languageCode == "en"
                    ? Icon(
                        Icons.done,
                        color: provider.languageCode == "en"
                            ? primaryColor
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
                      fontSize: 20,
                        color: provider.languageCode == "ar"
                            ? primaryColor
                            : Colors.black)),
                const Spacer(),
                provider.languageCode == "en"
                    ? const SizedBox.shrink()
                    : Icon(
                        Icons.done,
                        color: provider.languageCode == "ar"
                            ? primaryColor
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
