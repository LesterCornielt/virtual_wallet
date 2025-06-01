import 'package:flutter/material.dart';

class EditRecipientPage extends StatelessWidget {
  // TODO: Accept Recipient object as parameter
  const EditRecipientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            icon: const Text(
              '<',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Editar destinatario',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextFormField(
                // TODO: Pre-fill with existing name
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextFormField(
                // TODO: Pre-fill with existing phone number
                decoration: InputDecoration(
                  labelText: 'Móvil',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(height: 16.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextFormField(
                // TODO: Pre-fill with existing card number
                decoration: InputDecoration(
                  labelText: 'Número de tarjeta',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 16.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: DropdownButtonFormField<String>(
                // TODO: Pre-select existing currency
                decoration: InputDecoration(
                  labelText: 'Moneda',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
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
            ),
            SizedBox(height: 64.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement save changes logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(
                  0xFF083A85,
                ), // Slightly darker blue color
                minimumSize: const Size(
                  double.infinity,
                  50,
                ), // Make button full width
              ),
              child: const Text(
                'Aceptar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
