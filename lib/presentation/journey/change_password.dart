import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _oldPassword = '';
  String _newPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.sp),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Old Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter your old password';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _oldPassword = value;
                  });
                },
              ),
              SizedBox(height: 20.sp),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter a new password';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _newPassword = value;
                  });
                },
              ),
              SizedBox(height: 20.sp),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Reauthenticate user before changing password
                    User? user = _auth.currentUser;
                    AuthCredential credential = EmailAuthProvider.credential(
                      email: user?.email ?? '',
                      password: _oldPassword,
                    );

                    try {
                      await user?.reauthenticateWithCredential(credential);
                      await user?.updatePassword(_newPassword);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Password updated successfully')),
                        );
                      }
                    } catch (error) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Failed to update password')),
                        );
                      }
                    }
                  }
                },
                child: const Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
