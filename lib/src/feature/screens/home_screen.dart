import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_application_1/src/feature/widgets/my_application_app_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: myApplicationDrawer(),
        appBar: AppBar(
          title: Text('Bienvenido a mi Aplicacion'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // configuracion para boton calcular edad
              ElevatedButton(
                onPressed: () => context.push('/age'),
                child: Text('Calculate Age'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),

              //configuracion para boton indicador me casa corporal
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push('/IMC'),
                child: Text('Calculate IMC'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Color.fromARGB(255, 214, 51, 51),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
              SizedBox(height: 20),

              //configuracion para boton signo Zodiacal
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push('/IMC'),
                child: Text('Calculate IMC'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lime,
                  foregroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),

              //configuracion para boton determinar si un dia es laboral
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push('/workDay'),
                child: Text('Calculate Work Day'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go('/zodiac');
                },
                child: Text('Go from Home to Zodiac Screen'),
              ),
            ],
          ),
        ));
  }
}
