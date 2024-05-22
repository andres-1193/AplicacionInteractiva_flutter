import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkdayScreen extends StatefulWidget {
  @override
  _WorkdayScreenState createState() => _WorkdayScreenState();
}

class _WorkdayScreenState extends State<WorkdayScreen> {
  final TextEditingController _dateController = TextEditingController();
  String _workday = '';

//metodo para validar que se ingrese una fecha
//muestre el mensaje de por favor ingrese un fecha cuando el usuario
// le da clic al boton CALCULAR DIA LABORAL, si ha dejado el campo vacio
  void _calculateWorkday() {
    if (_dateController.text.isEmpty) {
      setState(() {
        _workday = 'Por favor, introduce una fecha';
      });
      return;
    }

//metodo para validar que se ingrese una fecha correcta
//muestre el mensaje de 'Fecha inválida. Usa el formato aaaa-mm-dd'cuando el usuario
// digita un formato de  fecha que no es valida.
    final date = DateTime.tryParse(_dateController.text);
    if (date == null) {
      setState(() {
        _workday = 'Fecha inválida. Usa el formato aaaa-mm-dd';
      });
      return;
    }

    setState(() {
      _workday = _getWorkday(date);
    });
  }

  //este metodo permite determinar si el dia es laboral o no, haciendo uso de una estructura
  //condicional donde  valida que la fecha ingresada por el usuario este en el rango de 1 a 5
  // y esto significa que el dia es laboral, en caso contrario si el  dato arrona un numero 6 o 7
  // corresponde a un dia no Laboral
  String _getWorkday(DateTime date) {
    // Obtén el día de la semana (1=Lunes, 2=Martes, ..., 7=Domingo)
    int dayOfWeek = date.weekday;

    if (dayOfWeek >= 1 && dayOfWeek <= 5) {
      // Es un día laboral (Lunes a Viernes)
      return 'Es un día laboral: ${_dayOfWeekToString(dayOfWeek)}';
    } else {
      // Es fin de semana
      return 'Es fin de semana: ${_dayOfWeekToString(dayOfWeek)}';
    }
  }

//en este metodo se usa una estructura tipo case, en este metodo se ingresa como parametro
//el dato que ha retornado el metodo  _getWorkday de tipo dato entero;
// el ingresar a la estructura este dato hace un recorrido por cada case donde si es 1
//corresponde a Lunes, 2 a martes y asi sucesivamente, por ultimo  se devuelte el dato de tipo
//string con el nombre de la Smemana

  String _dayOfWeekToString(int dayOfWeek) {
    switch (dayOfWeek) {
      case 1:
        return 'Lunes';
      case 2:
        return 'Martes';
      case 3:
        return 'Miércoles';
      case 4:
        return 'Jueves';
      case 5:
        return 'Viernes';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        return 'Desconocido';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Día Laboral'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Fecha (aaaa-mm-dd)',
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateWorkday,
              child: Text('Calcular Día Laboral'),
            ),
            SizedBox(height: 20),
            Text(
              _workday,
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/zodiac');
              },
              child: Text('Go from WorkDay to Zodiac Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
