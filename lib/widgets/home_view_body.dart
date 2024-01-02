import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/views/order_status_view.dart';
import 'package:pharma_track/views/report_view.dart';
import 'package:pharma_track/widgets/order_status_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    BlocProvider.of<AllApiCubit>(context).lastFour(context);
    Color color = Color(0xff31a9e3);

    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is LastFourSuccess) {}
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 50),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "${AuthCubit.get(context).enterResponseModel?.data?.name}",
              //         style: const TextStyle(color: Colors.grey, fontSize: 18),
              //       ),
              //       Text(
              //         "${AuthCubit.get(context).enterResponseModel?.data?.userName}",
              //         style: const TextStyle(
              //             color: Colors.black,
              //             fontSize: 26,
              //             fontWeight: FontWeight.bold),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/103740034-medicine-and-science-with-abstract-digital-hi-tech-hexagons-on-blue-background.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello To RepoMed',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Text(
                          'Where You can find all',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          '   your needs from ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          '      medicines',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AllApiCubit>(context)
                                .report(context);
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              Text(
                                "Details",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 160,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 14,
                  ),
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<AllApiCubit>(context)
                            .allCategory(context);
                        BlocProvider.of<AllApiCubit>(context)
                            .allMedicine(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 10, right: 2),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/images (8).png",
                                    height: 55,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    'Mesdicines',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<AllApiCubit>(context)
                            .showFavourite(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, right: 10, left: 2),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Card(
                            elevation: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Image.asset(
                                    "assets/images/favourite.png",
                                    height: 45,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 100,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    'Favourite',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ((cubit.lastFourModel?.data) == null) ||
                      (cubit.lastFourModel!.data!.isEmpty)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 140, horizontal: 50),
                      child: Center(
                          child: Text(
                        'There is no orders yet',
                        style: TextStyle(fontSize: 24, color: Colors.grey[400]),
                      )),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 16, left: 16, bottom: 2),
                          child: Text(
                            "Last oreders:",
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                fontFamily: kFont2),
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AllApiCubit>(context)
                                      .orderStatus(context);
                                  Navigator.pushNamed(
                                      context, OrderStatusView.id);
                                },
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff31a9e3)),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2.9,
                          child: ListView.builder(
                            itemCount: cubit.lastFourModel?.data!.length,
                            itemBuilder: (context, index) {
                              if ((cubit.lastFourModel?.data) != null) {
                                if (cubit.lastFourModel?.data?[index].status ==
                                    "New") {
                                  color = Color(0xff31a9e3);
                                } else if (cubit
                                        .lastFourModel?.data![index].status ==
                                    "Preparng") {
                                  color = Colors.deepPurple[500]!;
                                } else if (cubit
                                        .lastFourModel?.data![1].status ==
                                    "Delivering") {
                                  color = Colors.orange[500]!;
                                } else if (cubit
                                        .lastFourModel?.data![index].status ==
                                    "Recieved") {
                                  color = Colors.green[500]!;
                                }
                              }
                              return GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AllApiCubit>(context).orders(
                                      context,
                                      id: cubit
                                          .lastFourModel!.data![index].id!);
                                },
                                child: OrderStatusCard(
                                  color: color,
                                  date:
                                      '${cubit.lastFourModel?.data?[index].createdAt!.substring(0, 10)}',
                                  status:
                                      '${cubit.lastFourModel?.data?[index].status}',
                                  price:
                                      '${cubit.lastFourModel?.data?[index].totalPrice}',
                                  paidStatus:
                                      '${cubit.lastFourModel?.data?[index].paidStatus}',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            ],
          ),
        );
      },
    );
  }
}
