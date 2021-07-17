import 'dart:async';
// import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class CreateAccount2 extends StatefulWidget {
  static const String routeName = '/set-profile-screen';
  final String phone;
  CreateAccount2({this.phone});
  @override
  _CreateAccount2State createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  DateTime _selecteddate;
  TextEditingController otpController = TextEditingController();
  TextEditingController referCode = TextEditingController();

  String username;
  String gender;
  String email;
  Color color = Colors.black;
  String text = "Date of Birth :";

  buildLogo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage("assets/images/reddoo_logo.png"),
        )
      ],
    );
  }

  submit() {
    // print(_selecteddate);
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();

      Timer(Duration(seconds: 2), () {
        if (username != null &&
            _selecteddate != null &&
            gender != null &&
            email != null) {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Text("dfe")));
        }
      });
    }
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selecteddate = pickedDate;
        color = Colors.black;
      });
    });
  }

  @override
  Widget build(BuildContext parentContext) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            body: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70))),
                ),
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  buildLogo(),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListView(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "Setup Your Profile",
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Form(
                                    key: _formKey,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              validator: (val) {
                                                if (val.trim().length < 3 ||
                                                    val.isEmpty) {
                                                  return "UserName too short";
                                                } else if (val.trim().length >
                                                    19) {
                                                  return "UserName too long";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              onSaved: (val) => username = val,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                labelText: "Name",
                                                labelStyle:
                                                    TextStyle(fontSize: 16),
                                                hintText:
                                                    "Must be atleast 4 characters ",
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextFormField(
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              onSaved: (val) => email = val,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                labelText: "Email",
                                                labelStyle:
                                                    TextStyle(fontSize: 16),
                                                hintText:
                                                    "Enter you e-mail Id ",
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 14.0),

                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      _selecteddate == null
                                                          ? text
                                                          : "Date :",
                                                      style: TextStyle(
                                                          color: color),
                                                    ),
                                                  ),
                                                  TextButton(
                                                      onPressed:
                                                          _presentDatePicker,
                                                      child:
                                                          Text("Choose Date"))
                                                ],
                                              ),
                                              // child: TextFormField(
                                              //   keyboardType:
                                              //       TextInputType.datetime,
                                              //   onSaved: (val) {
                                              //     dob = val;
                                              //   },
                                              //   decoration: InputDecoration(
                                              //     border: OutlineInputBorder(
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 8)),
                                              //     labelText: "Date of Birth",
                                              //     labelStyle:
                                              //         TextStyle(fontSize: 16),
                                              //     hintText: "DD/MM/YYYY",
                                              //   ),
                                              // ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 14.0),
                                              child: DropdownButtonFormField<
                                                  String>(
                                                // enabled: true,

                                                items: genderList.map((String
                                                    dropDownStringItem) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: dropDownStringItem,
                                                    child: Text(
                                                        dropDownStringItem),
                                                  );
                                                }).toList(),
                                                hint: Text("Select Gender"),
                                                value: gender,

                                                validator: (value) => value ==
                                                        null
                                                    ? 'Please fill in your gender'
                                                    : null,
                                                onChanged: (value) =>
                                                    gender = value,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: TextFormField(
                                    // autovalidateMode: AutovalidateMode.disabled,
                                    keyboardType: TextInputType.emailAddress,

                                    controller: referCode,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      labelText: "Refferal Code",
                                      labelStyle: TextStyle(fontSize: 16),
                                      hintText: "Enter refferal Code(if any) ",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 32.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_selecteddate == null) {
                                        setState(() {
                                          color = Colors.red;
                                          text = "Please provide D.O.B";
                                        });
                                      }
                                      submit();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).accentColor,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      width: 270,
                                      height: 45,
                                      child: Center(
                                        child: Text(
                                          "Create",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        ),
                      )
                    ],
                  )
                ],
              )
            ]),
          ),
        ));
  }

  verifyOtp(String phone, enterdOtp) async {
    // FirebaseDatabase.instance
    //     .reference()
    //     .child(phone)
    //     .child("Email_OTP")
    //     .remove();
    SnackBar snackBar = SnackBar(
      content: Text(
        "Verified! Welcome $username ",
      ),
    );
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(snackBar);

    Navigator.pushNamed(context, '/home-screen');
  }
}

//   @override
//   void initState() {
//     super.initState();
//     readOtp(widget.phone);
//   }
// }

var genderList = ["Male", "Female"];
