import 'package:flutter/material.dart';
import 'package:promilo_task/viewmodel/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to MyApp',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Hi, welcome!',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Please sign in to continue',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: context.read<LoginProvider>().usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Enter email or mobile no',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
              onChanged: (value) {
                context.read<LoginProvider>().notifyListeners();
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // TODO: Add logic for "Sign in with OTP"
                    print('Sign in with OTP');
                  },
                  child: const Text('Sign in with OTP'),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Add logic for "Forgot Password"
                    print('Forgot Password');
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: context.read<LoginProvider>().passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12.0),
              ),
              onChanged: (value) {
                context.read<LoginProvider>().notifyListeners();
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // TODO: Add login logic here
                    print('Login Button Pressed');
                  },
                  child: const Text('Login'),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: context.watch<LoginProvider>().rememberMe,
                      onChanged: (value) {
                        context.read<LoginProvider>().toggleRememberMe();
                      },
                    ),
                    const Text('Remember me'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(
              height: 32.0,
              thickness: 2.0,
              color: Colors.black,
              indent: 16.0,
              endIndent: 16.0,
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 48.0,
                  color: Colors.blue, // Placeholder for Google login
                ),
                SizedBox(width: 24.0),
                Icon(
                  Icons.account_circle,
                  size: 48.0,
                  color: Colors.blue, // Placeholder for Facebook login
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Or sign in with'),
                SizedBox(width: 8.0),
                Text('another account'),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'By continuing, you agree to the terms',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}