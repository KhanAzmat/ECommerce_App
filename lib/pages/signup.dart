import 'package:ECommerce_flutter/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../dBase/users.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  UserServices userServices = UserServices();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController cnfrmPasswordTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  String gender;
  String groupValue = 'male';
  bool loading = false;
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text(
          "Login",
          style: TextStyle(color: Colors.red.shade900),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/background_login_page.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          /* Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background_login_page.jpg'),
                      fit: BoxFit.cover))),
          */
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
                alignment: Alignment.center,
                child: Center(
                    child: Form(
                  key: formKey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: nameTextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Name",
                                icon: Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Name field cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text('Male'),
                                  leading: Radio(
                                    value: 'male',
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text('Female'),
                                  leading: Radio(
                                    value: 'female',
                                    groupValue: groupValue,
                                    onChanged: (e) => valueChanged(e),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: emailTextController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                icon: Icon(Icons.email),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: passwordTextController,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  icon: Icon(Icons.lock),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Password field cannot be empty';
                                  } else if (value.length < 6) {
                                    return 'Password has to be at least 6 characters long ';
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    hidePass = false;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: cnfrmPasswordTextController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                icon: Icon(Icons.lock),
                              ),
                              validator: (value) {
                                if (passwordTextController.text != value) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red,
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: MaterialButton(
                                onPressed: () async {
                                  validateForm();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text('Register',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0))),
                          ),
                        ),
                      )
                    ],
                  ),
                ))),
          ),
          /*   Visibility(
                                                                          visible: loading ?? true,
                                                                          child: Center(
                                                                            child: Container(
                                                                              alignment: Alignment.center,
                                                                              color: Colors.white.withOpacity(0.9),
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                                                              ),
                                                                            ),
                                                                          ))*/
        ],
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == 'male') {
        groupValue = e;
        gender = e;
      } else if (e == 'female') {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future validateForm() async {
    FormState formState = formKey.currentState;
    if (formState.validate()) {
      FirebaseUser firebaseuser = await firebaseAuth.currentUser;
      if (firebaseuser == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextController.text,
                password: passwordTextController.text)
            .then((user) => {
                  userServices.createUser(firebaseuser.uid, {
                    'username': nameTextController.text,
                    'email': emailTextController.text,
                    'userId': firebaseuser.uid,
                    'gender': gender,
                  })
                })
            .catchError((err) => {print(err.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    }
  }
}
