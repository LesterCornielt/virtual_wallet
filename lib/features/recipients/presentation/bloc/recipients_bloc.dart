import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_wallet/features/recipients/domain/models/recipient.dart';
import 'package:uuid/uuid.dart';

// Events
abstract class RecipientsEvent {}

class LoadRecipients extends RecipientsEvent {}

class AddRecipient extends RecipientsEvent {
  final String name;
  final String mobile;
  final String cardNumber;
  final String currency;

  AddRecipient({
    required this.name,
    required this.mobile,
    required this.cardNumber,
    required this.currency,
  });
}

class UpdateRecipient extends RecipientsEvent {
  final Recipient recipient;

  UpdateRecipient(this.recipient);
}

class DeleteRecipient extends RecipientsEvent {
  final String id;

  DeleteRecipient(this.id);
}

// State
abstract class RecipientsState {}

class RecipientsInitial extends RecipientsState {}

class RecipientsLoading extends RecipientsState {}

class RecipientsLoaded extends RecipientsState {
  final List<Recipient> recipients;

  RecipientsLoaded(this.recipients);
}

class RecipientsError extends RecipientsState {
  final String message;

  RecipientsError(this.message);
}

// BLoC
class RecipientsBloc extends Bloc<RecipientsEvent, RecipientsState> {
  final List<Recipient> _recipients = [];
  final _uuid = const Uuid();

  RecipientsBloc() : super(RecipientsInitial()) {
    on<LoadRecipients>(_onLoadRecipients);
    on<AddRecipient>(_onAddRecipient);
    on<UpdateRecipient>(_onUpdateRecipient);
    on<DeleteRecipient>(_onDeleteRecipient);

    // Cargar destinatarios al iniciar
    add(LoadRecipients());
  }

  void _onLoadRecipients(LoadRecipients event, Emitter<RecipientsState> emit) {
    emit(RecipientsLoading());
    try {
      emit(RecipientsLoaded(List.from(_recipients)));
    } catch (e) {
      emit(RecipientsError(e.toString()));
    }
  }

  void _onAddRecipient(AddRecipient event, Emitter<RecipientsState> emit) {
    try {
      final newRecipient = Recipient(
        id: _uuid.v4(),
        name: event.name,
        mobile: event.mobile,
        cardNumber: event.cardNumber,
        currency: event.currency,
      );

      _recipients.add(newRecipient);
      emit(RecipientsLoaded(List.from(_recipients)));
    } catch (e) {
      emit(RecipientsError(e.toString()));
    }
  }

  void _onUpdateRecipient(
    UpdateRecipient event,
    Emitter<RecipientsState> emit,
  ) {
    try {
      final index = _recipients.indexWhere((r) => r.id == event.recipient.id);
      if (index != -1) {
        _recipients[index] = event.recipient;
        emit(RecipientsLoaded(List.from(_recipients)));
      }
    } catch (e) {
      emit(RecipientsError(e.toString()));
    }
  }

  void _onDeleteRecipient(
    DeleteRecipient event,
    Emitter<RecipientsState> emit,
  ) {
    try {
      _recipients.removeWhere((r) => r.id == event.id);
      emit(RecipientsLoaded(List.from(_recipients)));
    } catch (e) {
      emit(RecipientsError(e.toString()));
    }
  }
}
