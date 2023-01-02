import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/cubit/theme_cubit.dart';

import 'posts/posts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current theme
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    bool currentTheme = brightness == Brightness.dark;

    return BlocBuilder<ThemeCubit, bool?>(
      builder: (context, state) {
        context.read<ThemeCubit>().onThemeChange();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const PostsPage(),
          theme: (state ?? currentTheme)
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
        );
      },
    );
  }
}
