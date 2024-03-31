import 'package:flutter/material.dart';
import 'package:islami_app/config/Theming/my_Theme_Data.dart';

import 'package:islami_app/myprovider/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemingBottomSheet extends StatelessWidget {
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
provider.changeTheme(ThemeMode.dark);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.modeApp==ThemeMode.dark
                            ? MyThemeData.YellowColor
                            : Colors.black)),
                Spacer(),
                provider.modeApp == ThemeMode.dark
                    ? Icon(
                        Icons.done,
                        color:
                            MyThemeData.YellowColor,
                        size: 35,
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
            provider.changeTheme(ThemeMode.light);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.modeApp==ThemeMode.light
                            ? MyThemeData.PrimaryColor
                            : Colors.white)),
                Spacer(),
                provider.modeApp ==ThemeMode.dark
                    ? SizedBox.shrink()
                    : Icon(
                        Icons.done,
                        color:
                            MyThemeData.PrimaryColor,
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
