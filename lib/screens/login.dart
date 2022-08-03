import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:spaplex/repository/user_repository.dart';
import 'package:spaplex/utils/url.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import '../utils/controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final CartController controller = Get.put(CartController());
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late Box box1;

  void createBox() async {
    box1 = await Hive.openBox('login');
    getData();
  }

  void getData() async {
    if (box1.get("email") != null) {
      _emailController.text = box1.get('email');
    }

    if (box1.get("password") != null) {
      _passwordController.text = box1.get('password');
      _login();
    }
  }

  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  void initState() {
    _checkNotificationEnabled();
    super.initState();
    createBox();
  }

  _navigateToScreen(bool isLogin) async {
    if (isLogin && token != null) {
      await box1.put('email', _emailController.text);
      await box1.put('password', _passwordController.text);
      AwesomeNotifications().createNotification(
        content: NotificationContent(
            channelKey: 'Basic',
            id: 1,
            title: 'Spaplex',
            body: 'Welcome to Spaplex'),
      );
      Navigator.pushNamed(context, '/home');
    } else {
      MotionToast.error(
              description:
                  const Text("Either Username or Password is incorrect"))
          .show(context);
    }
  }

  _login() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.login(
          _emailController.text, _passwordController.text);
      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(
        description: Text("Error: ${e.toString()}"),
      ).show(context);
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
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: height * 0.10),
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
                      obscureText: true,
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
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                    )),
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
                      _login();
                    }
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  child: const Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
