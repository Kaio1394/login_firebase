import 'package:flutter/material.dart';

class ForgivePassword extends StatefulWidget {
  @override
  _ForgivePasswordState createState() => _ForgivePasswordState();
}

class _ForgivePasswordState extends State<ForgivePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(50.0, 1.0, 50.0, 0.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "oi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
