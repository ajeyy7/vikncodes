import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikncodes/view/pages/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'components/signupButton.dart';

class Login extends StatelessWidget {
  final TextEditingController usercontroller = TextEditingController();
 final TextEditingController passcontroller = TextEditingController();

  Login({super.key});

  Future<void> signin() async {
    if (usercontroller.text.trim().isEmpty ||
        passcontroller.text.trim().isEmpty) {
      Get.snackbar("Error", "Please provide a correct input",
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(10),
          icon: const Icon(Icons.warning_amber));
      return;
    }
    const String apiurl =
        "https://api.accounts.vikncodes.com/api/v1/users/login";
    final response = await http.post(Uri.parse(apiurl), body: {
      "username": usercontroller.text.trim(),
      "password": passcontroller.text.trim(),
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      String accessToken = responseData['data']['access'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', accessToken);
      // print("tokenis:$accessToken");
      //  print(responseData);
      Get.off(() => MyHomePage());
    }
    // print(response.statusCode);
    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/images/bg.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            ///translate
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.translate,
                    color: Colors.blueAccent,
                  ),
                  Text(" English")
                ],
              ),
            ),


            ///logintext


            const Column(
              children: [
                Text("Login",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text("Login to your vikns account",
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 17)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  ///textfileds
                  TextField(
                    controller: usercontroller,
                    decoration: InputDecoration(
                        hintText: 'Username',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        prefixIcon: const Icon(
                          Icons.person_outlined,
                          color: Colors.blue,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                        )),
                  ),
                  TextField(
                    controller: passcontroller,
                    decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Colors.blue,
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility,
                          color: Colors.blue,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15)),
                        )),
                  )
                ],
              ),
            ),

            ///forgotpassword
            const Text("Forgot password?",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.blue)),

            ///signinbutton
            Button(
              onTap: () {
                signin();
              },
            ),

            ///dont have an account
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Dont have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.grey.shade900)),
                  const Text("Sign upnow!",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.blue)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
