
import 'package:flutter/material.dart';
import 'package:tic_tok_app/view/screens/home_screen.dart';
class Login_Screen extends StatelessWidget {
  Login_Screen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  bool isAlredyUser = false;
  bool isEmailValid(String email) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
    return emailValid;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.blue),
              ),
              SizedBox(height: 40,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                    )),
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (isEmailValid(email ?? ""))
                    return null;
                  else
                    return 'Enter a valid email address';
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter Pasword',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                    )),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {},
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text('Forgot Password',),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    if (isAlredyUser) {
                    } else {
                      isAlredyUser = true;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()),
                        //(Route<dynamic> route) => false
                      );
                    }

                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20)
                ),
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],

          ),

        ),
      ),
    );
  }
}
