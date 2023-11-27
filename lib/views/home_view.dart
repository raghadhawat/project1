import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/drawer_text.dart';
import 'package:pharma_track/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onTap: () {},
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
    );
  }
}
