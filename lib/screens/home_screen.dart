import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Text(
                      'Kalopul, Kathmandu',
                      style: TextStyle(fontSize: 28),
                    ),
                    Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                height: 100,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome to SpaPlex',
                      style: TextStyle(fontSize: 34, color: Color(0xffF96C6C)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cosmetics of YOUR Choice',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color(0xffF96C6C),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.white,
                    ),
                    Text(
                      'Search Items',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink)),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1556227834-09f1de7a7d14?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGZhY2UlMjBiZWF1dHklMjBwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text('Face'),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink)),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1571646034647-52e6ea84b28c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGlwc3RpY2t8ZW58MHx8MHx8&auto=format&fit=crop&w=800',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text('Lips'),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink)),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1625153809071-9d8b790ff18c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aGFpciUyMHNoYW1wb298ZW58MHx8MHx8&auto=format&fit=crop&w=800',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text('Hair'),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.pink)),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1596462502278-27bfdc403348?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZXllcyUyMG1hc2NhcmF8ZW58MHx8MHx8&auto=format&fit=crop&w=800',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text('Eyes'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.pink)),
                      height: 200,
                      width: 180,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1596462502278-27bfdc403348?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZXllcyUyMG1hc2NhcmF8ZW58MHx8MHx8&auto=format&fit=crop&w=800',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.pink)),
                      height: 200,
                      width: 180,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1596462502278-27bfdc403348?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZXllcyUyMG1hc2NhcmF8ZW58MHx8MHx8&auto=format&fit=crop&w=800',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.pink)),
                      height: 200,
                      width: 180,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1596462502278-27bfdc403348?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZXllcyUyMG1hc2NhcmF8ZW58MHx8MHx8&auto=format&fit=crop&w=800',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.pink)),
                      height: 200,
                      width: 180,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1596462502278-27bfdc403348?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZXllcyUyMG1hc2NhcmF8ZW58MHx8MHx8&auto=format&fit=crop&w=800',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
