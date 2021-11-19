import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardInformtionChart extends StatelessWidget {
  final String title;
  final IconData icon;
  final String info;

  CardInformtionChart({
    Key? key,
    required this.title,
    required this.icon,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 100,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Flexible(
            flex: 2,
            child: Container(
              child: AutoSizeText(
                title,
                style: const TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                minFontSize: 12,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Icon(icon, size: 30,),
                AutoSizeText(
                 info ,
                  style: TextStyle(fontSize: 40, fontFamily: 'Roboto'),
                  minFontSize: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ))
      ]),
    );
  }
}
