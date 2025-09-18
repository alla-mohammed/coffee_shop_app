import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/products.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool hiddenpass = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        iconTheme: IconThemeData(color: Colors.brown),
        title:  Text(
          "signUp".tr(),
          style: TextStyle(
            fontFamily: "Suwannaphum",
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
       actions: [
  TextButton(
      style: ButtonStyle(
    overlayColor: MaterialStateProperty.all(Colors.transparent),
  ),
    onPressed: () {
      if (context.locale.languageCode == 'en') {
        context.setLocale(const Locale('ar', 'EG'));
      } else {
        context.setLocale(const Locale('en', 'US'));
      }
    },
    child: Text(
      context.locale.languageCode == 'en' ? "AR" : "EN",
      style: const TextStyle(color: Colors.brown),
    ),
  )
],

      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "joinCoffeeClub".tr(),
                  style: TextStyle(
                    fontFamily: "Suwannaphum",
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 40),

                // Full Name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF8D6E63),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "requiredField".tr();
                      }
                      if (value[0] != value[0].toUpperCase()) {
                        return "uppercaseName".tr();
                      }
                      return null;
                    },
                    decoration:
                        _inputDecoration("fullName".tr(), ""),
                  ),
                ),

                // Email
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF8D6E63),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "requiredField".tr();
                      }
                      if (!value.contains("@")) {
                        return "emailMustInclude".tr();
                      }
                      return null;
                    },
                    decoration:
                        _inputDecoration("email".tr(), ""),
                  ),
                ),

                // Password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF8D6E63),
                    controller: passController,
                    obscureText: hiddenpass,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return "shortPassword".tr();
                      }
                      return null;
                    },
                    decoration:
                        _inputDecoration("password".tr(), "")
                            .copyWith(
                      suffixIcon: IconButton(
                        onPressed: () {
                          togglepass();
                        },
                        icon: Icon(
                            color: Colors.brown,
                            hiddenpass
                                ? Icons.visibility
                                : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),

                // Confirm Password
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF8D6E63),
                    controller: confirmPassController,
                    obscureText: true,
                    validator: (value) {
                      if (value != passController.text) {
                        return "passwordsNotMatch".tr();
                      }
                      return null;
                    },
                    decoration: _inputDecoration(
                        "confirmPassword".tr(), ""),
                  ),
                ),

                const SizedBox(height: 30),

                // Create Account Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF8D6E63),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title:  Text("Success".tr()),
                              content: Text("accountCreated".tr()),
                              actions: [
                                TextButton(
                                    style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const Products(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                        transitionDuration:
                                            const Duration(milliseconds: 800),
                                      ),
                                    );
                                  },
                                  child:  Text(
                                    "close".tr(),
                                    style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      "createAccount".tr(),
                      style: TextStyle(
                        fontFamily: "Suwannaphum",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  togglepass() {
    hiddenpass = !hiddenpass;
    setState(() {});
  }

  InputDecoration _inputDecoration(String label, String hint) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(
        color: Colors.brown,
        fontFamily: "Suwannaphum",
      ),
      floatingLabelStyle: const TextStyle(
        color: Color(0xFF8D6E63),
        fontFamily: "Suwannaphum",
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black26),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black26),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Color(0xFF8D6E63), width: 2),
      ),
    );
  }
}
