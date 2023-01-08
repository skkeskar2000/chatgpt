

import 'package:chatgpt/features/text_copletion/data/model/text_completion_model.dart';

abstract class TextCompletionRemoteDataSource{
  Future<TextCompletionModel>getTextCompletion(String query);
}