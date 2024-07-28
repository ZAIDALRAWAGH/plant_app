import 'package:flutter/material.dart';
import 'package:projrct01/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _HomePageState();
}

class _HomePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: Constants.primaryColor, width: 5)),
                child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage: ExactAssetImage('images/profile.jpg')),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      child: Image.asset('images/verified.png'),
                    ),
                  ],
                ),
              ),
              Text(
                'join@gmail.com',
                style: TextStyle(color: Constants.blackColor.withOpacity(.3)),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profileWidget(
                      icon: Icons.person,
                      titleIcon: 'MyProfile',
                    ),
                    profileWidget(
                      icon: Icons.settings,
                      titleIcon: 'Settings',
                    ),
                    profileWidget(
                      icon: Icons.notifications,
                      titleIcon: 'Notifications',
                    ),
                    profileWidget(
                      icon: Icons.chat,
                      titleIcon: 'FAQs',
                    ),
                    profileWidget(
                      icon: Icons.share,
                      titleIcon: 'share',
                    ),
                    profileWidget(
                      icon: Icons.logout,
                      titleIcon: 'LogOut',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class profileWidget extends StatelessWidget {
  final IconData icon;
  final String titleIcon;
  const profileWidget({
    super.key,
    required this.icon,
    required this.titleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: Colors.white,
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Constants.blackColor.withOpacity(.5),
                  size: 24,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  titleIcon,
                  style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Constants.blackColor.withOpacity(.4),
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
