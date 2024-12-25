// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'bloc/task_bloc/task_bloc.dart';
// import 'view/task_screen.dart';
//
// void main() {
//   runApp(const TaskApp());
// }
//
// class TaskApp extends StatelessWidget {
//   const TaskApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Task Manager',
//       home: BlocProvider(
//         create: (context) => TaskBloc(),
//         child: TaskScreen(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/task_bloc/task_bloc.dart';
import 'view/task_screen.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      home: BlocProvider(
        create: (context) => TaskBloc(),
        child: TaskScreen(),
      ),
    );
  }
}
