import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/cubits/order_cubit/order_cubit.dart';
import 'package:pharma_track/helper/show_snack_bar.dart';
import 'package:pharma_track/views/add_order_view.dart';
import 'package:pharma_track/views/all_medicine_view.dart';
import 'package:pharma_track/views/favourite_view.dart';
import 'package:pharma_track/views/login_view.dart';
import 'package:pharma_track/views/medicine_view.dart';
import 'package:pharma_track/views/order_view.dart';
import 'package:pharma_track/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AllApiCubit>(context).lastFour(context);
    bool isLoading = false;
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is ShowFavouriteLoading) {
          isLoading = true;
        } else if (state is ShowFavouriteSuccess) {
          Navigator.pushNamed(context, FavouriteView.id);
          isLoading = false;
        } else if (state is ShowFavouriteFailure) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return BlocConsumer<AllApiCubit, AllApiState>(
          listener: (context, state) {
            if (state is OrderLoading) {
              isLoading = true;
            } else if (state is OrderSuccess) {
              Navigator.pushNamed(context, OrderView.id);
              isLoading = false;
            } else if (state is OrderFailure) {
              showSnakbar(context, state.errMessage);
              isLoading = false;
            }
          },
          builder: (context, state) {
            return BlocConsumer<AllApiCubit, AllApiState>(
              listener: (context, state) {
                if (state is AddFavouriteLoading) {
                  isLoading = true;
                } else if (state is AddFavouriteSuccess) {
                  Navigator.pushNamed(context, FavouriteView.id);
                  isLoading = false;
                } else if (state is AddFavouriteFailure) {
                  showSnakbar(context, state.errMessage);
                  isLoading = false;
                }
              },
              builder: (context, state) {
                return BlocConsumer<AllApiCubit, AllApiState>(
                  listener: (context, state) {
                    if (state is OrderStateLoading) {
                      isLoading = true;
                    } else if (state is OrderStateSuccess) {
                      isLoading = false;
                    } else if (state is OrderStateFailure) {
                      showSnakbar(context, state.errMessage);
                      isLoading = false;
                    }
                  },
                  builder: (context, state) {
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
                        builder: (context, state) =>
                            BlocConsumer<AllApiCubit, AllApiState>(
                                listener: (context, state) {
                              if (state is AllApiLoading) {
                                isLoading = true;
                              } else if (state is AllApiSuccess) {
                                Navigator.pushNamed(
                                    context, AllMedicineView.id);
                                isLoading = false;
                              } else if (state is AllApiFailur) {
                                showSnakbar(context, state.errMessage);
                                isLoading = false;
                              }
                            }, builder: (context, state) {
                              return BlocConsumer<AllApiCubit, AllApiState>(
                                  listener: (context, state) {
                                if (state is MedicineLoading) {
                                  isLoading = true;
                                } else if (state is MedicineSuccess) {
                                  Navigator.pushNamed(context, MedicineView.id);
                                  isLoading = false;
                                } else if (state is MedicineFailure) {
                                  showSnakbar(context, state.errMessage);
                                  isLoading = false;
                                }
                              }, builder: (context, state) {
                                return BlurryModalProgressHUD(
                                  inAsyncCall: isLoading,
                                  child: Scaffold(
                                    floatingActionButton: FloatingActionButton(
                                      backgroundColor: Color(0xff31a9e3),
                                      onPressed: () {
                                        BlocProvider.of<OrderCubit>(context)
                                            .fetchAllOrder();
                                        Navigator.pushNamed(
                                            context, AddOrderView.id);
                                      },
                                      child: Icon(Icons.shopping_cart_outlined),
                                    ),
                                    appBar: AppBar(
                                      backgroundColor: Colors.white,
                                      actions: [
                                        const Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.notifications_none_rounded,
                                            color: Colors.grey,
                                            size: 35,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              BlocProvider.of<AuthCubit>(
                                                      context)
                                                  .logOut(context);
                                              Hive.box(kToken).delete(kToken1);
                                              print(
                                                  "${Hive.box(kToken).get(kToken1)}lllllllllll");
                                              print(
                                                  "${AuthCubit.get(context).logOutModel?.messege?.message}kk");
                                            },
                                            icon: const Icon(
                                              Icons.logout,
                                              color: Colors.grey,
                                            )),
                                      ],
                                      elevation: 0.0,
                                    ),
                                    body: const HomeViewBody(),
                                  ),
                                );
                              });
                            }));
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
