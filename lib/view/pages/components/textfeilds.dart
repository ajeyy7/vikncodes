import 'package:flutter/material.dart';

class MyText_Field extends StatelessWidget {
  const MyText_Field({super.key, this.controller, required this.hinttext});
final TextEditingController? controller;
final String hinttext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,

        decoration: InputDecoration(
            hintText: hinttext,
            filled: true,
            fillColor: Colors.grey.shade100,
            border:  OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(12),
            )),
      ),
    );
  }
}
