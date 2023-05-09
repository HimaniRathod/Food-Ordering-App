import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Constants/Theme.dart';
import 'package:food_ordering_app/Constants/colors.dart';
import 'package:food_ordering_app/Constants/image_strings.dart';
import 'package:food_ordering_app/Constants/text_strings.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(bottom:20.0),),
            Container(
              child: Image(
                image: const AssetImage(slogo),
                height: size.height * 0.2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Text(
              LoginTitle,
              style: TTexttheme.Logintext.titleLarge,
            ),
            Text(
              Loginsubtitle,
              style: TTexttheme.Logintext.titleMedium,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: orange)),
                      ),
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
                    ),
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
                                  style: TTexttheme.Logintext.titleSmall,
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
                        onPressed: () {},
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
                          style: TTexttheme.Logintext.labelSmall,
                        ),),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40.0),
                    ),
                    Row(
                      children: [
                        Expanded(child:Divider(
                          color:orange,
                          thickness:1.0,
                        ),),
                        const Padding(padding:EdgeInsets.only(right:5.0),),
                        Text('OR',style:TTexttheme.Logintext.titleMedium,),
                        const Padding(padding:EdgeInsets.only(right:5.0),),
                        Expanded(child:Divider(
                          color:orange,
                          thickness:1.0,
                        ),),
                      ],

                    ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 40.0),
                        ),
                    SizedBox(
                      width:size.width*0.8,
                      height:size.height*0.07,
                      child:OutlinedButton.icon(onPressed: (){},
                          icon:  Image(image: AssetImage(sgoogle),width:40.0,
                          alignment:Alignment.centerLeft,),
                          label:Text('Google',style:TTexttheme.Logintext.labelMedium,)),
                    ),
                       const Padding(padding: EdgeInsets.only(bottom:40.0),),
                   Row(
                     mainAxisAlignment:MainAxisAlignment.center,
                     children: [
                       Text("Don't have an account?",style:TTexttheme.Logintext.titleMedium,),
                       TextButton(
                         child: Text(
                           'Create Account',
                         ),
                         onPressed: () {},
                       ),
                     ],

                   )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
