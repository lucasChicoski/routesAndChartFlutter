import 'package:flutter/material.dart';

class MyImageProfile extends StatelessWidget {
  final double? width;
  const MyImageProfile({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/boy.png',
        width: width,
      ),
    );
  }
}
