import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/cubits/auth_cubit/auth_cubit.dart';
import 'package:pharma_track/theme_color.dart';
import 'package:pharma_track/views/login_view.dart';
import 'package:pharma_track/widgets/custom_button.dart';
import 'package:pharma_track/widgets/custom_text_form_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool showPass = true;
  bool showCPass = true;
  String? pharmacyName;
  String? address;
  String? pharmacistName;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                height: 32,
              ),
              Image.asset(
                kLogo2,
                height: 150,
              ),
              const Text(
                "Welcome To",
                style: TextStyle(
                  fontFamily: kFont1,
                  fontSize: 30,
                  color: kPrimaryColor,
                ),
              ),
              const Text(
                kName,
                style: TextStyle(
                  fontFamily: kFont2,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: CustomTextFormField(
                      hint: "pharmacy name",
                      label: 'Pharmacy Name',
                      icon: Icons.medication,
                      onChanged: (value) {
                        pharmacyName = value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: CustomTextFormField(
                      hint: 'address',
                      label: 'Address',
                      icon: Icons.place,
                      onChanged: (value) {
                        address = value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 180,
                    child: CustomTextFormField(
                      hint: "pharmacist name",
                      label: 'Pharmacist Name',
                      icon: Icons.local_pharmacy,
                      onChanged: (value) {
                        pharmacistName = value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: CustomTextFormField(
                      hint: 'phone',
                      label: 'Phone',
                      inputType: TextInputType.phone,
                      icon: Icons.phone,
                      onChanged: (value) {
                        phone = value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                hint: 'email',
                label: 'Email',
                icon: Icons.email,
                onChanged: (value) {
                  email = value;
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
                height: 8,
              ),
              CustomTextFormField(
                hint: 'confirm password',
                label: 'Confirm Password',
                onChanged: (value) {
                  confirmPassword = value;
                },
                onTap: () {
                  showCPass = !showCPass;
                  setState(() {});
                },
                obsecureText: showCPass,
                icon: showCPass ? Icons.visibility_off : Icons.visibility,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                text: 'Sign Up',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    BlocProvider.of<AuthCubit>(context).signUp(
                      pharmacyName: pharmacyName!,
                      address: address!,
                      pharmacistName: pharmacistName!,
                      phone: phone!,
                      email: email!,
                      password: password!,
                      confirmPassword: confirmPassword!,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Do you have an account ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginView.id);
                    },
                    child: const Text(
                      'Login',
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
