import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miria/extensions/color_extension.dart';
import 'package:miria/model/color_theme.dart';
import 'package:miria/model/general_settings.dart';
import 'package:miria/providers.dart';
import 'package:miria/view/themes/app_theme.dart';
import 'package:miria/view/themes/built_in_color_themes.dart';

class AppThemeScope extends ConsumerStatefulWidget {
  final Widget child;

  const AppThemeScope({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AppThemeScopeState();
}

class AppThemeScopeState extends ConsumerState<AppThemeScope> {
  AppThemeData buildDarkAppThemeData(BuildContext context, ColorTheme theme) {
    return AppThemeData(
        noteTextStyle: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
        ),
        reactionButtonStyle: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(5),
            elevation: 0,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        linkStyle: TextStyle(color: theme.link),
        hashtagStyle: TextStyle(color: theme.hashtag),
        mentionStyle: TextStyle(color: theme.mention),
        reactionButtonBackgroundColor: theme.buttonBackground,
        reactionButtonMeReactedColor: theme.primary,
        renoteBorderColor: theme.renote,
        renoteBorderRadius: const Radius.circular(20),
        renoteStrokeWidth: 1.5,
        renoteStrokePadding: 0.0,
        renoteDashPattern: [10.0, 6.0],
        currentDisplayTabColor:
            theme.isDarkTheme ? theme.primaryDarken : theme.primaryLighten);
  }

  String resolveFontFamilyName() {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return "SF Pro Text";
    }

    return "KosugiMaru";
  }

  List<String> resolveFontFamilyCallback() {
    if (defaultTargetPlatform == TargetPlatform.windows) {
      return ["Noto Sans CJK JP", "KosugiMaru", "BIZ UDPGothic"];
    }
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return [
        "Helvetica Neue",
        "Apple Color Emoji",
        "Hiragino Maru Gothic ProN"
      ];
    }
    return [];
  }

  ThemeData buildTheme(BuildContext context, ColorTheme theme) {
    final textThemePre = Theme.of(context).textTheme.merge(
        (theme.isDarkTheme ? ThemeData.dark() : ThemeData.light())
            .textTheme
            .apply(
                fontFamily: resolveFontFamilyName(),
                fontFamilyFallback: resolveFontFamilyCallback(),
                bodyColor: theme.foreground));
    final textTheme = textThemePre.copyWith(
        bodySmall: textThemePre.bodySmall?.copyWith(
            color: theme.isDarkTheme
                ? theme.foreground.darken(0.1)
                : theme.foreground.lighten(0.1)));

    final themeData = ThemeData(
        brightness: theme.isDarkTheme ? Brightness.dark : Brightness.light,
        primaryColor: theme.primary,
        primaryColorDark: theme.primaryDarken,
        primaryColorLight: theme.primaryLighten,
        appBarTheme: AppBarTheme(
            elevation: 0,
            titleSpacing: 0,
            titleTextStyle:
                textTheme.headlineSmall?.copyWith(color: Colors.white),
            backgroundColor:
                theme.isDarkTheme ? theme.panelBackground : theme.primary,
            iconTheme: const IconThemeData(color: Colors.white)),
        drawerTheme: DrawerThemeData(backgroundColor: theme.panel),
        listTileTheme: ListTileThemeData(iconColor: theme.foreground),
        scaffoldBackgroundColor: theme.panel,
        tabBarTheme: TabBarTheme(
            labelColor: theme.foreground,
            labelStyle: textTheme.titleSmall,
            unselectedLabelStyle: textTheme.titleSmall
                ?.copyWith(color: textTheme.bodySmall?.color),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: theme.primary))),
        textTheme: textTheme,
        iconTheme: IconThemeData(color: theme.foreground),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(textTheme.bodyMedium
                    ?.copyWith(inherit: false, color: Colors.white)),
                backgroundColor: MaterialStatePropertyAll(theme.primary),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                elevation: const MaterialStatePropertyAll(0),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(theme.primary),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))))),
        dividerTheme: DividerThemeData(color: theme.divider),
        progressIndicatorTheme:
            ProgressIndicatorThemeData(color: theme.primary),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: theme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: theme.panelBackground,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: theme.divider),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.divider),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(5),
          hintStyle: textTheme.bodySmall
              ?.copyWith(fontSize: textTheme.titleMedium?.fontSize),
          isDense: true,
        ),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStatePropertyAll(theme.primary)));

    return themeData;
  }

  @override
  Widget build(BuildContext context) {
    final colorSystem = ref.watch(generalSettingsRepositoryProvider
        .select((value) => value.settings.themeColorSystem));
    final lightTheme = ref.watch(generalSettingsRepositoryProvider
        .select((value) => value.settings.lightColorThemeId));
    final darkTheme = ref.watch(generalSettingsRepositoryProvider
        .select((value) => value.settings.darkColorThemeId));

    final bool isDark;
    if (colorSystem == ThemeColorSystem.system) {
      isDark = WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    } else if (colorSystem == ThemeColorSystem.forceDark) {
      isDark = true;
    } else {
      isDark = false;
    }

    final foundColorTheme = builtInColorThemes.firstWhereOrNull((e) =>
            e.isDarkTheme == isDark &&
            e.id == (isDark ? darkTheme : lightTheme)) ??
        builtInColorThemes
            .firstWhere((element) => element.isDarkTheme == isDark);

    return Theme(
      data: buildTheme(context, foundColorTheme),
      child: AppTheme(
          themeData: buildDarkAppThemeData(context, foundColorTheme),
          child: widget.child),
    );
  }
}
