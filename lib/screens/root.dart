import 'package:flutter/material.dart';
import 'package:petshop/screens/dashboard/dashboard.dart';

import 'login/login.dart';


class PetShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Big Live View",
      home: DashBoard(),
    );
  }
}
