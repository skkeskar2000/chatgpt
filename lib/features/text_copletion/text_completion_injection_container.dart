import 'package:chatgpt/features/text_copletion/data/remote_data_source/text_completion_remote_data_source.dart';
import 'package:chatgpt/features/text_copletion/data/remote_data_source/text_completion_remote_data_source_impl.dart';
import 'package:chatgpt/features/text_copletion/data/repositories/text_completion_repository_impl.dart';
import 'package:chatgpt/features/text_copletion/domain/repositories/text_completion_repository.dart';
import 'package:chatgpt/features/text_copletion/domain/usecase/text_completion_usecase.dart';
import 'package:chatgpt/features/text_copletion/presentation/cubit/text_completion_cubit.dart';
import 'package:chatgpt/injection_container.dart';

Future<void> textCompletionInjectionContainer() async {
  //cubit
  sl.registerFactory<TextCompletionCubit>(
      () => TextCompletionCubit(textCompletionUseCase: sl.call()));

  //UseCase
  sl.registerLazySingleton<TextCompletionUseCase>(
      () => TextCompletionUseCase(repository: sl.call()));
  //repository
  sl.registerLazySingleton<TextCompletionRepository>(
      () => TextCompletionRepositoryImpl(remoteDataSource: sl.call()));

  //remote data source
  sl.registerLazySingleton<TextCompletionRemoteDataSource>(
      () => TextCompletionRemoteDataSourceImpl(httpClient: sl.call()));
}
