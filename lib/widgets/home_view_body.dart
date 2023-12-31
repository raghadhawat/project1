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
import 'package:pharma_track/widgets/custom_main_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      // decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //   begin: Alignment.topCenter,
      //   end: Alignment.bottomCenter,
      //   colors: [
      //     Color.fromARGB(255, 190, 238, 246),
      //     Color(0xffeeeee4),
      //     Colors.white,
      //     Color.fromARGB(255, 214, 233, 236),
      //   ],
      // )),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Container(
              child: Stack(children: [
                Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        color: kPrimaryColor,
                        height: 200,
                      )),
                ),
                ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: kPrimaryColor,
                      height: 180,
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          // Text(
                          //   'Welcome To Our StoreHouse',
                          //   style: TextStyle(
                          //     fontFamily: kFont1,
                          //     fontSize: 32,
                          //     fontWeight: FontWeight.bold,
                          //     color: kThirdColor,
                          //   ),
                          // ),
                          Text(
                            ' where you can find all your  ',
                            style: TextStyle(
                              fontFamily: kFont2,
                              fontSize: 28,
                              // fontWeight: FontWeight.bold,
                              color: kThirdColor,
                            ),
                          ),
                          Text(
                            ' needs from medicine',
                            style: TextStyle(
                              fontFamily: kFont2,
                              fontSize: 28,
                              // fontWeight: FontWeight.bold,
                              color: kThirdColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )),
              ]),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomMainCard(
                    leftPadding: 90,
                    height: 350,
                    image: 'assets/images/pharmacy.png',
                    name: 'MEDICINE',
                    onTap: () {
                      BlocProvider.of<AllApiCubit>(context)
                          .allCategory(context);
                      BlocProvider.of<AllApiCubit>(context)
                          .allMedicine(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomMainCard(
                    leftPadding: 90,
                    height: 250,
                    image: 'assets/images/order 1.png',
                    name: 'ORDER',
                    onTap: () {
                      BlocProvider.of<OrderCubit>(context).fetchAllOrder();
                      Navigator.pushNamed(context, AddOrderView.id);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomMainCard(
                    leftPadding: 30,
                    height: 100,
                    image: 'assets/images/order status.png',
                    onTap: () {
                      BlocProvider.of<AllApiCubit>(context)
                          .orderStatus(context);
                    },
                    name: 'ORDER STARUS',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomMainCard(
                    leftPadding: 80,
                    height: 250,
                    image: 'assets/images/favourite.png',
                    name: 'FAVOURITE',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomMainCard(
                    leftPadding: 102.9,
                    height: 100,
                    image: 'assets/images/report.png',
                    onTap: () {},
                    name: 'REPOET',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var seconedStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var seconedEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        seconedStart.dx, seconedStart.dy, seconedEnd.dx, seconedEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
