import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool isLoading = false;

  // login Validation
  final loginPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool validatelogin(String login) {
    final regExp = RegExp(loginPattern);
    return regExp.hasMatch(login);
  }

  // Sign In Function
  void login() {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      Future.delayed(const Duration(seconds: 2), () {
        isLoading = false;
        setState(() {});
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const JokesPage()),
        );
      });
    }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500,backgroundColor: Colors.white),
                ),
              ),
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please login';
                        }
                        if (!validatelogin(_emailController.text)) {
                          return 'Please login';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'Enter your login',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(
                            Icons.people_outlined,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.white,
                          focusColor: Colors.white),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: showPassword ? false : true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.lock_rounded, color: Colors.grey,size: 24),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Icon(
                            showPassword
                                ? Icons.visibility_off
                                : Icons.remove_red_eye,
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                      ),
                    ),

//////////////////////////////////////////////////
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        resetPassword();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: isLoading
                              ? const Padding(
                            padding: EdgeInsets.all(0),
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                          )
                              : const Text(
                            'Forget password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),

//////////////////////////////////////////////////
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const JokesPage()),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade400,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: isLoading
                              ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                          )
                              : const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetPassword() {}
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
class JokesPage extends StatelessWidget {
  const JokesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Jokes"),
              backgroundColor: Colors.red,
            ),
            body: ListView(
              padding: const EdgeInsets.all(7),
              children: <Widget>[
                Container(
                  height: 50,
                  width: 60,
                  color:  Colors.yellow[200],
                  child: Row(
                    children: [
                      Icon(
                        Icons.directions_bike,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10), // Espacement entre l'icône et le texte
                      const Text('why did the melons plan a big wedding?'),
                      GestureDetector(
                          onTap: (){
                            // Navigator.push(context,
                            //MaterialPageRoute(builder: (context) => const 192()),//
                          },//
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                          )


                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  color:  Colors.yellow[200],
                  child: Row(
                    children: [
                      Icon(
                        Icons.directions_bike,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10), // Espacement entre l'icône et le texte
                      const Text('what do you give a sick lemon?'),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                      )
                    ],
                  ),
                )  ,
                Container(
                  height: 50,
                  color:  Colors.yellow[200],
                  child: Row(
                      children: [
                        Icon(
                          Icons.directions_bike,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10), // Espacement entre l'icône et le texte
                        const Text('What did the pirate say on his 80th birthday ?'),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                        )
                      ]
                  ),
                ),
                Container(
                    height: 50,
                    color: Colors.yellow[200],
                    child: Row(
                        children: [
                          Icon(
                            Icons.directions_bike,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10), // Espacement entre l'icône et le texte
                          const Text('Can a kangaroo jump higher than the empire State Building ?'),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                          )
                        ]
                    )),
                Container(
                    height: 50,
                    color: Colors.yellow[200],
                    child: Row(
                        children: [
                          Icon(
                            Icons.directions_bike,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10), // Espacement entre l'icône et le texte
                          const Text('Did you hear about the kidnapping at school ?'),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                          )
                        ]
                    )),
                Container(
                    height: 50,
                    color: Colors.yellow[200],
                    child: Row(
                        children: [
                          Icon(
                            Icons.directions_bike,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10), // Espacement entre l'icône et le texte
                          const Text('Want to hear a chimney joke  ?'),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                          )
                        ]
                    )),
                Container(
                    height: 50,
                    color: Colors.yellow[200],
                    child: Row(
                        children: [
                          Icon(
                            Icons.directions_bike,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10), // Espacement entre l'icône et le texte
                          const Text('did you know the first french fries weren''t cooked in france ?'),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                          )
                        ]
                    )),
                Container(
                    height: 50,
                    color: Colors.yellow[200],
                    child: Row(
                        children: [
                          Icon(
                            Icons.directions_bike,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10), // Espacement entre l'icône et le texte
                          const Text('what kind of dinosaur loves to sleep ?'),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                          )
                        ]
                    )),
                Container(
                    height: 50,
                    color: Colors.yellow[200],
                    child: Row(
                        children: [
                          Icon(
                            Icons.directions_bike,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10), // Espacement entre l'icône et le texte
                          const Text('why are mummy scared of vaction ?'),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                          )
                        ]
                    )),
                Container(
                    height: 50,
                    color: Colors.yellow[200],
                    child: Row(
                        children: [
                          Icon(
                            Icons.directions_bike,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          // Espacement entre l'icône et le texte
                          const Text('why do programmers always mix up halloween and christmas ?'),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.grey,
                          )]
                    ))
              ],
            ) ));
  }
}

