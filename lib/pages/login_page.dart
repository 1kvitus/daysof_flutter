
import 'package:eight_hrs/utils/routes.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 final _formkey = GlobalKey<FormState>();

 moveToHome(BuildContext context)async{
   if(_formkey.currentState!.validate()) {
     setState(() {
       change = true;
     });
     await Future.delayed(Duration(seconds: 1));
     await Navigator.pushNamed(context, MyRoutes.homeRoute);
     setState(() {
       change = false;
     });
   }
 }

  String username = "Sekai-Ichi@gmail.com";
  String password = "00000";
  String name = "";
  bool change= false;
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child  : SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/lia.png", fit: BoxFit.cover),
            SizedBox(height: 30),
            Text("Welcome $name", style: TextStyle(
              fontSize: 25,
            ),),
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                     decoration: InputDecoration(
                       hintText: "Enter username",
                       label: Text("Username"),
                       border: OutlineInputBorder()
                     ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter valid user name";
                        }else {
                          return null;
                        }
                      },
                      onChanged: (value){
                        name = value;
                       setState((){
                       });
                      },

                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                          border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value != password){
                          return "Enter valid password";
                        }else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 35),

                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: change? 50: 150,
                        alignment: Alignment.center,
                        child: change? Icon(Icons.done,color: Colors.white,):Text("Login",

                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(change? 50 :8.0),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   style: TextButton.styleFrom(),
                    //   onPressed: (){
                    //      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("Login"),
                    //
                    // )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
