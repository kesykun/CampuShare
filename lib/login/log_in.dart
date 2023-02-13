import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj3/components/buttons.dart';
import 'package:proj3/components/input_box.dart';
import 'package:proj3/components/logo.dart';
import 'package:proj3/components/showDialog.dart';
import 'package:proj3/signUp/sign_up.dart';


class Mylogin extends StatelessWidget{


  Mylogin({
      super.key,
    });

  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body : SingleChildScrollView(
          child: Center(
            child : Column(
                children: [

                    const SizedBox(height : 16),
                      
                    //create account
                    Padding(
                      padding: const EdgeInsets.only(left : 15, right : 22, top : 0, bottom : 0),
                      child: Row(
                        mainAxisAlignment : MainAxisAlignment.start,
                        children: [
                          Text(
                            'Log In',                    
                            style : GoogleFonts.inter(
                              fontSize : 20, 
                              fontWeight :FontWeight.w500,   
                            )
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height : 18),

                    InputBox(
                      controller: userEmailController, 
                      hintText: 'Enter User Email', 
                      obscureText: false,
                    ),

                    InputBox(
                      controller: passwordController, 
                      hintText: 'Enter Password', 
                      obscureText: true,
                    ),
                      
                    const SizedBox(height : 156),
                    
                    //Log In btn
                    GestureDetector(
                      onTap : (){
                        if((userEmailController.text == '') || 
                        (passwordController.text == '')){

                          showDialog(
                            context: context, 
                            builder : (context){
                              return const MyDialog(
                                text : "There are no inputs either on Email or Password. Please Check carefully!",
                              );
                            }
                          );
                        }
                      },
                      child : const MyButton(
                        buttonName : 'Log In',
                      ),
                    ),

                    const SizedBox(height : 40),


                      //or sign up with
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left : 22.0),
                            child: Divider(
                              color: Colors.grey[400],
                              thickness : 2,
                            ),
                          ),
                        ),
                          
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Or Sign up with',
                            style : GoogleFonts.inter(
                              textStyle : TextStyle(color : Colors.grey[700]),
                              fontSize : 13,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right : 22.0),
                            child: Divider(
                                color: Colors.grey[400],
                                thickness : 2,
                              ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height : 30),

                    //logo
                    Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children : const[

                        //facebook logo
                        MyLogo(image : 'lib/svg/facebook.svg'),
                        
                        SizedBox(width : 16),

                        //google logo
                        MyLogo(image: 'lib/svg/Google.svg'),

                        SizedBox(width : 16),
                          
                        //Apple logo
                        MyLogo(image: 'lib/svg/Apple.svg'),
                      ],
                    ),
                      
                    const SizedBox(height : 32),
                    //already have an account
                    Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style : GoogleFonts.inter(textStyle : const TextStyle(
                            fontSize : 13, 
                            )
                          ),
                        ),
                        
                        GestureDetector(
                          onTap : () {
                            Navigator.pop(context);
                          },

                          child : Text(
                            ' Sign up',
                            style : GoogleFonts.inter(
                                textStyle : const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color : Color(0xFF6C63FF),
                              )
                            ),
                          
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
          ),
        ),
      ),
    );
  }
}