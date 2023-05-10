import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/Theme.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/Controller/Login_Controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    final LoginController CLogin = LoginController();

    //validation for username
    String? validatorUsername(String? value){
      if (value == null || value.isEmpty) {
        return 'Please enter a Username';
      }
      return null;
    }

    //validation for password
    String? validatorPassword(String? value){
      if (value == null || value.isEmpty) {
        return 'Please enter a Password';
      }
      return null;
    }

    //initilize the controller
    CLogin.usernameController = TextEditingController();
    CLogin.passwordController = TextEditingController();

    return  Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Form(
        key:CLogin.formkey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: orange),),
              ),
              controller:CLogin.usernameController,
              validator:validatorUsername,

            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: orange)),
              ),
              controller:CLogin.passwordController,
              validator:validatorPassword),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Checkbox(
                          onChanged: (value) {},
                          value: true,
                        ),
                        Text(
                          'Remember me',
                          style: TTexttheme.LRtext.titleSmall,
                        )
                      ],
                    )),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      'Forget Password?',
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            ElevatedButton(
              onPressed: () {
              CLogin.Login();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // maximumSize:Size(size.width*0.5, size.height*0.2),
                fixedSize: Size(size.width*0.7, size.height*0.06),
                elevation:5.0,

              ),
              child: Text(
                'Log In',
                style: TTexttheme.LRtext.labelSmall,
              ),),
          ],
        ),
      ),
    );
  }
}
