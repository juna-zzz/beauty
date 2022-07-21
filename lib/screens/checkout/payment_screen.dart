import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'success.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var value;
  var _site;
  List lables = ['Esewa', 'Khalti', 'Cash On Delivery'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('Payment Method'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        const SizedBox(height: 50),
        ListTile(
          title: const Text('Esewa'),
          leading: Radio(
            value: 'esewa',
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        ListTile(
          title: const Text('Khalti'),
          leading: Radio(
            value: 'khalti',
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        ListTile(
          title: const Text('COD'),
          leading: Radio(
            value: 'cod',
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        const SizedBox(height: 100),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.pink),
              onPressed: () {
                if (_site != null) {
                  Get.to(() => const Success());
                }
              },
              child: const Text('Pay')),
        )
      ]),
    );
  }
}
