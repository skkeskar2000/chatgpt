import 'dart:convert';

import 'package:chatgpt/core/custom_exception.dart';
import 'package:chatgpt/core/open_ai_data.dart';
import 'package:chatgpt/features/text_copletion/data/model/text_completion_model.dart';
import 'package:chatgpt/features/text_copletion/data/remote_data_source/text_completion_remote_data_source.dart';
import 'package:http/http.dart' as http;

class TextCompletionRemoteDataSourceImpl extends TextCompletionRemoteDataSource{
  final http.Client httpClient;

  TextCompletionRemoteDataSourceImpl({required this.httpClient});

  //private end point engine
  String _endPoint(String endPoint) => '$baseURL/$endPoint';

  Map<String,String>_headerBearerOption(String token)=>{
    "content-type" : "application/json",
    "Authorization" : "Bearer $token",
  };

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async{
    final String endPoint = "completions";

    Map<String,String>rowParams = {
      "model" : "text-davinci-003",
      "prompt" : query,
    };

    print(Uri.parse(_endPoint(endPoint)));
    final encodeParams = jsonEncode(rowParams);

    final response = await httpClient.post(
      Uri.parse(_endPoint(endPoint)),
      body: encodeParams,
      headers: _headerBearerOption(OPEN_AI_KEY),
    );
    print("response get success fully ");
    print(response.statusCode);
    if(response.statusCode == 200){
      return TextCompletionModel.fromJson(jsonDecode(response.body));
    }else{
      throw ServerException(message : "Text Completion Server Exception");
    }
  }

}