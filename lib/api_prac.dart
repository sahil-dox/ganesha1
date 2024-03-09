import 'dart:convert';

import 'package:api_prac/modal_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIScreen extends StatefulWidget {
  const APIScreen({super.key});

  @override
  State<APIScreen> createState() => _APIScreenState();
}

class _APIScreenState extends State<APIScreen> {
  // void login() async {
  //   var login = await http.post(
  //       Uri.parse(
  //           "https://o360qa.speridian.com/API/ExternalApp_QA/MobileAppAPI/GetExpenseList"),
  //       body: {

  //       });

  //   print(login.body);
  //   setState(() {

  //   });
  // }
  List<Emp>? ofemp;
  void getExpenseList() async {
    var expense = await http.post(
        Uri.parse(
            "https://o360qa.speridian.com/API/ExternalApp_QA/MobileAppAPI/GetExpenseList"),
        body: {
          "ExpenseStatusCode": "PEN",
          "CustomerKey": "ED073250-FEBF-41DB-81F1-46DFAFFBD390"
        },
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImRldmVzaC5iaGFsZXJhbyIsImdpdmVuX25hbWUiOiJEZXZlc2ggQmhhbGVyYW8iLCJlbWFpbCI6ImRldmVzaC5iaGFsZXJhb0BzcGVyaWRpYW4uY29tIiwiRW1wbG95ZWVJZCI6IjU1NjkiLCJFbXBsb3llZUNvZGUiOiJTUDQ4NjYiLCJMb2dpblNlc3Npb25LZXkiOiJhM2QyOTdlYy0wODdlLTQ0MWUtOTc5OC0xYjAyOTI0ZjI5ODUiLCJBcHBLZXkiOiI1MjM4Y2I1YS05MjliLTQxNjAtODZiMy00ZDdlNTk4NWE2NzgiLCJCdXNpbmVzc1VuaXRJZCI6IjYiLCJPZmZpY2VJZCI6IjciLCJCdXNpbmVzc1VuaXROYW1lIjoiU3BlcmlkaWFuIEluZGlhIiwiT2ZmaWNlTmFtZSI6Ik11bWJhaSAtIFNwZXJpZGlhbiIsIkRlc2lnbmF0aW9uTmFtZSI6IkphdmEgTW9iaWxlIERldmVsb3BlciIsIkFwcGxpY2F0aW9uUm9sZXMiOiJNb2JpbGVBcHAiLCJFbXBsb3ltZW50VHlwZUlkIjoiMSIsIm5iZiI6MTcwOTg4NDg0OSwiZXhwIjoxNzA5OTA2NDQ5LCJpYXQiOjE3MDk4ODQ4NDl9.kM1dNkwSi3OnuVC1kac3DGq5StokdIPgJK3yCAQaLLs"
        });
    if (expense.statusCode == 200) {
      ofemp = Emp.getPostData(jsonDecode(expense.body));
      setState(() {});
    } else {
      print(expense.statusCode);
    }
    //setState(() {});
    print(expense.statusCode);
    print(expense.body);
    print("");
  }

  @override
  void initState() {
    getExpenseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          child: ListView.builder(
              itemCount: ofemp!.length,
              itemBuilder: (context, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Client Name"),
                            Text(
                              ofemp![index].clientName.toString() ?? "",
                            ),
                          ],
                        ),
                      ],
                    ));
              }),
        ),
      ),
    );
  }
}
