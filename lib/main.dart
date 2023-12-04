import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/views/add_order_view.dart';
import 'package:pharma_track/views/all_medicine_view.dart';
import 'package:pharma_track/views/home_view.dart';
import 'package:pharma_track/views/login_view.dart';
import 'package:pharma_track/views/medicine_detail_view.dart';
import 'package:pharma_track/views/medicine_view.dart';
import 'package:pharma_track/views/sign_up_view.dart';

void main() {
  runApp(const PharmaTrack());
}

class PharmaTrack extends StatelessWidget {
  const PharmaTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AllApiCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        routes: {
          LoginView.id: (context) => const LoginView(),
          SignUpView.id: (context) => const SignUpView(),
          HomeView.id: (context) => const HomeView(),
          AllMedicineView.id: (context) => const AllMedicineView(),
          MedicineView.id: (context) => const MedicineView(),
          MedicineDetaileView.id: (context) => const MedicineDetaileView(),
          AddOrderView.id: (context) => const AddOrderView(),
        },
        initialRoute: LoginView.id,
      ),
    );
  }
}
