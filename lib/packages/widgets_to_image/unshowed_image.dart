import 'package:flutter/material.dart';
import 'package:packages_tester_updated/globals/app_dimens.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
class UnshowedImage extends StatelessWidget {
  final WidgetsToImageController controller;
  const UnshowedImage({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimens = AppDimens();
    return WidgetsToImage(
      controller: controller,
      child: Stack(
        children: [
          Image.network(
            'https://static.wikia.nocookie.net/villano/images/6/62/Bowser.jpg/revision/latest?cb=20200725225550&path-prefix=es',
            width: dimens.getWidthPercentage(0.7),
            fit: BoxFit.fitWidth
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: SizedBox(
              width: dimens.getWidthPercentage(0.75),
              child: const Text(
                'Parangaricutirimicuaro\nesternocleidomastoideo\nácido desoxirribonucleico',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black
                )
              )
            )
          ),
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.delete,
              color: Colors.redAccent,
            )
          )
        ]
      ),
    );
  }
}