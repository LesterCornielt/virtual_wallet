import 'package:flutter/material.dart';

class RecipientCard extends StatelessWidget {
  // Callbacks for edit and delete actions
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const RecipientCard({super.key, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '**** **** **** 0000',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    // Handle menu item selection (Edit or Delete)
                    if (value == 'edit') {
                      // Call the onEdit callback if it's not null
                      onEdit?.call();
                    } else if (value == 'delete') {
                      // Call the onDelete callback if it's not null
                      onDelete?.call();
                    }
                  },
                  itemBuilder:
                      (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'edit',
                          child: ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Editar'),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Eliminar'),
                          ),
                        ),
                      ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Nombre del Destinatario CUP',
              style: TextStyle(fontSize: 16),
            ),
            // TODO: Add bank logo if necessary
          ],
        ),
      ),
    );
  }
}
