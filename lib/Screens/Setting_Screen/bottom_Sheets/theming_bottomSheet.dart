import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/Shared/Styles/app_Colors.dart';

import '../../../Providers/my_provider.dart';


class ThemingBottomSheet extends StatelessWidget {
  bool isEnglish = true;

  ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
provider.changeTheme(ThemeMode.dark);
            },
            child: Row(
              children: [
                Text(
                    AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 23,
                        color: provider.modeApp==ThemeMode.dark
                            ? primaryColor
                            : Colors.black)),
                const Spacer(),
                provider.modeApp == ThemeMode.dark
                    ? const Icon(
                        Icons.done,
                        color:
                         primaryColor,
                        size: 35,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
            provider.changeTheme(ThemeMode.light);
            },
            child: Row(
              children: [
                Text(
                    AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 23,
                        color: provider.modeApp==ThemeMode.light

                            ? primaryColor
                            : Colors.white)),
                const Spacer(),
                provider.modeApp ==ThemeMode.dark
                    ? const SizedBox.shrink()
                    : const Icon(
                        Icons.done,
                        color:
                        primaryColor,
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
