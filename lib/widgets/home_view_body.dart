import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/theme_color.dart';
import 'package:pharma_track/views/medicine_view.dart';
import 'package:pharma_track/widgets/custom-main-card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: ThemeColor(),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Image.asset(
              kLogo,
              height: 150,
            ),
            const Text(
              'Welcome To Our StoreHouse',
              style: TextStyle(
                fontFamily: kFont1,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const Text(
              'here where you can find all  ',
              style: TextStyle(
                fontFamily: kFont2,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const Text(
              'your needs from medicine',
              style: TextStyle(
                fontFamily: kFont2,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomMainCard(
                  color: kThirdColor2,
                  title: 'Medicine',
                  onTap: () {
                    BlocProvider.of<AllApiCubit>(context).allCategory(context);
                    BlocProvider.of<AllApiCubit>(context).allMedicine(context);
                    Navigator.pushNamed(context, MedicineView.id);
                  },
                ),
                CustomMainCard(
                  color: kThirdColor2,
                  title: 'Add Order',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomMainCard(
                  color: kThirdColor2,
                  title: 'Order Status',
                ),
                CustomMainCard(
                  color: kThirdColor2,
                  title: 'Favourit',
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomMainCard(
              onTap: () {},
              color: kThirdColor2,
              title: 'Report',
            )
          ],
        ),
      ),
    );
  }
}
