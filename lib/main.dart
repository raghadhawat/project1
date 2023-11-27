import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_category_cubit/all_category_cubit.dart';
import 'package:pharma_track/cubits/login_cubit/login_cubit.dart';
import 'package:pharma_track/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:pharma_track/views/medicine_view.dart';
import 'package:pharma_track/views/home_view.dart';
import 'package:pharma_track/views/login_view.dart';
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
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => AllCategoryCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginView.id: (context) => LoginView(),
          SignUpView.id: (context) => SignUpView(),
          HomeView.id: (context) => HomeView(),
          MedicineView.id: (context) => MedicineView(),
        },
        initialRoute: LoginView.id,
      ),
    );
  }
}
