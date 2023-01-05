import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pos_mobile_version/view/homepage.dart';

import '../model/login_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obsecureText = true;
  String zemail = '';
  String xpassword = '';
  bool value = false;

  @override
  void initState() {
    super.initState();
  }

  void toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }
  late LoginModel loginmodel;
  go_homepage() async {
    var response =
    await http.post(Uri.parse('http://172.20.20.69/mobilepos/loginapi.php'),
        body: jsonEncode(<String, String>{
          "zemail": zemail,"xpassword": xpassword,
        }));
    loginmodel = loginModelFromJson(response.body);
    //print(loginmodel);

    if (zemail == loginmodel.zemail && xpassword == loginmodel.xpassword) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Wrong Username/Password ",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: NetworkImage(
                  "https://images.pexels.com/photos/1565982/pexels-photo-1565982.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width / 1.2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white.withOpacity(.8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('images/logo/applogo.png'),
                          ),

                          Container(
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: size.height / 40,
                                color: Colors.black,
                              ),
                              onChanged: (input) {
                                zemail = input;
                              },
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return "Empty";
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 20), // add padding to adjust text
                                isDense: false,
                                // hintStyle: TextStyle(
                                //   fontSize: 22,
                                // ),
                                labelText: "User Name",
                                labelStyle: TextStyle(
                                  fontSize: size.height / 40,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.account_circle,
                                  size: 35,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            // margin: const EdgeInsets.only(left: 16, right: 32),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: size.height / 40,
                                color: Colors.black,
                              ),
                              obscureText: _obsecureText,
                              onChanged: (input) {
                                xpassword = input;
                              },
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return "Empty";
                                }
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 20), // add padding to adjust text
                                  isDense: false,
                                  // hintStyle: TextStyle(
                                  //   fontSize: 22,
                                  // ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    fontSize: size.height / 40,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obsecureText
                                          ? FontAwesomeIcons.solidEyeSlash
                                          : FontAwesomeIcons.solidEye,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      toggle();
                                    },
                                  )),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Checkbox(
                                value: value,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                              Text(
                                'Remember Me',
                                style: TextStyle(
                                    fontSize: size.height / 40,
                                    color: Colors.black),
                              ),
                            ], //<Widget>[]
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()));
                              // _handleSubmit(context);
                              go_homepage();
                            },
                            child: Container(
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xffE75A29),
                                    Color(0xff73332E),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          GestureDetector(
                            onTap: () {
                              print("Forgot Password?");
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Color(0xffD3092C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
