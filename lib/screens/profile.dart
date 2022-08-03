import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../repository/user_repository.dart';
import '../response/user_response.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'User Profile',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<UserResponse?>(
          future: UserRepository().userInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              debugPrint(snapshot.data.toString());
              if (snapshot.data != null) {
                UserResponse userResponse = snapshot.data!;
                return Column(
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Stack(
                          children: [
                            const Positioned(
                              left: 10,
                              top: 20,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                    'https://thumbs.dreamstime.com/b/female-user-profile-avatar-woman-character-screen-saver-happy-emotions-female-user-profile-avatar-199601144.jpg'),
                              ),
                            ),
                            const Positioned(
                              left: 160,
                              top: 30,
                              child: Text(
                                'Username',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Positioned(
                              left: 160,
                              top: 80,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                              left: 160,
                              top: 50,
                              child: Text(
                                userResponse.username!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                              left: 160,
                              top: 100,
                              child: Text(
                                userResponse.email!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 35,
                              ),
                              Text(
                                'Favourites',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.local_offer,
                                color: Colors.green,
                                size: 35,
                              ),
                              Text(
                                'Offers',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.card_giftcard_rounded,
                                color: Colors.yellow,
                                size: 35,
                              ),
                              Text(
                                'Coupons',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () async {
                          await Hive.box('login').clear();
                          Navigator.of(context).popAndPushNamed('/login');
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .popAndPushNamed('/login');
                                  },
                                  icon: const Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                const Text(
                                  'Log Out',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text("No data"),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
