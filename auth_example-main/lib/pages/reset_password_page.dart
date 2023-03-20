import 'package:authentication_example/validation/validation_mixin.dart';
import 'package:authentication_example/widgets/bold_title.dart';
import 'package:authentication_example/widgets/custom_button.dart';
import 'package:authentication_example/widgets/top_image.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_dialog.dart';
import '../widgets/custom_text_field.dart';

class ResetPasswordPage extends StatelessWidget with CustomValidation {
  ResetPasswordPage({Key? key}) : super(key: key);

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
                    lottiePath: "assets/lotties/reset_password_lottie.json"),
                const SizedBox(height: 10),
                const BoldTitle(text: "Reset\nPassword"),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _passwordController,
                  obscureText: true,
                  labelText: 'New Password',
                  hintText: 'Enter your new password',
                  iconData: Icons.lock,
                  validator: validatePassword,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  labelText: 'Confirm New Password',
                  hintText: 'Confirm your new password',
                  iconData: Icons.lock,
                  validator: (confirmValue) => validateConfirmPassword(
                      confirmValue, _passwordController.text),
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
      _showSuccessPopup(context);
    }
  }

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomDialog(text: "Changed Successfully");
      },
    );
  }
}
