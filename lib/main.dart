import 'package:flutter/material.dart';
import 'package:book_store/util/consts.dart';
import 'package:book_store/theme/theme_config.dart';
import 'package:book_store/view_models/app_provider.dart';
import 'package:book_store/view_models/details_provider.dart';
import 'package:book_store/view_models/favorites_provider.dart';
import 'package:book_store/view_models/genre_provider.dart';
import 'package:book_store/view_models/home_provider.dart';
import 'package:book_store/views/splash/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => DetailsProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => GenreProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key, //way we use keys
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey, //what is navigatorKey
          title: Constants.appName,
          theme: themeData(appProvider.theme),
          darkTheme: themeData(ThemeConfig.darkTheme),
          home: Splash(),
        );
      },
    );
  }

  // Apply font to our app's theme+> ok ok ok ok
  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}
