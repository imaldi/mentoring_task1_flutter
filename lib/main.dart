import 'package:flutter/material.dart';
import 'package:mentoring_task1_flutter/page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Page1> {
  bool checkBoxMentorValue = false;
  bool checkBoxMenteeValue = false;
  bool checkBoxAgreementValue = false;
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final stackUsernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool _validateAndSave() {
      final form = _formKey.currentState;
      if (form.validate() && checkBoxAgreementValue == true) {
        form.save();
        return true;
      }
      return false;
    }

    void _validateAndSubmit() async {
      // setState(() {
      //   // _errorMessage = "";
      //   // _isLoading = true;
      // });

      if (_validateAndSave()) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return Page2(
              name: nameController.text,
              email: emailController.text,
              stackUsername: stackUsernameController.text,
              username: usernameController.text,
              isMentee: checkBoxMenteeValue,
              isMentor: checkBoxMentorValue,
            );
          }),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign Up"),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: "Name"),
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(hintText: "Username"),
                  ),
                  TextField(
                    controller: stackUsernameController,
                    decoration: InputDecoration(hintText: "Stack Username"),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  Text("Available to be a: "),
                  Column(children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: this.checkBoxMentorValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        this.checkBoxMentorValue = newValue;
                                      });
                                    }),
                                Container(
                                  width: 8.0,
                                ),
                                Text("Mentor")
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: this.checkBoxMenteeValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        this.checkBoxMenteeValue = newValue;
                                      });
                                    }),
                                Container(
                                  width: 8.0,
                                ),
                                Text("Mentee")
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: this.checkBoxAgreementValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          this.checkBoxAgreementValue =
                                              newValue;
                                        });
                                      }),
                                  Container(
                                    width: 300,
                                    child: Text(
                                        "I affirm that i have read and accept to be bound by the AnitaB.org Code of Conduct, Terms and Privacy Policy. Further, i consent to use of my information for the stated purpose"),
                                  ),
                                ],
                              ),
                              Row(children: []),
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
                  RaisedButton(
                    child: Text('SIGN UP'),
                    onPressed: () {
                      _validateAndSubmit();
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
