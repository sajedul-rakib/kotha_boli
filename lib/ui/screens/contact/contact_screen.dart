import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kotha_boli/ui/screens/contact/controller.dart';

class ContactScreen extends GetView<ContactScreenController> {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              color: Colors.transparent,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Contacts",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.wavy
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const ListTile(leading: CircleAvatar(backgroundImage: NetworkImage(''),),)
          ],
        ),
      ),
    );
  }
}
