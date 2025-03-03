import 'package:firebase_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  String verifyId;

  OTPScreen({super.key, required this.verifyId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter OTP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the OTP sent to your phone.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6, // Limit input to 6 digits
              decoration: const InputDecoration(
                labelText: 'Enter OTP',
                hintText: 'Enter 6-digit OTP',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try{
                  PhoneAuthCredential credential = await PhoneAuthProvider.credential(
                    verificationId: widget.verifyId,
                    smsCode: _otpController.text,
                  );
                  FirebaseAuth.instance.signInWithCredential(credential).then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Hoome Page')));
                  });
                }catch(e){
print(e.toString());
                }
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
