import 'package:flutter/material.dart';
import 'package:project1_posts/views/homePage.dart';
import 'package:project1_posts/views/login.dart';

class Splach extends StatefulWidget {
  const Splach({Key? key}) : super(key: key);

  @override
  State<Splach> createState() => _SplachState();
}


class _SplachState extends State<Splach> {

  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedSplashScreen(
  //     splash: 'images/splash.png',
  //     nextScreen: MainScreen(),
  //     splashTransition: SplashTransition.rotationTransition,
  //     pageTransitionType: PageTransitionType.scale,
  //   );
  // }

   @override
   void initState(){
     super.initState();
     _navigatetohome();
   }

  _navigatetohome() async{
    await Future.delayed(Duration(microseconds: 2500), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder:  (context)=> LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:  Center(
  child: Container(
    child: Text("AllPosts 👌"
      // ,style: TextStyle(color: Colors.purpleAccent ,fontWeight: FontWeight.bold ,  fontSize: double.maxFinite),
    ),
  ),
),

    );
  }
}
