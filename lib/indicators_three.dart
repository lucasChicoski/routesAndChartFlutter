import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:graphics/widgets/bar_chart_indicator.dart';
import 'package:graphics/widgets/card_iformation_chart.dart';
import 'package:graphics/widgets/line_chart_indicator.dart';
import 'package:graphics/widgets/my_image_profile.dart';
import 'package:graphics/widgets/pie_chart.dart';

class IndicatorsThree extends StatefulWidget {
  const IndicatorsThree({Key? key}) : super(key: key);

  @override
  State<IndicatorsThree> createState() => _IndicatorsThreeState();
}

class _IndicatorsThreeState extends State<IndicatorsThree> {
  String? dataInicialSelecionada;
  String? dataFinalSelecionada;

  var controllerFieldDateOne = TextEditingController();
  var controllerFieldDateTwo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<DateTime?> dateTimePickerTwo(int x) {
      return showDatePicker(
        initialEntryMode: DatePickerEntryMode.input,
        context: context,
        initialDate: DateTime(2021),
        firstDate: DateTime(2020),
        lastDate: DateTime(2022),
      ).then((valorCapturado) {
        setState(() {
          if (x == 1) {
            if (valorCapturado == null) {
              dataInicialSelecionada = 'Data inicial';
            } else {
              dataInicialSelecionada = valorCapturado.toString();
              print("Minha data: $dataInicialSelecionada");
              controllerFieldDateOne.text = dataInicialSelecionada!;
            }
          } else if (x == 2) {
            if (valorCapturado == null) {
              dataFinalSelecionada = 'Data inicial';
            } else {
              dataFinalSelecionada = valorCapturado.toString();
              print("Minha data final: $dataFinalSelecionada");
              controllerFieldDateTwo.text = dataFinalSelecionada!;
            }
          }
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Stack(
              children: [
                Container(
                  height: 200,
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
                  height: 100,
                ),
                
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue.withOpacity(0),
                        width: 10,
                      ),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color(0xffdcd9f8),
                      backgroundImage: AssetImage('assets/boy.png'),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          label: Text(
                            'Data inicial',
                          ),
                          fillColor: Colors.grey[200]),
                      readOnly: true,
                      onTap: () {
                        dateTimePickerTwo(1);
                      },
                      controller: controllerFieldDateOne,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          label: Text(
                            'Data Final',
                          ),
                          fillColor: Colors.grey[200]),
                      readOnly: true,
                      onTap: () {
                        dateTimePickerTwo(2);
                      },
                      controller: controllerFieldDateTwo,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: dataInicialSelecionada != null &&
                  dataFinalSelecionada != null,
              child: Column(
                children: [
                  const Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
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
                  Container(
                      width: 500, height: 400, child: BarChartIndicator()),
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
          ],
        ),
      ),
    );
  }
}
