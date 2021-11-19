import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartIndicator extends StatefulWidget {
  const BarChartIndicator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartIndicatorState();
}

class BarChartIndicatorState extends State<BarChartIndicator> {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        barTouchData: BarTouchData(
          enabled: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) =>
                const TextStyle(color: Color(0xff939393), fontSize: 10),
            margin: 10,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'Apr';
                case 1:
                  return 'May';
                case 2:
                  return 'Jun';
                case 3:
                  return 'Jul';
                case 4:
                  return 'Aug';
                default:
                  return '';
              }
            },
          ),
          leftTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTextStyles: (context, value) => const TextStyle(
                color: Color(
                  0xff939393,
                ),
                fontSize: 10),
            margin: 0,
          ),
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(showTitles: false),
        ),
        gridData: FlGridData(
          show: true,
          checkToShowHorizontalLine: (value) => value % 10 == 0,
          getDrawingHorizontalLine: (value) => FlLine(
            color: const Color(0xffe7e8ec),
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        groupsSpace: 4,
        barGroups: getData(),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 80,
              rodStackItems: [
                BarChartRodStackItem(0, 2000000000, dark),
                //  BarChartRodStackItem(2000000000, 12000000000, normal),
                //  BarChartRodStackItem(12000000000, 17000000000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 60,
              rodStackItems: [
                //BarChartRodStackItem(0, 13000000000, dark),
                //BarChartRodStackItem(13000000000, 14000000000, normal),
                BarChartRodStackItem(100, 100, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 50,
              rodStackItems: [
                BarChartRodStackItem(0, 6000000000.5, dark),
                // BarChartRodStackItem(6000000000.5, 18000000000, normal),
                //  BarChartRodStackItem(18000000000, 23000000000.5, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 10,
              rodStackItems: [
                BarChartRodStackItem(0, 9000000000, dark),
                // BarChartRodStackItem(9000000000, 15000000000, normal),
                //  BarChartRodStackItem(15000000000, 29000000000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
          BarChartRodData(
              y: 20,
              rodStackItems: [
                BarChartRodStackItem(0, 2000000000.5, dark),
                //  BarChartRodStackItem(2000000000.5, 17000000000.5, normal),
                // BarChartRodStackItem(17000000000.5, 32000000000, light),
              ],
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}
