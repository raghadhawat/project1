import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/views/add_order_view.dart';
import 'package:pharma_track/views/all_medicine_view.dart';
import 'package:pharma_track/views/order_status_view.dart';
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
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 190, 238, 246),
                Color(0xffeeeee4),
                Colors.white,
                Color.fromARGB(255, 214, 233, 236),
              ],
            )),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Welcome To Our StoreHouse',
                  style: TextStyle(
                    fontFamily: kFont1,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff35bcd7),
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
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomMainCard(
                      image:
                          'assets/images/medicine-typography-word-art-background-of-drugstore-pharmacy-pill-tablet-bottle-glass-snake-with-outline-style-vector-design-illustration-2E35TBG.jpg',
                      onTap: () {
                        BlocProvider.of<AllApiCubit>(context)
                            .allCategory(context);
                        BlocProvider.of<AllApiCubit>(context)
                            .allMedicine(context);
                      },
                    ),
                    const CustomMainCard(
                      image: 'assets/images/download (1).jpg',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomMainCard(
                      image: 'assets/images/images.jpg',
                      onTap: () {
                        BlocProvider.of<OrderCubit>(context).fetchAllOrder();
                        Navigator.pushNamed(context, AddOrderView.id);
                      },
                    ),
                    CustomMainCard(
                      onTap: () {
                        BlocProvider.of<AllApiCubit>(context)
                            .orderStatus(context);
                        Navigator.pushNamed(context, OrderStatusView.id);
                      },
                      image:
                          'assets/images/order-status-rubber-stamp-vector-14032742.jpg',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomMainCard(
                  onTap: () {},
                  image:
                      'assets/images/report-word-lettering-vector-27785261.jpg',
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
