import 'package:flutter/material.dart';

class Button extends StatelessWidget {
   Button({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 120,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sign in", style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade50)),
              Icon(Icons.arrow_forward,color: Colors.grey.shade50)
            ],
          ),
        ),
      ),
    );
  }
}
