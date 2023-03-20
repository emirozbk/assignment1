mixin CustomValidation {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegEx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegEx.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? confirmValue, String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    if (value != confirmValue) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full Name is required';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }
    final phoneRegEx = RegExp(r'^\+?[0-9]{10,12}$');
    if (!phoneRegEx.hasMatch(value)) {
      return 'Invalid phone number format';
    }
    return null;
  }
}
