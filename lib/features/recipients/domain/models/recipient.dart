import 'package:equatable/equatable.dart';

class Recipient extends Equatable {
  final String id;
  final String name;
  final String mobile;
  final String cardNumber;
  final String currency;

  const Recipient({
    required this.id,
    required this.name,
    required this.mobile,
    required this.cardNumber,
    required this.currency,
  });

  @override
  List<Object?> get props => [id, name, mobile, cardNumber, currency];

  Recipient copyWith({
    String? id,
    String? name,
    String? mobile,
    String? cardNumber,
    String? currency,
  }) {
    return Recipient(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      cardNumber: cardNumber ?? this.cardNumber,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'cardNumber': cardNumber,
      'currency': currency,
    };
  }

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(
      id: json['id'] as String,
      name: json['name'] as String,
      mobile: json['mobile'] as String,
      cardNumber: json['cardNumber'] as String,
      currency: json['currency'] as String,
    );
  }
}
