import 'dart:io';
import 'package:flutter/material.dart';
import 'package:packages_tester_updated/globals/app_dimens.dart';
import 'package:path_provider/path_provider.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

const _imagePath = 'https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/virtual_console_nintendo_3ds_7/SI_3DSVC_SuperMarioBros_image1600w.jpg';

class WidgetsToImagePage extends StatefulWidget {
  
  const WidgetsToImagePage({Key? key}) : super(key: key);

  @override
  State<WidgetsToImagePage> createState() => _WidgetsToImagePageState();
}

class _WidgetsToImagePageState extends State<WidgetsToImagePage> {
  late WidgetsToImageController _imageController;
  File? image;
  @override
  void initState() {
    _imageController = WidgetsToImageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = AppDimens();
    return Scaffold(
      body: image == null?
        SafeArea(
          child: SizedBox(
            width: dimens.getWidthPercentage(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetsToImage(
                  controller: _imageController,
                  child: Container(
                    width: dimens.getWidthPercentage(0.9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueAccent
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: dimens.getWidthPercentage(0.05)
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          _imagePath,
                          width: dimens.getWidthPercentage(0.8),
                          fit: BoxFit.fitWidth
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: SizedBox(
                            width: dimens.getWidthPercentage(0.75),
                            child: const Text(
                              'El hijo de Rana, Rin Rin Renacuajo, salió esta mañana muy tieso y muy majo\ncon pantalón corto, corbata a la moda\nsombrero encintado y chupa de bodas',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white
                              )
                            )
                          )
                        )
                      ]
                    )
                  )
                ),
                MaterialButton(
                  onPressed: ()async{
                    final bytes = await _imageController.capture();
                    final tempDir = await getTemporaryDirectory();
                    image = await File('${tempDir.path}/image.png').create();
                    await image!.writeAsBytes(bytes!);
                    setState((){
                      
                    });
                  },
                  color: Colors.green,
                  child: const Text(
                    'Generar Imágen',
                    style: TextStyle(
                      color: Colors.white
                    )
                  )
                )
              ]
            ),
          ),
        ): SizedBox(
          width: dimens.getWidthPercentage(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(
                image!,
                width: dimens.getWidthPercentage(0.75),
                fit: BoxFit.fitWidth
              ),
              MaterialButton(
                onPressed: (){
                  setState((){
                    image = null;
                  });
                },
                color: Colors.green,
                child: const Text(
                  'Reiniciar',
                  style: TextStyle(
                    color: Colors.white
                  )
                )
              )
            ]
          ),
        )

    );
  }
}