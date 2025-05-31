import 'package:equatable/equatable.dart';

class Recipient extends Equatable {
  final String id;
  final String name;
  final String phoneNumber;
  final String cardNumber;
  final String currency;
  // TODO: Add other relevant fields like bank logo or type if needed

  const Recipient({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.cardNumber,
    required this.currency,
  });

  @override
  List<Object?> get props => [id, name, phoneNumber, cardNumber, currency];

  // Optional: Add copyWith method for easily creating modified instances
  Recipient copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? cardNumber,
    String? currency,
  }) {
    return Recipient(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cardNumber: cardNumber ?? this.cardNumber,
      currency: currency ?? this.currency,
    );
  }
}
