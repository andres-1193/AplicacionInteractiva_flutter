import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_application_1/src/feature/widgets/my_application_app_drawer.dart';

class ImcScreen extends StatefulWidget {
  @override
  _ImcScreenState createState() => _ImcScreenState();
}

class _ImcScreenState extends State<ImcScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double? _imc;
  String? _category;

  void _calculateIMC() {
    final double weight = double.tryParse(_weightController.text) ?? 0;
    final double height = double.tryParse(_heightController.text) ?? 0;

    if (weight > 0 && height > 0) {
      final double heightInMeters = height / 100; // se convierte cm a metros
      setState(() {
        _imc = weight / (heightInMeters * heightInMeters);
        _category = _determineCategory(_imc!);
      });
    }
  }

  String _determineCategory(double imc) {
    if (imc < 18.5)
      return "Bajo peso";
    else if (imc < 25)
      return "Normal";
    else if (imc < 30)
      return "Sobre peso";
    else
      return "Obeso";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: myApplicationDrawer(),
        appBar: AppBar(
          title: Text('Imc calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Peso en Kilo Gramos',
                      border: OutlineInputBorder(),
                      hintText: 'ingrese su Peso en KG')),
              SizedBox(height: 20),
              TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Altura  en Centimetros',
                      border: OutlineInputBorder(),
                      hintText: 'Ingrese su estatura en cm')),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateIMC,
                child: Text('Resultado Indice Masa Corporal'),
              ),
              SizedBox(height: 20),
              if (_imc != null)
                Text('Su IMC : ${_imc!.toStringAsFixed(2)} ($_category)',
                    style: TextStyle(fontSize: 18)),
              ElevatedButton(
                onPressed: () {
                  context.go('/Home');
                },
                child: Text('Go from IMC to Home Screen'),
              ),
            ],
          ),
        ));
  }
}
