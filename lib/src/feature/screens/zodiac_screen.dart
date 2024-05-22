import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_application_1/src/feature/widgets/my_application_app_drawer.dart';

class ZodiacScreen extends StatefulWidget {
  @override
  _ZodiacScreenState createState() => _ZodiacScreenState();
}

class _ZodiacScreenState extends State<ZodiacScreen> {
  final TextEditingController _nombreController = TextEditingController();
  DateTime? _selectedDate;
  String? _zodiacSigno;

  void _presentDatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) return;
      setState(() {
        _selectedDate = pickDate;
        _zodiacSigno = _determineZodiacSign(pickDate);
      });
    });
  }

  String _determineZodiacSign(DateTime date) {
    int day = date.year;
    int month = date.month;
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return 'Acuario';
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      return 'Piscis';
    } else if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return 'Aries';
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return 'Tauro';
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return 'Géminis';
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return 'Cáncer';
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return 'Leo';
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return 'Virgo';
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return 'Libra';
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return 'Escorpio';
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return 'Sagitario';
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return 'Capricornio';
    }
    return 'Desconocido';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myApplicationDrawer(),
      appBar: AppBar(
        title: Text('Zodiac'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: ' Nombre',
                hintText: 'Registre su Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _presentDatepicker,
              child: Text(_selectedDate == null
                  ? 'seleccione su cumpleaños'
                  : 'cambiar cumpleaños '),
            ),
            SizedBox(height: 25),
            if (_zodiacSigno != null)
              Text(
                'HOLA , ${_nombreController.text}! Su signo Zodiacal es $_zodiacSigno.',
                style: TextStyle(fontSize: 20),
              ),
            ElevatedButton(
              onPressed: () {
                context.go('/Age');
              },
              child: Text('Go from Zodiac to Age Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
