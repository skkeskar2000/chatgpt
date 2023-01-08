

import 'package:chatgpt/features/text_copletion/data/model/text_completion_model.dart';
import 'package:chatgpt/features/text_copletion/data/remote_data_source/text_completion_remote_data_source.dart';
import 'package:chatgpt/features/text_copletion/domain/repositories/text_completion_repository.dart';

class TextCompletionRepositoryImpl extends TextCompletionRepository{
  final TextCompletionRemoteDataSource remoteDataSource;

  TextCompletionRepositoryImpl({required this.remoteDataSource});
  @override
  Future<TextCompletionModel> getTextCompletion(String query) {
    return remoteDataSource.getTextCompletion(query);
  }

}