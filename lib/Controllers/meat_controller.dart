import 'package:flutter/cupertino.dart';
import 'package:hiyayakko/Modeles/get_all_in_ref.dart';
import 'package:flutter/material.dart';
import '../Views/meat_page.dart';

class MeatController  extends StatelessWidget{
  @override
  Widget build(BuildContext context, ) {
    return FutureBuilder(
        future: getAllInRef(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Theme(
                        data: ThemeData(primarySwatch: Colors.brown),
                        child: const CircularProgressIndicator(backgroundColor: Colors.lightGreen),
                      )
                    ],
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('エラーが発生しました'));
          } else {
            return MeatPage(inRef: snapshot.data!);
          }

          // if (snapshot.connectionState == ConnectionState.done) {
          //   if (snapshot.hasError) {
          //     return Center(child: Text('エラーが発生しました'));
          //   }
          //   if (!snapshot.hasData) {
          //     return Center(child: Text("データが見つかりません"));
          //   }
          //   return MeatPage(inRef: snapshot.data!);
          // }else{
          //   return const CircularProgressIndicator();
          // }
        }
    );
  }
}