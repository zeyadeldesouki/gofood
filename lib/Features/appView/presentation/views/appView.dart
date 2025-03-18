import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gofood/Core/appRouting.dart';
import 'package:gofood/Features/appView/presentation/views/applogo.dart';

class appView extends StatefulWidget {
  const appView({super.key});

  @override
  State<appView> createState() => _appViewState();
}

class _appViewState extends State<appView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRoutes.ksplash);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const Applogo());
  }
}
