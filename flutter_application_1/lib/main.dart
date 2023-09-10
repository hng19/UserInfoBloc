import 'package:flutter/material.dart';
import 'package:flutter_application_1/user_info_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      showSemanticsDebugger: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _UserInforScreenState(),
    );
  }
}

class _UserInforScreenState extends StatefulWidget {
  const _UserInforScreenState({super.key});

  @override
  State<_UserInforScreenState> createState() => __UserInforScreenStateState();
}

class __UserInforScreenStateState extends State<_UserInforScreenState> {
  UserInfoBloc _bloc = UserInfoBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: StreamBuilder<int>(
                      initialData: 0,
                      stream: _bloc.likeStream,
                      builder: (context, snapshot) {
                        return Text('${snapshot.data} likes');
                      }),
                ),
              ),
              Expanded(
                child: Center(
                  child: StreamBuilder<int>(
                      initialData: 0,
                      stream: _bloc.commentStream,
                      builder: (context, snapshot) {
                        return Text('${snapshot.data} comments');
                      }),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: _bloc.increaseLike,
                  child: Text('Like'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: _bloc.increaseComments,
                  child: Text('Comment'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
