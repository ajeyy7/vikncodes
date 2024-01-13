import 'package:flutter/material.dart';

class Containerr extends StatelessWidget {
  const Containerr({super.key, required this.customername, required this.status, required this.invoiceno, required this.amount});
final String customername;
final String status;
  final String invoiceno;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(invoiceno,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,),),
                  Text(customername,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                ],
              ),
              Column(
                children: [
                  Text(status,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.blue),),
                  Text("Sar $amount",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
