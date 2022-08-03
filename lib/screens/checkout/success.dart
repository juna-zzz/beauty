import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaplex/screens/bottomnav.dart';

import '../../utils/controller.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.pinkAccent,
            radius: 160,
            child: Icon(
              Icons.check,
              size: 300,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Successfully Placed the Order",
            style: TextStyle(
                fontSize: 28,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pinkAccent),
                child: const Text(
                  'Proceed to Home Screen',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  AwesomeNotifications().createNotification(
                    content: NotificationContent(
                        channelKey: 'Basic',
                        id: 1,
                        title: 'Spaplex',
                        body: "Thanks For Shopping"),
                  );
                  controller.clearProduct();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Mainscreen(),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
