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

//Deixando o grafico dinamico...

/**
 * Para deixar o gráfico mais dinanmico basta ler 
 * uma lista de informações, no caso do exemplo abaixo eu criei uma lista
 * com 5 posições.
 * e uma lista de cores referente a cada cor de cada porcentagem.
 * Ao gerar nossa Lista, passamos como parametro o tamanho dinamico de nossa lista
 * e uma variavel index (i) que será renderizado cada sessão do noss gráfico.
 * Pronto , agora criamos duas variaveis para receber o valor de cada index da lista
 * e em "value", na configuração do gráfico, passamos essa variável e temos nossas
 * sessões prontas para uso. A mesma coisa funciona com as cores.
 */
List<PieChartSectionData> showingSections() {
  List<double> myNumbers = [2, 3, 6, 30, 50]; // Lista de numeros para o gráfico
  //Lista de cores para cada sessão do gráfico
  List<Color> myColorsList = [
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.grey
  ];
  double porcentagem = 0; //variável que receberá cada numero da lista
  Color myColors = Colors.white; //variável que recebera cada cor da lista
  return List.generate(
    myNumbers.length, //quantidade de sessões (tamanho da sua lista)
    (i) {
      // index da sua lista

      porcentagem = myNumbers[i]; //variável recebendo cada numero 
      myColors = myColorsList[i];//variável recebendo cada cor 
      final isTouched = i == touchedIndex; // verifica qual index foi clicado

      final opacity = isTouched ? 1.0 : 0.6;
      const color0 = Color(0xff0293ee);
      const color1 = Color(0xfff8b250);
      const color2 = Color(0xff845bef);
      const color3 = Color(0xff13d38e);

      return PieChartSectionData(
        value: porcentagem,
        color: myColors,
        radius: isTouched ? 60 : 50
      );
    },
  );
}
