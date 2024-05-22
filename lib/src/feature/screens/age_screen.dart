import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_application_1/src/feature/widgets/my_application_app_drawer.dart';

class AgeScreen extends StatefulWidget {
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime? _selectedDate;
  int? _age;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    ).then((pickDate) {
      if (pickDate == null) return;
      setState(() {
        _selectedDate = pickDate;
        _age = _calculateAge(pickDate);
      });
    });
  } // fin clase

  int _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  } // fin metodo calculateAge

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: myApplicationDrawer(),
        appBar: AppBar(title: Text("Age calculator")),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _presentDatePicker,
                child: Text(_selectedDate == null
                    ? 'seleccione su cumpleaños'
                    : 'cambiar cumpleaños (${_selectedDate!.toIso8601String().substring(0, 10)})'),
              ),
              SizedBox(height: 25),
              if (_age != null)
                Text('su edad es $_age años', style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  context.go('/IMC');
                },
                child: Text('Go from Age to IMC Screen'),
              ),
            ],
          ),
        ));
  }
}////fin clase age

