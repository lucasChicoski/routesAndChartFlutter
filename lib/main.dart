import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphics/routes.dart';

main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xffFF162A49),
    systemStatusBarContrastEnforced: true,
    statusBarIconBrightness: Brightness.light
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //OBS:  Para usar as rotas é preciso que o MaterialApp esteja separado
  //de outra classe.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //lista de rotas
      routes: RoutersList.routerList,
      //rota inicial
      initialRoute: '/home',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/indicators');
                },
                child: Text('Indicadores tipo um')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/indicatorstwo');
                },
                child: Text('Indicadores tipo dois')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/indicatorsthree');
                },
                child: Text('Indicadores tipo tres')),
          ],
        ),
      ),
    );
  }
}
