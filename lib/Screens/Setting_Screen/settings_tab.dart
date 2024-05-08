  import 'package:flutter/material.dart';



  import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
  import 'package:provider/provider.dart';
import 'package:todo_app/Shared/Styles/app_Colors.dart';

  import '../../Providers/my_provider.dart';
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.language,  style: GoogleFonts.lato(
      color: pro.modeApp==ThemeMode.light?Colors.black:Colors.blue,
          fontSize: 23
      )),
            const SizedBox(height: 15,),
            InkWell(
              onTap: () => showlanguagebottomsheet(),
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(10),

                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: primaryColor)),
                child:  Text(pro.languageCode=="en"? AppLocalizations.of(context)!.english:
                AppLocalizations.of(context)!.arabic,
                style: GoogleFonts.lato(
                  fontSize: 20
                ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
              Text(AppLocalizations.of(context)!.theme,
                  style: GoogleFonts.lato(
                color: pro.modeApp==ThemeMode.light?Colors.black:Colors.blue,
                fontSize: 23
              )),
            SizedBox(height: 15,),

            InkWell(
              onTap: () =>showThemeingbottomsheet() ,
              child: Container(
                height: 50,
              padding: const EdgeInsets.all(10),

                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: primaryColor)),
                child:  Text(pro.modeApp==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,
                style: GoogleFonts.lato(
                  fontSize: 20
                ),
                ),
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
