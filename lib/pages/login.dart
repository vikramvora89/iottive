import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:iottive/pages/home.dart';
import 'package:iottive/services/services.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    usernamecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(shrinkWrap: true, children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter your login details",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            TextFormField(
              validator: RequiredValidator(errorText: "Please Enter Username."),
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              controller: usernamecontroller..text = "bhavik.patel@iottive.com",
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.purpleAccent,
                ),
                hintText: "Enter Email",
                // contentPadding: EdgeInsets.all(10.0),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: passwordcontroller..text = "Bhavik123#",
              keyboardType: TextInputType.text,
              obscureText: hidePassword,
              enableSuggestions: false,
              autocorrect: false,
              validator: RequiredValidator(errorText: "Please Enter Password."),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.purpleAccent,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  color: Colors.purpleAccent,
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility),
                ),
                hintText: "Enter Password",
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Material(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                minWidth: MediaQuery.of(context).size.width * 0.1,
                height: 50.0,
                onPressed: () async {
                  var res = await Service().fetchlogin(
                      usernamecontroller.text, passwordcontroller.text);
                  print(res);
                  if (_formKey.currentState.validate()) {
                    final snackBar = SnackBar(
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.purple,
                      content: const Text(
                        'Processing Data.',
                        style: TextStyle(color: Colors.white),
                      ),
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    return;
                  }
                  if (res.success == true) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home_Page(),
                        ));
                  } else {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.orange,
                      content: const Text(
                        'Username or password incorrect.',
                        style: TextStyle(color: Colors.white),
                      ),
                      action: SnackBarAction(
                        label: 'OK',
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                color: Colors.purpleAccent,
                child: const Text('Log In',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
