import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/theme_color.dart';
import 'package:pharma_track/views/sign_up_view.dart';
import 'package:pharma_track/widgets/custom_button.dart';
import 'package:pharma_track/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool showPass = true;
  String? phone;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: ThemeColor(),
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(kLogo),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Welcome To",
                style: TextStyle(
                  fontFamily: kFont1,
                  fontSize: 35,
                  color: kPrimaryColor,
                ),
              ),
              const Text(
                "PharmaTrack",
                style: TextStyle(
                  fontFamily: kFont1,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                hint: 'phone',
                label: 'Phone',
                inputType: TextInputType.phone,
                icon: Icons.phone,
                onChanged: (value) {
                  phone = value;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                hint: 'password',
                label: 'Password',
                onChanged: (value) {
                  password = value;
                },
                onTap: () {
                  showPass = !showPass;
                  setState(() {});
                },
                obsecureText: showPass,
                icon: showPass ? Icons.visibility_off : Icons.visibility,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context)
                        .login(phone: phone!, password: password!);
                  } else {}
                },
                text: 'Login',
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Create a new account ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpView.id);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
