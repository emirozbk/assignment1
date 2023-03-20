import 'package:authentication_example/pages/reset_password_page.dart';
import 'package:authentication_example/validation/validation_mixin.dart';
import 'package:authentication_example/widgets/bold_title.dart';
import 'package:authentication_example/widgets/custom_button.dart';
import 'package:authentication_example/widgets/top_image.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class ForgotPasswordPage extends StatelessWidget with CustomValidation {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
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
                    lottiePath: "assets/lotties/forgot_password_lottie.json"),
                const SizedBox(height: 10),
                const BoldTitle(text: "Forgot\nPassword?"),
                const SizedBox(height: 10),
                Text(
                  "Don't worry! It happens. Please enter the email address associated with your account.",
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  iconData: Icons.email,
                  validator: validateEmail,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                CustomButton(
                    text: "Submit", onPressed: () => _handleSubmit(context)),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ResetPasswordPage()));
    }
  }
}
