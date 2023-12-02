import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/views/login_view.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/drawer_text.dart';
import 'package:pharma_track/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutLoading) {
          isLoading = true;
        } else if (state is LogoutSuccess) {
          Navigator.pushNamed(context, LoginView.id);
          isLoading = false;
        } else if (state is LogoutFailure) {
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
              const SizedBox(
                height: 12,
              ),
              DrawerText(
                size: 24,
                icon: Icons.local_pharmacy_outlined,
                title:
                    "${AuthCubit.get(context).enterResponseModel?.data?.name}",
              ),
              const SizedBox(
                height: 12,
              ),
              DrawerText(
                size: 24,
                icon: Icons.person,
                title:
                    "${AuthCubit.get(context).enterResponseModel?.data?.userName}",
              ),
              const SizedBox(
                height: 12,
              ),
              DrawerText(
                size: 24,
                icon: Icons.place,
                title:
                    "${AuthCubit.get(context).enterResponseModel?.data?.address}",
              ),
              const SizedBox(
                height: 12,
              ),
              DrawerText(
                size: 16,
                icon: Icons.email,
                title:
                    "${AuthCubit.get(context).enterResponseModel?.data?.email}",
              ),
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<AuthCubit>(context).logOut(context);
                  print(
                      "${AuthCubit.get(context).logOutModel?.messege?.message}kk");
                },
                child: const DrawerText(
                  size: 24,
                  icon: Icons.logout,
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
