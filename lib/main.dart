import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/bloc.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/event.dart';
import 'package:zoomerm_client/chatting/chat_page.dart';
import 'package:zoomerm_client/global/global.dart';
import 'package:zoomerm_client/helpers/login_helper.dart';
import 'package:zoomerm_client/homepage/home_page.dart';
import 'package:zoomerm_client/login/login_page.dart';

void main() {
  runApp(const MyApp());
}
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      }),
      GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return LoginEnter();
      }),
      GoRoute(
      name: 'mychats',
      path: '/mychats/:chatid/:interl',
      builder: (context, state) => ChattingPage(
        chatid: state.pathParameters['chatid'], interlocutor: state.pathParameters['interl'])
      ),
      
  ]
  );

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()..add(GetCurrentLogin()))
      ],
      child: AdaptiveTheme(
        light: ThemeData(
          // Define your light theme here
          primarySwatch: Colors.blue,
          // other properties...
        ),
        dark: ThemeData(
          // Define your dark theme here
          primarySwatch: Colors.blue,
          // other properties...
        ),
        initial: AdaptiveThemeMode.light, // Initial theme mode
        builder: (theme, darkTheme) => MaterialApp.router(
          routerConfig: _router,
          title: "ZM",
          theme: theme, // Use the provided theme
          darkTheme: darkTheme, // Use the provided dark theme
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('ru', ''),
            Locale('kr', ''),
          ],
          builder: (context, child) {
            return FutureBuilder<void>(
              future: getGlobal(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return child!;
                } else {
                  return CircularProgressIndicator(); // Or some other loading indicator
                }
              },
            );
          },
        ),
      ),
    );
  }

  Future<void> getGlobal() async {
    var login = await LocalHelper.getAccountFromLocal();
    currentLogin = login;
  }
}