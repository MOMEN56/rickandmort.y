import 'package:flutter/material.dart';
import 'package:rickandmorty/app_router.dart';
void main() {
  runApp(Rickandmorty(appRouter: AppRouter(),));
}

class Rickandmorty extends StatelessWidget {
  final AppRouter appRouter;
  const Rickandmorty({super.key,required this.appRouter,});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
