import 'package:dartz/dartz.dart';
import 'package:discovernow/domain/entities/app_error.dart';
import 'package:discovernow/domain/entities/cast_entity.dart';
import 'package:discovernow/domain/entities/movie_params.dart';
import 'package:discovernow/domain/repositories/movie_repository.dart';
import 'package:discovernow/domain/usecases/usecase.dart';

class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCast(this.repository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getCastCrew(movieParams.id);
  }
}
