import 'package:firebase_app/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Phone Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: '+1 234 567 890',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
               try{
                 await FirebaseAuth.instance.verifyPhoneNumber(
                   verificationCompleted: (PhoneAuthCredential credential) {},
                   verificationFailed: (FirebaseAuthException e) {
                     print(e.message);
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                         content: Text('Verification Failed: ${e.message}'),
                       ),
                     );
                   },
                   codeSent: (String verificationId, int? resentToken) {
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => OTPScreen(
                           verifyId: verificationId,
                         ),
                       ),
                     );
                   },
                   codeAutoRetrievalTimeout: (String timeout) {},
                   phoneNumber: "+91${_phoneController.text}",
                 );
               }catch(e){
                 print(e.toString());
               }
              },
              child: const Text('Verify phone number'),
            ),
          ],
        ),
      ),
    );
  }
}
