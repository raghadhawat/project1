import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/views/login_view.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/drawer_text.dart';
import 'package:pharma_track/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  static String id = 'HomeView';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is AllApiLoading) {
          isLoading = true;
        } else if (state is AllApiSuccess) {
          Navigator.pushNamed(context, LoginView.id);
          isLoading = false;
        } else if (state is AllApiFailur) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          drawer: Drawer(
            backgroundColor: kThirdColor,
            child: ListView(children: [
              const DrawerText(
                title: 'name',
              ),
              const DrawerText(
                title: 'name',
              ),
              const DrawerText(
                title: 'name',
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<AllApiCubit>(context).allCategory(context);
                },
                child: const DrawerText(
                  title: 'LogOut',
                ),
              ),
            ]),
          ),
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            title: const AppBarText(),
          ),
          body: const HomeViewBody(),
        ),
      ),
    );
  }
}
