import 'package:auth_app_admin/controller/auth.dart';
import 'package:auth_app_admin/view/home_screen/home_screen.dart';
import 'package:auth_app_admin/view/widgets/signup_textformfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _email.text, password: _password.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  String errorMessage = '';
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 248, 88),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pushNamed(context, 'welcome'),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 224, 248, 88),
              Color.fromARGB(255, 139, 240, 137)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 80,
                    ),
                    Column(
                      children: [
                        Animate(
                          effects: [
                            FadeEffect(duration: 800.ms),
                            const SlideEffect(curve: Curves.easeIn)
                          ],
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'Times',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Animate(
                          effects: [
                            FadeEffect(duration: 800.ms),
                            const SlideEffect(curve: Curves.easeIn)
                          ],
                          child: const Text(
                            "Create Your New Account",
                            style: TextStyle(
                              fontFamily: 'Courier',
                              color: Color.fromARGB(255, 50, 49, 49),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Animate(
                          effects: [
                            FadeEffect(duration: 800.ms),
                            const SlideEffect(curve: Curves.easeIn)
                          ],
                          child: SignUpTextFormFieldWidget(
                            controller: _email,
                            label: "Email",
                            prefixIcon: Icons.email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                            isSuffixRequired: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Animate(
                            effects: [
                              FadeEffect(duration: 800.ms),
                              const SlideEffect(curve: Curves.easeIn)
                            ],
                            child: SignUpTextFormFieldWidget(
                              controller: _password,
                              label: 'PassWord',
                              prefixIcon: Icons.lock,
                              isSuffixRequired: true,
                              suffixIconOnPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Animate(
                            effects: [
                              FadeEffect(duration: 800.ms),
                              const SlideEffect(curve: Curves.easeIn)
                            ],
                            child: SignUpTextFormFieldWidget(
                              controller: _confirmpass,
                              label: 'Confirm PassWord',
                              prefixIcon: Icons.lock,
                              isSuffixRequired: true,
                              suffixIconOnPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _password.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          height: 60,
                          child: Animate(
                            effects: [
                              FadeEffect(duration: 800.ms),
                              const SlideEffect(curve: Curves.easeIn),
                              const FlipEffect(curve: Curves.easeIn)
                            ],
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  createUserWithEmailAndPassword();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  backgroundColor: Colors.transparent,
                                  side: const BorderSide(color: Colors.black),
                                  shadowColor:
                                      const Color.fromARGB(255, 117, 199, 134)
                                          .withOpacity(0.20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Animate(
                                effects: [
                                  FadeEffect(duration: 800.ms),
                                  const SlideEffect(curve: Curves.easeIn)
                                ],
                                child: Container(
                                  height: 1, // Adjust line height as needed
                                  color: const Color.fromARGB(
                                      255, 0, 0, 0), // Set line color
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Animate(
                                effects: [
                                  FadeEffect(duration: 800.ms),
                                  const SlideEffect(curve: Curves.easeIn)
                                ],
                                child: const Text(
                                  'No need of An Account',
                                  style: TextStyle(
                                    fontFamily: 'Courier',
                                    color: Color.fromARGB(255, 50, 49, 49),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Animate(
                                effects: [
                                  FadeEffect(duration: 800.ms),
                                  const SlideEffect(curve: Curves.easeIn)
                                ],
                                child: Container(
                                  height: 1, // Adjust line height as needed
                                  color: const Color.fromARGB(
                                      255, 3, 3, 3), // Set line color
                                ),
                              ),
                            ),
                          ],
                        ),
                        Animate(
                          effects: [
                            FadeEffect(duration: 800.ms),
                            const SlideEffect(curve: Curves.easeIn)
                          ],
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
                            },
                            child: const Text(
                              'Go to Home',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
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
