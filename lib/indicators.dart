import 'package:flutter/material.dart';
import 'package:graphics/widgets/pie_chart.dart';


class Indicators extends StatelessWidget {
  const Indicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Indicadores'),),
      body: Column(
        children: [
          Flexible(
              flex: 5,
              child: Container(
                height: 500,
                child: CalendarDatePicker(
                    initialDate: DateTime(2021),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2040),
                    onDateChanged: (_) {}),
              )),
          Flexible(flex: 5, child: PieChartWidget()),
        ],
      ),
    );
  }
}
