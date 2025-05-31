import 'package:dartz/dartz.dart';
import 'package:virtual_wallet/core/errors/failures.dart';
import 'package:virtual_wallet/core/usecases/usecase.dart';
import 'package:virtual_wallet/features/recipients/domain/entities/recipient.dart';
import 'package:virtual_wallet/features/recipients/domain/recipient_repository.dart';

/// Add a new recipient use case.
/// This use case adds a new recipient using the repository.
class AddRecipient extends UseCase<void, Recipient> {
  final RecipientRepository repository;

  AddRecipient(this.repository);

  @override
  Future<Either<Failure, void>> call(Recipient recipient) async {
    // The use case delegates the call to the repository to add the recipient.
    return await repository.addRecipient(recipient);
  }
}
