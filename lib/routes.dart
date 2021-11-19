import 'package:flutter/cupertino.dart';
import 'package:graphics/indicators.dart';
import 'package:graphics/indicators_two.dart';
import 'package:graphics/main.dart';
import 'package:graphics/widgets/line_chart_indicator.dart';
import 'package:graphics/widgets/pie_chart.dart';

import 'indicators_three.dart';
import 'widgets/bar_chart_indicator.dart';

class RoutersList {
  static Map<String, WidgetBuilder> routerList = {
    '/graphics': (context) => PieChartWidget(),
    '/home': (context) => Home(),
    '/indicators': (context) => Indicators(),
    '/indicatorstwo': (context) => IndicatorsTwo(),
    '/barchartindicator': (context) => BarChartIndicator(),
    '/linechartindicator': (context) => LineChartIndicator(),
    '/indicatorsthree': (BuildContext context) => IndicatorsThree(),
  };
}
