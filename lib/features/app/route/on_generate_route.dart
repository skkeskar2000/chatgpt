import 'package:chatgpt/features/app/app_const/page_const.dart';
import 'package:chatgpt/features/app/home/home_page.dart';
import 'package:chatgpt/features/app/splash/splash_screen.dart';
import 'package:chatgpt/features/image_generation/presentation/pages/image_generation_page.dart';
import 'package:chatgpt/features/text_copletion/presentation/pages/text_completion_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return cupertinoBuilder(
          widget: SplashScreen(
            child: HomePage(),
          ),
        );

      case PageConst.imageGenerationPage:
        return cupertinoBuilder(widget: ImageGenerationPage());

      case PageConst.textCompletionPage:
        return cupertinoBuilder(widget: TextCompletionPage());

      default:
        return cupertinoBuilder(widget: ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("error")),
      body: const Center(
        child: Text('error'),
      ),
    );
  }
}

CupertinoPageRoute cupertinoBuilder({required Widget widget}) {
  return CupertinoPageRoute(builder: (context) => widget);
}
