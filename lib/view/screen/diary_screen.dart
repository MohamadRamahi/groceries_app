import 'package:flutter/material.dart';
import 'package:groceries_app/responsive.dart';
import 'package:groceries_app/view/widget/diary_widget.dart';

class DiaryEggsScreen extends StatelessWidget {
  const DiaryEggsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children:  [
              Text('Diary and Eggs',style: TextStyle(fontSize:
              responsiveWidth(context, 20)),),
              DiaryWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
