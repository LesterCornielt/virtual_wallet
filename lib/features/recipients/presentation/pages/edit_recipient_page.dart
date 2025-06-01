import 'package:flutter/material.dart';

class EditRecipientPage extends StatelessWidget {
  // TODO: Accept Recipient object as parameter
  const EditRecipientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar destinatario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              // TODO: Pre-fill with existing name
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              // TODO: Pre-fill with existing phone number
              decoration: InputDecoration(
                labelText: 'Móvil',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              // TODO: Pre-fill with existing card number
              decoration: InputDecoration(
                labelText: 'Número de tarjeta',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              // TODO: Pre-select existing currency
              decoration: InputDecoration(
                labelText: 'Moneda',
                border: OutlineInputBorder(),
              ),
              items: const [
                // Replace with actual currency list
                DropdownMenuItem(value: 'CUP', child: Text('CUP')),
                DropdownMenuItem(value: 'USD', child: Text('USD')),
              ],
              onChanged: (value) {
                // TODO: Handle currency selection
              },
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement save changes logic
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  50,
                ), // Make button full width
              ),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      ),
    );
  }
}
