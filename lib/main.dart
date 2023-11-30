import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/cubits/log_out_cubit/logout_cubit.dart';
import 'package:pharma_track/views/all_medicine_view.dart';
import 'package:pharma_track/views/home_view.dart';
import 'package:pharma_track/views/login_view.dart';
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
        BlocProvider(create: (context) => LogoutCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginView.id: (context) => LoginView(),
          SignUpView.id: (context) => SignUpView(),
          HomeView.id: (context) => HomeView(),
          AllMedicineView.id: (context) => AllMedicineView(),
          MedicineView.id: (context) => MedicineView(),
        },
        initialRoute: LoginView.id,
      ),
    );
  }
}
