import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/theme_color.dart';
import 'package:pharma_track/views/add_order_view.dart';
import 'package:pharma_track/views/all_medicine_view.dart';
import 'package:pharma_track/widgets/custom-main-card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AllApiCubit, AllApiState>(listener: (context, state) {
      if (state is AllApiLoading) {
        isLoading = true;
      } else if (state is AllApiSuccess) {
        Navigator.pushNamed(context, AllMedicineView.id);
        isLoading = false;
      } else if (state is AllApiFailur) {
        showSnakbar(context, state.errMessage);
        isLoading = false;
      }
    }, builder: (context, state) {
      return BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
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
                        BlocProvider.of<AllApiCubit>(context)
                            .allCategory(context);
                        BlocProvider.of<AllApiCubit>(context)
                            .allMedicine(context);
                      },
                    ),
                    CustomMainCard(
                      color: kThirdColor2,
                      title: 'Add Order',
                      onTap: () {
                        BlocProvider.of<OrderCubit>(context).fetchAllOrder();
                        Navigator.pushNamed(context, AddOrderView.id);
                      },
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
        ),
      );
    });
  }
}
