import 'package:flutter/material.dart';
import 'package:spaplex/model/user.dart';
import 'package:spaplex/repository/user_repository.dart';
import 'package:spaplex/utils/show_message.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _registerUser(User user) async {
    bool isSignup = await UserRepository().registerUser(user);
    if (isSignup) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isSignup) {
    if (isSignup) {
      displaySuccessMessage(context, "Register Success");
      _emailController.clear();
      _passwordController.clear();
      _usernameController.clear();
    } else {
      displayErrorMessage(context, 'Register Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.1),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: height * 0.08),
              Row(
                children: [
                  SizedBox(width: width * 0.08),
                  Container(
                    height: height * 0.065,
                    width: width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffFEF2EE),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xffF96D69),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.7,
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: const Color(0xffFEF2EE),
                        focusColor: Colors.pink,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffF96D69), width: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffF96D69), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  SizedBox(width: width * 0.08),
                  Container(
                    height: height * 0.065,
                    width: width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffFEF2EE),
                    ),
                    child: const Icon(
                      Icons.email,
                      color: Color(0xffF96D69),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.7,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: const Color(0xffFEF2EE),
                        focusColor: Colors.pink,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffF96D69), width: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffF96D69), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  SizedBox(width: width * 0.08),
                  Container(
                    height: height * 0.065,
                    width: width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffFEF2EE),
                    ),
                    child: const Icon(
                      Icons.lock,
                      color: Color(0xffF96D69),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  SizedBox(
                    width: width * 0.7,
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: const Color(0xffFEF2EE),
                        focusColor: Colors.pink,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffF96D69), width: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffF96D69), width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.1),
              SizedBox(
                height: height * 0.07,
                width: width * 0.85,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: const Color(0xffF96D69),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      User user = User(
                        email: _emailController.text,
                        username: _usernameController.text,
                        password: _passwordController.text,
                      );
                      _registerUser(user);
                    } else {
                      return;
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: const Text(
                    'Already have an account? Log In',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
