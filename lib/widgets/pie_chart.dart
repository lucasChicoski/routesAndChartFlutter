import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

int touchedIndex = -1;
double radius = 85;

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  State<PieChartWidget> createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
          sections: showingSections(), //imprime o gráfico
          startDegreeOffset: 0, //rotação do gráfico;
          sectionsSpace: 0,
          centerSpaceRadius: 60, //espaçamento do centro
          borderData: FlBorderData(
            show: false,
          ),
          pieTouchData: PieTouchData(//captura a o eventdo de clique
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex = pieTouchResponse.touchedSection!
                  .touchedSectionIndex; // retorna o index clicado
            });
          })),
    );
  }
}

//Lista de sessão
List<PieChartSectionData> showingSections() {
  return List.generate(
    4, //quantidade de sessões (tamanho da sua lista)
    (i) {
      // index da sua lista

      final isTouched = i == touchedIndex; // verifica qual index foi clicado
      final opacity = isTouched ? 1.0 : 0.6;
      const color0 = Color(0xff0293ee);
      const color1 = Color(0xfff8b250);
      const color2 = Color(0xff845bef);
      const color3 = Color(0xff13d38e);

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: color0.withOpacity(opacity),
            value: 25,
            title: '25%',
            radius: isTouched ? 90 : radius,
            titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff044d7c)),
            titlePositionPercentageOffset: 0.55,
            borderSide: isTouched
                ? BorderSide(color: color0, width: 6)
                : BorderSide(color: color0.withOpacity(0)),
          );
        case 1:
          return PieChartSectionData(
            color: color1.withOpacity(opacity),
            value: 25,
            title: '25%',
            radius: isTouched ? 90 : radius,
            titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff90672d)),
            titlePositionPercentageOffset: 0.55,
            borderSide: isTouched
                ? BorderSide(color: color1, width: 6)
                : BorderSide(color: color2.withOpacity(0)),
          );
        case 2:
          return PieChartSectionData(
            color: color2.withOpacity(opacity),
            value: 25,
            title: '25%',
            radius: isTouched ? 90 : radius,
            titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff4c3788)),
            titlePositionPercentageOffset: 0.6,
            borderSide: isTouched
                ? BorderSide(color: color2, width: 6)
                : BorderSide(color: color2.withOpacity(0)),
          );
        case 3:
          return PieChartSectionData(
            color: color3.withOpacity(opacity),
            value: 25,
            title: '25%',
            radius: isTouched ? 90 : radius,
            titleStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff0c7f55)),
            titlePositionPercentageOffset: 0.55,
            borderSide: isTouched
                ? BorderSide(color: color3, width: 6)
                : BorderSide(color: color2.withOpacity(0)),
          );
        default: // caso não tenha nada
          throw Error();
      }
    },
  );
}
