import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/page.dart';
import 'package:login/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgivePassword.dart';
import 'package:firebase_core/firebase_core.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue,
      body: Center(
        child: SizedBox(
          width: 380,
          height: 400,
          child: Form(
            key: _formKey,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 1.0, 50.0, 1.0),
                    child: TextFormField(
                      validator: (input){
                        if(input.isEmpty || !input.contains('@')){
                          return 'Invalid e-mail';
                        }
                        return null;
                      },
                      onChanged: (input) => _email = input,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        )
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 1.0, 50.0, 0.0),
                    child: TextFormField(
                      validator: (input){
                        if(input.length < 6){
                          return 'Your password needs to be atleast 6 characters';
                        }
                        return null;
                      },
                      onChanged: (input) => _password = input,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(178, 0, 0, 0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ForgivePassword()));
                            },
                            child: Text(
                              "Esqueci minha senha",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                      width: 310,
                      height: 35,
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        onPressed: sigIn,
                        child: Text("Login"),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                        width: 310,
                        height: 35,
                        child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PaginaRegistro()));
                          },
                          child: Text("Registre-se"),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }

  Future<void> sigIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      try{
        UserCredential user =  await FirebaseAuth.
        instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      }catch(e){
        print(e.message);
      }
    }
  }
}
