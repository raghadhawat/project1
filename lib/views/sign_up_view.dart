import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/views/home_view.dart';
import 'package:pharma_track/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static String id = 'SignUpView';

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpSuccess) {
          Navigator.pushNamed(context, HomeView.id);
          isLoading = false;
        } else if (state is SignUpFailure) {
          print(state.errMessage);
          showSnakbar(context, state.errMessage);

          isLoading = false;
        }
      },
      builder: (context, state) => BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        child: const Scaffold(
          body: SignUpViewBody(),
        ),
      ),
    );
  }
}
