import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:virtual_wallet/core/errors/failures.dart';

/// Abstract class for Use Cases
/// Each use case should extend this class.
/// The type `Type` is the return type of the use case.
/// The type `Params` is the type of parameters the use case takes.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// This class is used for use cases that do not require any parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
