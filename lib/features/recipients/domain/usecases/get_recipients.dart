import 'package:dartz/dartz.dart';
import 'package:virtual_wallet/core/errors/failures.dart';
import 'package:virtual_wallet/core/usecases/usecase.dart'; // Assuming a base usecase class
import 'package:virtual_wallet/features/recipients/domain/entities/recipient.dart';
import 'package:virtual_wallet/features/recipients/domain/recipient_repository.dart';

/// Get all recipients use case.
/// This use case retrieves a list of all recipients from the repository.
class GetRecipients extends UseCase<List<Recipient>, NoParams> {
  final RecipientRepository repository;

  GetRecipients(this.repository);

  @override
  Future<Either<Failure, List<Recipient>>> call(NoParams params) async {
    // The use case simply delegates the call to the repository.
    return await repository.getRecipients();
  }
}
