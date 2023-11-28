import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/views/home_view.dart';
import 'package:pharma_track/widgets/login_view_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, HomeView.id);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        child: const Scaffold(
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
