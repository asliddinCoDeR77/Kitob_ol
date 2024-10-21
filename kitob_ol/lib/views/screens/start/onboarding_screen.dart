import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:kitob_ol/views/screens/auth/login_screen.dart';
import 'package:kitob_ol/views/utils/app_images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomIn(
              duration: const Duration(seconds: 2),
              child: Image.asset(
                AppImages.logo,
                width: 200,
                height: 500,
              ),
            ),
            const SizedBox(height: 30),
            FadeInDown(
              child: const Text(
                'Xush Kelibsiz',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeInDown(
              delay: const Duration(milliseconds: 500),
              child: Text(
                'Discover and explore amazing books with us.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ),
            const SizedBox(height: 40),
            FadeInUp(
              delay: const Duration(milliseconds: 800),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(342, 40),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
