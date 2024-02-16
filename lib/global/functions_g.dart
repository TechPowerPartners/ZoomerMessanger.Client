import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/bloc.dart';
import 'package:zoomerm_client/blocs/login_bloc.dart/event.dart';

refreshLogin(BuildContext context) async {
  BlocProvider.of<LoginBloc>(context).add(GetCurrentLogin() as LoginBloc);
}