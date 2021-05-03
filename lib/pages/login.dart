import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = '';
  bool button = false, _icon = true;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        button = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.home);
      setState(() {
        button = false;
        _formkey.currentState!.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).cardColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image(
                  image: AssetImage('assets/images/undraw_hey_email_liaa.png')),
              SizedBox(height: 20.0),
              Text(
                'Welcome $name',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 32.0),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (name) {
                            setState(() {
                              this.name = name;
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Username',
                            hintText: 'Enter user name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User can not be Empty';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: _icon,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                                icon: Icon(_icon
                                    ? Icons.remove_red_eye
                                    : Icons.security_rounded),
                                onPressed: () {
                                  setState(() {
                                    _icon = !_icon;
                                  });
                                }),
                            labelText: 'Passward',
                            hintText: 'Enter user Passward',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password can not be Empty';
                            } else if (value.length < 6) {
                              return 'password length must be greater than 6';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        Material(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            splashColor: Colors.cyan,
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              alignment: Alignment.center,
                              height: 50.0,
                              width: button ? 50 : 150.0,
                              child: button
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
