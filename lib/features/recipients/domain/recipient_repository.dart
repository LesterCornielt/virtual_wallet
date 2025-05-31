import 'package:dartz/dartz.dart'; // Assuming dartz is used for functional error handling
import 'package:virtual_wallet/core/errors/failures.dart'; // Assuming a common failure class
import 'package:virtual_wallet/features/recipients/domain/entities/recipient.dart';

abstract class RecipientRepository {
  /// Get a list of all recipients.
  /// Returns a [Right] containing a [List<Recipient>] on success,
  /// or a [Left] containing a [Failure] on failure.
  Future<Either<Failure, List<Recipient>>> getRecipients();

  /// Add a new recipient.
  /// Takes a [Recipient] object as input.
  /// Returns a [Right] containing [void] on success,
  /// or a [Left] containing a [Failure] on failure.
  Future<Either<Failure, void>> addRecipient(Recipient recipient);

  /// Edit an existing recipient.
  /// Takes a [Recipient] object with updated information.
  /// Returns a [Right] containing [void] on success,
  /// or a [Left] containing a [Failure] on failure.
  Future<Either<Failure, void>> editRecipient(Recipient recipient);

  /// Delete a recipient.
  /// Takes the recipient's ID as input.
  /// Returns a [Right] containing [void] on success,
  /// or a [Left] containing a [Failure] on failure.
  Future<Either<Failure, void>> deleteRecipient(String id);
}
