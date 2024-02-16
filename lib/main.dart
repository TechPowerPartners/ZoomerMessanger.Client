import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/bloc.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/event.dart';
import 'package:zoomerm_client/homepage/homepage_state.dart';
import 'package:zoomerm_client/login/login_page.dart';

void main() {
  runApp(const MyApp());
}
final GoRouter _router = GoRouter(
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
  ]
  );
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()..add(GetCurrentLogin() as LoginBloc)),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        title: "ZM",
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),{TODO} Make a theme data later
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
      ),
    );
  }
}
