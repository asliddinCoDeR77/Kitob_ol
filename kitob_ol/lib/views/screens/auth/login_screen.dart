import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitob_ol/controllers/auth_cubit.dart'; // Adjust the path according to your project structure
import 'package:kitob_ol/views/screens/auth/code_verification.dart';
import 'package:kitob_ol/views/utils/app_images.dart';
import 'package:animate_do/animate_do.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ZoomIn(
          child: Image.asset(AppImages.logo, height: 40),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              if (phoneController.text.isNotEmpty) {
                context.read<AuthCubit>().sendSmsCode(phoneController.text);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter your phone number')),
                );
              }
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone_android),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (phoneController.text.isNotEmpty) {
                  context.read<AuthCubit>().sendSmsCode(phoneController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter your phone number')),
                  );
                }
              },
              child: Text('Send Verification Code'),
            ),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSmsSent) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CodeVerificationScreen(
                              phone: phoneController.text)));
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
