import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter/services.dart';

class AddRecipientPage extends StatelessWidget {
  const AddRecipientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

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
          'Adicionar destinatario',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FormBuilderTextField(
                    name: 'name',
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
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'El nombre es requerido',
                      ),
                      FormBuilderValidators.minLength(
                        3,
                        errorText: 'El nombre debe tener al menos 3 caracteres',
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: 16.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FormBuilderTextField(
                    name: 'phone',
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
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'El número de móvil es requerido',
                      ),
                      FormBuilderValidators.match(
                        RegExp(r'^\d{8}$'),
                        errorText: 'Ingrese un número de móvil válido',
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: 16.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FormBuilderTextField(
                    name: 'cardNumber',
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
                    maxLength: 16,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'El número de tarjeta es requerido',
                      ),
                      FormBuilderValidators.match(
                        RegExp(r'^\d{16}$'),
                        errorText: 'Ingrese un número de tarjeta válido',
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: 16.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FormBuilderDropdown<String>(
                    name: 'currency',
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
                    validator: FormBuilderValidators.required(
                      errorText: 'La moneda es requerida',
                    ),
                    items: const [
                      DropdownMenuItem(value: 'CUP', child: Text('CUP')),
                      DropdownMenuItem(value: 'USD', child: Text('USD')),
                    ],
                  ),
                ),
                SizedBox(height: 64.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      final formData = _formKey.currentState!.value;
                      // TODO: Implement save logic with formData
                      print(formData);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF083A85),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
