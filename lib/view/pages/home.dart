import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'components/home_container.dart';
import 'components/textfeilds.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> salesData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') ??
        '';
  }

  Future<void> fetchData() async {
    String accessToken = await getAccessToken();

    final Map<String, dynamic> requestData = {
      "BranchID": 1,
      "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
      "CreatedUserID": 62,
      "PriceRounding": 3,
      "page_no": 1,
      "items_per_page": 10,
      "type": "Sales",
      "WarehouseID": 1,
    };

    final response = await http.post(
      Uri.parse('https://www.api.viknbooks.com/api/v10/sales/sale-list-page/'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          requestData),
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      List<dynamic> responseData = jsonDecode(response.body)['data'];

      setState(() {
        salesData = responseData;
      });
      print(salesData);
      for (var data in responseData) {
      }
    } else {
      print('Error fetching data: ${response.statusCode}');
      print('Error body: ${response.body}');
    }
  }

  void _showAddBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyText_Field(controller: null, hinttext: "BranchID"),
              MyText_Field(controller: null, hinttext: "CompanyID"),
              MyText_Field(controller: null, hinttext: "CreatedUserID"),
              MyText_Field(controller: null, hinttext: "PriceRounding"),
              MyText_Field(controller: null, hinttext: "page_no"),
              MyText_Field(controller: null, hinttext: "items_per_page"),
              MyText_Field(controller: null, hinttext: "type"),
              MyText_Field(controller: null, hinttext: "WarehouseID"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Estimate"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  _showAddBottomSheet(context);
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.blue,
                )),
          )
        ],
      ),
      body: salesData.isEmpty?Center(
        child: CircularProgressIndicator()
      ):

      ListView.builder(
        itemCount: salesData.length,
        itemBuilder: (context, index) {
          final sale = salesData[index];
          return Containerr(
            customername: sale['CustomerName'],
            status: sale['Status'],
            invoiceno: sale['VoucherNo'].toString(),
            amount: sale['TotalGrossAmt_rounded'].toString(),
          );
        },
      ),
    );
  }
}
