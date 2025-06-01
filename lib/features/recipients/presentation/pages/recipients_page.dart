import 'package:flutter/material.dart';
import 'package:virtual_wallet/features/recipients/presentation/widgets/recipient_card.dart';
import 'package:virtual_wallet/features/recipients/presentation/pages/add_recipient_page.dart';
import 'package:virtual_wallet/features/recipients/presentation/pages/edit_recipient_page.dart';

class RecipientsPage extends StatelessWidget {
  const RecipientsPage({super.key});

  // Dummy data for recipients
  final List<String> recipients = const ['Mi papá CUP', 'Mi mamá CUP'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(right: 0),
          child: IconButton(
            icon: Text(
              '<',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            onPressed: null,
          ),
        ),
        title: const Text(
          'Destinatarios',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: recipients.length + 1, // Add 1 for the button
              itemBuilder: (context, index) {
                if (index == recipients.length) {
                  // This is the index for the button
                  return Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ).copyWith(top: 100.0, left: 46.0, right: 46.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddRecipientPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            SizedBox(width: 8.0),
                            Text(
                              'Adicionar destinatario',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  // Otherwise, build the recipient card
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 46.0),
                    child: RecipientCard(
                      onEdit: () {
                        // Navigate to EditRecipientPage when Edit is selected
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditRecipientPage(),
                          ),
                        );
                      },
                      onDelete: () {
                        // Show delete confirmation dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirmar eliminación'),
                              content: const Text(
                                '¿Estás seguro de que deseas eliminar este destinatario?',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed:
                                      () =>
                                          Navigator.of(
                                            context,
                                          ).pop(), // Dismiss dialog
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // TODO: Implement actual delete logic using BLoC
                                    Navigator.of(
                                      context,
                                    ).pop(); // Dismiss dialog
                                  },
                                  child: const Text('Eliminar'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
