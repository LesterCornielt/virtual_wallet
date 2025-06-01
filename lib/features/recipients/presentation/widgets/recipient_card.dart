import 'package:flutter/material.dart';

class RecipientCard extends StatelessWidget {
  // Callbacks for edit and delete actions
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const RecipientCard({super.key, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0D113A), // Even darker blue
            Color(0xFF1A237E), // Darker blue
          ],
        ),
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '**** **** **** 0000',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Nombre del Destinatario CUP',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            Positioned(
              top: -18,
              right: -10,
              child: PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 32,
                ),
                offset: const Offset(0, 10),
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
                      PopupMenuItem<String>(
                        value: 'edit',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Editar', style: TextStyle(fontSize: 14)),
                            Icon(Icons.edit, size: 18),
                          ],
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Eliminar', style: TextStyle(fontSize: 14)),
                            Icon(Icons.delete, size: 18),
                          ],
                        ),
                      ),
                    ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
