import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitob_ol/views/screens/main/elon_screen.dart';
import 'package:kitob_ol/views/screens/main/notification_screeen.dart';
import 'package:kitob_ol/views/screens/main/saved_screen.dart';
import 'package:kitob_ol/views/utils/app_icons.dart';
import 'package:kitob_ol/views/utils/app_images.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff2C3033),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  AppImages.logo2,
                  height: 40,
                )
              ],
            ),
            ListTile(
              title: const Text(
                "E'lon berish",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ElonScreen(),
                    ));
              },
            ),
            ListTile(
              leading: SvgPicture.asset(AppIcons.saved),
              title: const Text(
                'Saqlanganlar',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedScreen(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              title: const Text(
                'Bildirishnomalar',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreeen(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.white),
              title: const Text(
                'Mening profilim',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle the action for this item
              },
            ),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.white),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Til',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
              onTap: () {
                // Handle the action for this item
              },
            ),
          ],
        ),
      ),
    );
  }
}
