import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/screens/home.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password1Controller = TextEditingController();
  TextEditingController _password2Controller = TextEditingController();

  String _email;
  String _password1;
  String _password2;
  bool showLogin = true;
  @override
  Widget build(BuildContext context) {

    Widget _logo(){
      return Padding(
          padding: EdgeInsets.only(top: 30),
          child :Container(
            child: Align(
              child: Text("M.I.Mess", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black))
            )
          )
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller, bool obscure){
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            style: TextStyle(fontSize: 20, color: Colors.black),
            decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize:20, color: Colors.grey),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1)
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: IconTheme(
                  data: IconThemeData(color: Colors.black),
                  child: icon,
                )
              )
            ),
          )
        );
    }

    Widget _button(String label, void func()){
      return RaisedButton(
          splashColor: Theme.of(context).primaryColor,
          highlightColor: Theme.of(context).primaryColor,
          color: Colors.grey[300],
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)
          ),
        onPressed: (){
            func();
        },

      );
    }
    Widget _form(String label, void func()){
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 20, top: 30),
                child: _input(Icon(Icons.alternate_email), "Email", _emailController, false)
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _input(Icon(Icons.lock), "Password", _password1Controller, true)
            ),
            if (!showLogin)
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: _input(Icon(Icons.lock), "Password", _password2Controller, true)
              ),
            SizedBox(height: 5,),
            Padding(
                padding: EdgeInsets.only(left:20,right:20),
                child:Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: _button(label, func),
                ) ,
            )
          ],
        )
      );
    }

    void _buttonAction(){
      _email = _emailController.text;
      _password1 = _password1Controller.text;
      _password2 = _password2Controller.text;

      _emailController.clear();
      _password1Controller.clear();
      _password2Controller.clear();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()));


    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          (showLogin ?
          Column(
            children: <Widget>[
              _form('Login', _buttonAction),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    child: Text('Not registered yet? Register here', style: TextStyle(fontSize: 20, color :Colors.black)),
                    onTap:(){ setState((){
                      showLogin = false;
                    });}

                  )

              )
            ],
          )
          : Column(
            children: <Widget>[
              _form('Register', _buttonAction),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                      child: Text('Already registered? Login here', style: TextStyle(fontSize: 20, color :Colors.black)),
                      onTap:(){ setState((){
                        showLogin = true;
                      });}

                  )

              )
            ],
          )
          ),
        ],
      )
    );
  }
}
