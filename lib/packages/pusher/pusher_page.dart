import 'package:flutter/material.dart';
import 'package:packages_tester_updated/packages/pusher/widgets/pusher_view.dart';

class PusherPage extends StatefulWidget {
  const PusherPage({Key? key}) : super(key: key);

  @override
  State<PusherPage> createState() => _PusherPageState();
}

class _PusherPageState extends State<PusherPage> {
  late int navIndex;
  @override
  void initState() {
    navIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                MaterialButton(
                  onPressed: (){
                    if(navIndex != 0){
                      setState(() {
                        navIndex = 0;
                      });
                    }
                  },
                  color: navIndex == 0?
                    Colors.blueAccent:
                    Colors.transparent,
                  child: Text(
                    'Pusher',
                    style: TextStyle(
                      color: navIndex == 0?
                        Colors.white:
                        Colors.black
                    )
                  )
                ),
                MaterialButton(
                  onPressed: (){
                    if(navIndex != 1){
                      setState(() {
                        navIndex = 1;
                      });
                    }
                  },
                  color: navIndex == 1?
                    Colors.blueAccent:
                    Colors.transparent,
                  child: Text(
                    'Otro',
                    style: TextStyle(
                      color: navIndex == 1?
                        Colors.white:
                        Colors.black
                    )
                  )
                )
              ]
            ),
            Expanded(
              child: IndexedStack(
                index: navIndex,
                children: [
                  PusherView(),
                  Container()
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}