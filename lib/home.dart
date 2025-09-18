import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/sign_up.dart';
import 'package:shopping_app/sign_in.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E342E),
        title: const Text(
          "Coffee Shop",
          style: TextStyle(
            fontFamily: "Suwannaphum",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
  TextButton(
      style: ButtonStyle(
    overlayColor: MaterialStateProperty.all(Colors.transparent),
  ),
    onPressed: () {
      if (context.locale.languageCode == 'en') {
        context.setLocale(const Locale('ar', 'EG'));
      } else {
        context.setLocale(const Locale('en', 'US'));
      }
    },
    child: Text(
      context.locale.languageCode == 'en' ? "AR" : "EN",
      style: const TextStyle(color: Colors.white),
    ),
  )
],

      ),
      body: Container(
        decoration: const BoxDecoration(
          color:Color.fromARGB(255, 244, 244, 244),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              "Coffee".tr(),
              style: TextStyle(
                fontFamily: "Suwannaphum",
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "sipSavorShop".tr(),
              style: TextStyle(
                fontFamily: "Suwannaphum",
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/coffe_home.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://images.pexels.com/photos/20708708/pexels-photo-20708708.jpeg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFA1887F),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const signup()));
              },
              child: Text(
                "signUp".tr(),
                style: TextStyle(
                  fontFamily: "Suwannaphum",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4E342E),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const signin()));
              },
              child: Text(
                "signIn".tr(),
                style: TextStyle(
                  fontFamily: "Suwannaphum",
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
