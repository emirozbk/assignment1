import 'package:authentication_example/validation/validation_mixin.dart';
import 'package:authentication_example/widgets/bold_title.dart';
import 'package:authentication_example/widgets/custom_button.dart';
import 'package:authentication_example/widgets/top_image.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_dialog.dart';
import '../widgets/custom_text_field.dart';

class SignUpPage extends StatelessWidget with CustomValidation {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const TopLottie(
                    lottiePath: "assets/lotties/sign_up_lottie.json"),
                const SizedBox(height: 10),
                const BoldTitle(text: "Sign Up"),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  iconData: Icons.email,
                  validator: validateEmail,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _fullNameController,
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  iconData: Icons.person,
                  validator: validateFullName,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _phoneNumberController,
                  labelText: 'Phone',
                  hintText: 'Enter your phone number',
                  iconData: Icons.phone,
                  validator: validatePhoneNumber,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _passwordController,
                  obscureText: true,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  iconData: Icons.lock,
                  validator: validatePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  iconData: Icons.lock,
                  validator: (confirmValue) => validateConfirmPassword(
                      confirmValue, _passwordController.text),
                ),
                const SizedBox(height: 20),
                CustomButton(
                    text: "Sign Up", onPressed: () => _handleSignUp(context)),
                const SizedBox(height: 10),
                _buildLoginButton(context),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildLoginButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(color: Colors.grey.shade600),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Login"),
        ),
      ],
    );
  }

  void _handleSignUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _showSuccessPopup(context);
    }
  }

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomDialog(text: "Registration Successful");
      },
    );
  }
}
