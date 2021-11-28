import 'package:dartz/dartz.dart';
import 'package:discovernow/domain/entities/app_error.dart';
import 'package:discovernow/domain/entities/movie_params.dart';
import 'package:discovernow/domain/entities/video_entity.dart';
import 'package:discovernow/domain/repositories/movie_repository.dart';
import 'package:discovernow/domain/usecases/usecase.dart';

class GetVideos extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository repository;

  GetVideos(this.repository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getVideos(movieParams.id);
  }
}
