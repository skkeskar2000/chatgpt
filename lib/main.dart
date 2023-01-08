import 'dart:io';
import 'package:chatgpt/core/http_certificate_manager.dart';
import 'package:chatgpt/features/app/route/on_generate_route.dart';
import 'package:chatgpt/features/text_copletion/domain/usecase/text_completion_usecase.dart';
import 'package:chatgpt/features/text_copletion/presentation/cubit/text_completion_cubit.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart  ';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TextCompletionCubit>(
          create: (_) => TextCompletionCubit(
            textCompletionUseCase: di.sl<TextCompletionUseCase>(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter ChatGPT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: '/',
      ),
    );
  }
}
