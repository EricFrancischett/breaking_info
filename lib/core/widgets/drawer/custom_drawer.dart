import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String firstName;
  final String lastName;
  const CustomDrawer(
      {Key? key, required this.firstName, required this.lastName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Row(
              children: [
                Text("First Name: "),
                Text(firstName),
              ],
            ),
            Row(
              children: [
                Text("Last Name: "),
                Text(lastName),
              ],
            ),
            TextButton(onPressed: (){}, child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
