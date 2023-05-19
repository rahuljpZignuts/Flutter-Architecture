import 'package:flutter/material.dart';
import 'package:flutter_architecture/l10n/locale_provider.dart';
import 'package:flutter_architecture/l10n/localization.dart';
import 'package:flutter_architecture/theme/navigation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
        child: Consumer<LocaleProvider>(
          builder: (context, localProvider, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'GFTS Flutter',
              initialRoute: Navigation.user_dashboard,
              routes: Navigation.routes,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate
              ],
              supportedLocales: L10n.all,
              locale: localProvider.locale ?? Locale("en"),
            );
          },
        ));
  }
}
