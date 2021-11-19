import 'package:flutter/material.dart';

class CardIndicator extends StatelessWidget {
  const CardIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      width: MediaQuery.of(context).size.width * 0.95,
     // height: 70,
      child: Row(
        children: [
          Flexible(flex: 1, child: Container()),
          Flexible(
              flex: 1,
              child: FittedBox(fit: BoxFit.fitWidth,child: Image.asset('assets/pie-chart.png',width: 100,))),
        ],
      ),
    );
  }
}
