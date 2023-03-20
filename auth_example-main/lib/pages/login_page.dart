import 'package:authentication_example/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

import '../validation/validation_mixin.dart';
import '../widgets/bold_title.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/top_image.dart';
import 'forgot_password_page.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget with CustomValidation {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                const TopLottie(lottiePath: "assets/lotties/login_lottie.json"),
                const SizedBox(height: 10),
                const BoldTitle(text: "Login"),
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
                  controller: _passwordController,
                  obscureText: true,
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  iconData: Icons.lock,
                  validator: validatePassword,
                ),
                const SizedBox(height: 10),
                _buildForgotButton(context),
                const SizedBox(height: 10),
                CustomButton(
                    text: "Login", onPressed: () => _handleLogin(context)),
                const SizedBox(height: 10),
                _buildRegisterButton(context),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildRegisterButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't you have an account?",
          style: TextStyle(color: Colors.grey.shade600),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: const Text("Register"),
        ),
      ],
    );
  }

  Align _buildForgotButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
        },
        child: const Text(
          "Forgot Password?",
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _showSuccessPopup(context);
    }
  }

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomDialog(text: "Login Successful");
      },
    );
  }
}
