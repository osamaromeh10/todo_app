import 'package:flutter/material.dart';


import 'package:islami_app/config/Theming/my_Theme_Data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/myprovider/my_provider.dart';
import 'package:provider/provider.dart';

import 'bottom_Sheets/language_bottomSheet.dart';
import 'bottom_Sheets/theming_bottomSheet.dart';


class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language, style: Theme.of(context).textTheme.bodySmall),
          InkWell(
            onTap: () => showlanguagebottomsheet(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyThemeData.PrimaryColor)),
              child:  Text(pro.languageCode=="en"? AppLocalizations.of(context)!.english:
              AppLocalizations.of(context)!.arabic),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(AppLocalizations.of(context)!.theme, style: Theme.of(context).textTheme.bodySmall),

          InkWell(
            onTap: () =>showThemeingbottomsheet() ,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: MyThemeData.PrimaryColor)),
              child:  Text(pro.modeApp==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark),
            ),
          ),



        ],
      ),
    );
  }

  showlanguagebottomsheet() {
    showModalBottomSheet(
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)
          ),
        borderSide: BorderSide(color: Colors.transparent)

      ),
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
  showThemeingbottomsheet(){
    showModalBottomSheet(
        shape: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
    topRight: Radius.circular(25)
    ),
    borderSide: BorderSide(color: Colors.transparent)

    ),
      context: context,
      builder: (context) => ThemingBottomSheet(),

    );
  }

}
