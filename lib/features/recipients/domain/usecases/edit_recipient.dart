import 'package:dartz/dartz.dart';
import 'package:virtual_wallet/core/errors/failures.dart';
import 'package:virtual_wallet/core/usecases/usecase.dart';
import 'package:virtual_wallet/features/recipients/domain/entities/recipient.dart';
import 'package:virtual_wallet/features/recipients/domain/recipient_repository.dart';

/// Edit an existing recipient use case.
/// This use case updates an existing recipient using the repository.
class EditRecipient extends UseCase<void, Recipient> {
  final RecipientRepository repository;

  EditRecipient(this.repository);

  @override
  Future<Either<Failure, void>> call(Recipient recipient) async {
    // The use case delegates the call to the repository to edit the recipient.
    return await repository.editRecipient(recipient);
  }
}
