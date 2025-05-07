import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
//import 'package:no_doubt/option.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

    _createlogin createState() => _createlogin();
}


    class _createlogin extends State<LoginPage>{

      final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  
   @override
  void dispose() {
   
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

   Future<void> justlogin() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.message ?? 'Login failed')),
    );
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/nodoubt_logo.png', height: 100), // Replace with your logo
            SizedBox(height: 20),
            Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
             buildTextField(Icons.email, 'Email', emailController),
              SizedBox(height: 10),
           
            buildTextField(Icons.lock, 'Password',passwordController, obscureText: true),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
              ),
              onPressed: () async {
                // Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => option()),
                //         );
                  await justlogin();
              },
              child: Text(
                'LOGIN',
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Don’t have an account? ", style: TextStyle(color: Colors.white)),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String hint, TextEditingController controller, {bool obscureText = false}) {
    return TextField(
       controller: controller,
      obscureText: obscureText,
    
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.purpleAccent),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.purpleAccent),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
      ),
    );
  }
}
