// ignore: unused_import
// ignore_for_file: unused_import, duplicate_ignore, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/Auth.dart';
import 'package:flutter_application_1/api/api_doimatkhau.dart';
import 'package:flutter_application_1/api/api_quenmatkhau.dart';
import 'package:flutter_application_1/main.dart';
import 'login.dart';

class SetPass extends StatefulWidget {
  const SetPass({Key? key}) : super(key: key);

  @override
  _SetPassState createState() => _SetPassState();
}

class _SetPassState extends State<SetPass> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtSDT = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtOldPass = TextEditingController();
  TextEditingController txtNewPass = TextEditingController();
  TextEditingController txtNewPassConfirm = TextEditingController();

  bool isPassWord1 = true;
  bool isPassWord2 = true;
  bool isPassWord3 = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/qmk2.jpg'), fit: BoxFit.cover),
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.reply,
                    size: 40,
                  ),
                  tileColor: Colors.black,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child:
                      Image.asset('images/logo.png', height: 100, width: 350),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Qu??n m???t kh???u",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ]),
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => val!.isEmpty
                                  ? 'Email kh??ng ???????c b??? tr???ng'
                                  : null,
                              controller: txtEmail,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Color(0xff99cccc),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ]),
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              validator: (val) => val!.isEmpty
                                  ? 'S??? ??i???n tho???i kh??ng ???????c b??? tr???ng'
                                  : null,
                              controller: txtSDT,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Color(0xff99cccc),
                                ),
                                hintText: "S??? ??i???n tho???i",
                                hintStyle: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ]),
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              validator: (val) => val!.isEmpty
                                  ? 'M???t kh???u c?? kh??ng ???????c b??? tr???ng'
                                  : null,
                              controller: txtOldPass,
                              obscureText: isPassWord1,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPassWord1 = !isPassWord1;
                                    });
                                  },
                                  child: Icon(isPassWord1
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Color(0xff99cccc),
                                ),
                                hintText: "Nh???p m???t kh???u c??",
                                hintStyle: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ]),
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              validator: (val) => val!.isEmpty
                                  ? 'M???t kh???u m???i kh??ng ???????c b??? tr???ng'
                                  : null,
                              controller: txtNewPass,
                              obscureText: isPassWord2,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPassWord2 = !isPassWord2;
                                    });
                                  },
                                  child: Icon(isPassWord2
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Color(0xff99cccc),
                                ),
                                hintText: "Nh???p m???t kh???u m???i",
                                hintStyle: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ]),
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              validator: (val) => val != txtNewPass.text
                                  ? 'M???t kh???u kh??ng kh???p'
                                  : null,
                              controller: txtNewPassConfirm,
                              obscureText: isPassWord3,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPassWord3 = !isPassWord3;
                                    });
                                  },
                                  child: Icon(isPassWord3
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Color(0xff99cccc),
                                ),
                                hintText: "X??c th???c l???i m???t kh???u m???i",
                                hintStyle: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 150, left: 150),
                          child: SizedBox(
                            width: double.infinity,
                            height: 35,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.teal[300],
                              ),
                              onPressed: () async {
                                if (txtEmail == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Email kh??ng ???????c b??? tr???ng")));
                                } else if (txtSDT == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "S??? ??i???n tho???i kh??ng ???????c b??? tr???ng")));
                                } else if (txtOldPass == null ||
                                    txtNewPass == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "M???t kh???u kh??ng ???????c b??? tr???ng")));
                                } else if (txtNewPass.text !=
                                    txtNewPassConfirm.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "M???t kh???u x??c nh???n v???i m???t kh???u m???i kh??ng kh???p")));
                                } else {
                                  Auth.user = await apiForGotPass(
                                      txtEmail.text,
                                      txtSDT.text,
                                      txtOldPass.text,
                                      txtNewPass.text,
                                      txtNewPassConfirm.text);
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  });
                                }
                              },
                              child: const Text("?????i m???t kh???u"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
