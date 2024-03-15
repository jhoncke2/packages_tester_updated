import 'package:flutter/material.dart';
import 'package:packages_tester_updated/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: 200,
                color: Colors.indigo,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.widgetsGrid]!);
                },
                child: const Text(
                  'Widgets Grid',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.cyan[600],
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.multiMethods]!);
                },
                child: const Text(
                  'Multi methods'
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.green[600],
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.generaltests]!);
                },
                child: const Text(
                  'General Tests'
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.indigoAccent,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.blocTimer]!);
                },
                child: const Text(
                  'Bloc Timer',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.deepPurple[300],
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.qr]!);
                },
                child: const Text(
                  'QR'
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.teal,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.sharing]!);
                },
                child: const Text(
                  'Sharing'
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.amber,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.vcf]!);
                },
                child: const Text(
                  'V Card'
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.orange,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.widgetsPackages]!);
                },
                child: const Text(
                  'Widgets Packages'
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.redAccent,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.pdf]!);
                },
                child: const Text(
                  'Pdf',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.pink,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.qrScanner]!);
                },
                child: const Text(
                  'QR Scanner',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.blueGrey,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.files]!);
                },
                child: const Text(
                  'Files',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.lightGreen[600],
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.calendar]!);
                },
                child: const Text(
                  'Calendario',
                  style: TextStyle(
                    color: Colors.white
                  )
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.purpleAccent,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.pusher]!);
                },
                child: const Text(
                  'Pusher',
                  style: TextStyle(
                    color: Colors.white
                  )
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.blueAccent,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.widgetsToImage]!);
                },
                child: const Text(
                  'Widgets To Image',
                  style: TextStyle(
                    color: Colors.white
                  )
                )
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.brown,
                onPressed: (){
                  Navigator.of(context).pushNamed(routesNames[NavRoute.emailSender]!);
                },
                child: const Text(
                  'Email Sender',
                  style: TextStyle(
                    color: Colors.white
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}