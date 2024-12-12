import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/pages/home.dart';
import 'package:flutter_news/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance.collection('/user');

  final emailController = TextEditingController();
  final passController = TextEditingController();

  final emailFN = FocusNode();
  final passFN = FocusNode();

  bool isObscure = false;
  bool isLoading = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login News App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Hello Again!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Welcome back you\u2019ve been missed!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) {
                  setState(() {
                    isError = false;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Enter email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passController,
                obscureText: isObscure,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (_) {
                  setState(() {
                    isError = false;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Icon(isObscure ? Icons.visibility_off : Icons.visibility)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              if (isError)
                const Text(
                  "Username or Password Wrong!",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              const SizedBox(height: 20),
              StreamBuilder(
                  stream: users.snapshots(),
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    return ElevatedButton(
                      onPressed: () async {
                        try {
                          final isRegistered = data?.docs.where((val) {
                            final data = val.data()['email'] == emailController.text;
                            return data;
                          }).isNotEmpty;
                          if (isRegistered ?? false) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const Home()),
                            );
                          } else {
                            setState(() {
                              isError = true;
                            });
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login failed: $e")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text(
                  "Not a member? Register now",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
