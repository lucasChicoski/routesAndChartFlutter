import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({Key? key}) : super(key: key);

  @override
  _MyChartState createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  int index = 0;

  List<double> myNumbers = [2, 3, 6, 30, 50];
  List<Color> myColorsList = [
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.grey
  ];
  double porcentagem = 0;
  Color myColors = Colors.white;

  List<PieChartSectionData> getSections() {
    return List.generate(myNumbers.length, (index) {
      porcentagem = myNumbers[index];
      myColors = myColorsList[index];
      return PieChartSectionData(
        value: porcentagem,
        color: myColors,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PieChart(PieChartData(
        sections: getSections(),
      )),
    );
  }
}