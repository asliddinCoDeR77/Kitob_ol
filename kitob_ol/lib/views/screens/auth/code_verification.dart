import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:kitob_ol/controllers/auth_cubit.dart'; // Import your AuthCubit
import 'package:kitob_ol/views/screens/auth/login_screen.dart';
import 'package:kitob_ol/views/screens/main/home_screen.dart';
import 'package:kitob_ol/views/utils/app_images.dart';
import 'package:pinput/pinput.dart';

class CodeVerificationScreen extends StatelessWidget {
  final String phone; // This should be passed from the previous screen

  CodeVerificationScreen({required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ZoomIn(
              child: Image.asset(
                AppImages.logo,
                height: 40,
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'login') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'login',
                child: Text("Kirish"),
              ),
            ],
            icon: Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              child: Text(
                'Siz kiritgan telefon raqamiga kod yuborildi. Iltimos kodni kiriting!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 20),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  // Navigate to HomeScreen on successful verification
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
                } else if (state is AuthFailure) {
                  // Show error message if verification failed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return ZoomIn(
                  child: Pinput(
                    length: 6,
                    showCursor: true,
                    onCompleted: (pin) {
                      // Trigger the verification method from AuthCubit
                      context.read<AuthCubit>().verifyCode(phone, pin);
                    },
                    defaultPinTheme: PinTheme(
                      width: 120,
                      height: 90,
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                );
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInLeft(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(156, 56),
                      backgroundColor: Colors.grey[300],
                    ),
                    child: Text(
                      'Orqaga',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                FadeInRight(
                  child: ElevatedButton(
                    onPressed: () {
                      // You can keep this or remove it since verification will happen on pin completion
                    },
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(156, 56),
                      backgroundColor: Color(0xff2C3033),
                    ),
                    child: Text(
                      'Keyingisi',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
