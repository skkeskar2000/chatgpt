import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chatgpt/core/custom_exception.dart';
import 'package:chatgpt/features/text_copletion/data/model/text_completion_model.dart';
import 'package:chatgpt/features/text_copletion/domain/usecase/text_completion_usecase.dart';
import 'package:equatable/equatable.dart';

part 'text_completion_state.dart';

class TextCompletionCubit extends Cubit<TextCompletionState> {
  final TextCompletionUseCase textCompletionUseCase;
  TextCompletionCubit({required this.textCompletionUseCase}) : super(TextCompletionInitial());

  Future<void>textCompletion({required String query})async{
    emit(TextCompletionLoading());
    try{
      final textCompletionModelData = await textCompletionUseCase.call(query);
      emit(TextCompletionLoaded(textCompletionModelData: textCompletionModelData));
    }on SocketException catch (error){
      emit(TextCompletionFailure(errorMsg: error.toString()));
    }on ServerException catch (error){
      emit(TextCompletionFailure(errorMsg: error.toString()));
    }
  }
}
