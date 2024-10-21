// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:kitob_ol/controllers/auth_cubit.dart';
// import 'package:kitob_ol/views/screens/auth/code_verification.dart';
// import 'package:kitob_ol/views/utils/app_images.dart';

// class PhoneNumberScreen extends StatelessWidget {
//   final TextEditingController phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             ZoomIn(child: Image.asset(AppImages.logo, height: 40)),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ],
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             FadeInDown(
//               child: Text(
//                 'Enter your phone number to register:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(height: 10),
//             FadeInDown(
//               delay: Duration(milliseconds: 200),
//               child: TextField(
//                 controller: phoneController,
//                 decoration: InputDecoration(
//                   prefixText: '+998 ',
//                   hintText: 'Phone Number',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 keyboardType: TextInputType.phone,
//               ),
//             ),
//             SizedBox(height: 20),
//             FadeInUp(
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (phoneController.text.isNotEmpty) {
//                     context.read<AuthCubit>().sendSmsCodeRegister(phoneController.text);
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Please enter a valid phone number'))
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xff2C3033),
//                   minimumSize: Size(double.infinity, 56), // make button width 100%
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                 ),
//                 child: Text(
//                   'Register and Send Code',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             BlocListener<AuthCubit, AuthState>(
//               listener: (context, state) {
//                 if (state is AuthSmsSent) {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) => CodeVerificationScreen(phone: phoneController.text)
//                   ));
//                 } else if (state is AuthFailure) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
//                 }
//               },
//               child: Container(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
