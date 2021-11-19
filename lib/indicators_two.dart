import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:graphics/widgets/bar_chart_indicator.dart';
import 'package:graphics/widgets/card_iformation_chart.dart';
import 'package:graphics/widgets/card_indicator.dart';
import 'package:graphics/widgets/line_chart_indicator.dart';
import 'package:graphics/widgets/pie_chart.dart';

class IndicatorsTwo extends StatelessWidget {
  const IndicatorsTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Stack(
              children: [
                Container(
                  // color: Colors.blue,
                  height: 300,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffFF162A49),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  height: 200,
                ),
                Center(
                  heightFactor: 3.5,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 10,
                        ),
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)),
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset(
                          'assets/boy.png',
                        )),
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 3),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ]),
              child: CalendarDatePicker(
                  initialCalendarMode: DatePickerMode.day,
                  initialDate: DateTime(2021),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  onDateChanged: (_) {}),
            ),
            const Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
                child: AutoSizeText(
                  'Horas Trabalhadas',
                  style: TextStyle(fontSize: 40, fontFamily: 'Roboto'),
                  minFontSize: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            Container(
              width: 300,
              height: 300,
              child: PieChartWidget(),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardInformtionChart(
                  title: 'Total de horas trabalhadas',
                  icon: Icons.watch_later_sharp,
                  info: '48:00',
                )),
            const Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
                child: AutoSizeText(
                  'Distância Percorrida',
                  style: TextStyle(fontSize: 40, fontFamily: 'Roboto'),
                  minFontSize: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            Container(width: 500, height: 400, child: BarChartIndicator()),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardInformtionChart(
                  title: 'Distância total percorrida',
                  icon: Icons.alt_route_rounded,
                  info: '80Km',
                )),
            const Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 50),
                child: AutoSizeText(
                  'Ganhos por mês',
                  style: TextStyle(fontSize: 40, fontFamily: 'Roboto'),
                  minFontSize: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 400,
                child: LineChartIndicator()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardInformtionChart(
                  title: 'Total ganho',
                  icon: Icons.attach_money_outlined,
                  info: 'R\$ 150',
                ),
            ),
          ],
        ),
      ),
    );
  }
}
