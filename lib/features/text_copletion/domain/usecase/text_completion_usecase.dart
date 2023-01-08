

import 'package:chatgpt/features/text_copletion/data/model/text_completion_model.dart';
import 'package:chatgpt/features/text_copletion/domain/repositories/text_completion_repository.dart';

class TextCompletionUseCase{
  final TextCompletionRepository repository;

  TextCompletionUseCase({required this.repository});

  Future<TextCompletionModel>call(String query)async{
    return repository.getTextCompletion(query);
  }
}