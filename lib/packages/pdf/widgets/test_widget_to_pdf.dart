import 'package:flutter/material.dart';
import 'package:packages_tester_updated/globals/app_dimens.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimens = AppDimens();
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: dimens.getWidthPercentage(1),
            height: dimens.getHeightPercentage(0.30),
            decoration: const BoxDecoration(
              color: AppColors.primary
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  'https://i.pinimg.com/736x/d4/21/7f/d4217f94e671a5ae4bda65d62ee97106.jpg',
                  height: dimens.getHeightPercentage(0.30),
                  width:  dimens.getWidthPercentage(1),
                  fit: BoxFit.fill,
                )
              ]
            )
          ),
        ),
        const CardDetailBody()
      ],
    );
  }
}



class CardDetailBody extends StatelessWidget {
  const CardDetailBody({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimens = AppDimens();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15
      ),
      child: SizedBox(
        height: dimens.getHeightPercentage(0.85),
        width: dimens.getHeightPercentage(1),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: dimens.getHeightPercentage(0.30) - (dimens.getHeightPercentage(0.140) / 2)
              ),
              ClipOval(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/5/59/The_look_of_John_Wick_from_the_movie.jpg',
                  height: dimens.getHeightPercentage(0.140),
                  width:  dimens.getHeightPercentage(0.140),
                  fit: BoxFit.fill,
                  errorBuilder: (_, __, ___) => SizedBox(
                    height: dimens.getHeightPercentage(0.14),
                  ),
                )
              ),
              const Text(
                'Carmelo Guayabero',
                style: TextStyle( 
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color:AppColors.primary
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: dimens.getWidthPercentage(0.54),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: dimens.getWidthPercentage(0.54),
                          child: const Text(
                            'Bogotá',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left, 
                            style: TextStyle( 
                              fontSize: 15, fontWeight: FontWeight.bold, color:  AppColors.secondary
                            )
                          ),
                        ),
                        const Text(
                          'Ecomoda',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left, 
                          style: TextStyle( 
                            fontSize: 15, color: AppColors.secondary
                          )
                        ),
                        Visibility(
                          visible:true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/png/icono_claro.png', width: dimens.getWidthPercentage(0.03)),
                              SizedBox(width: dimens.getWidthPercentage(0.02)),
                              SizedBox(
                                width: dimens.getWidthPercentage(0.54 - 0.02 - 0.03),
                                child: const Text(
                                  'Bogotá',
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left, 
                                  style: TextStyle( 
                                    fontSize: 15, color: AppColors.secondary
                                  )
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 9),
                        const Text(
                          'Contacto Personal',  
                          style: TextStyle( 
                            fontSize: 18, fontWeight: FontWeight.bold, color:AppColors.primary
                          )
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/png/icono_telefono.png', width: 10),
                              const SizedBox(width: 5),
                            const Text(
                              '3124564849',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left, 
                              style: TextStyle( 
                                fontSize: 15,
                                color: AppColors.secondary
                              )
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Image.asset('assets/png/icono_email.png', width: 10),
                            const SizedBox(width: 5),
                            const Text(
                              'email@email.com',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left, 
                              style: TextStyle( 
                                fontSize: 15, color:  AppColors.secondary
                              )
                            )
                          ]
                        ),
                          const SizedBox(height: 10),
                        Row(
                          children: [
                            if(true)
                              Image.asset('assets/png/linkedin_personal.png', width: 20),
                            const SizedBox( width: 9),
                            if(true)
                              Image.asset('assets/png/instagram_personal.png', width: 20),
                            const SizedBox( width: 8),
                            if(true)
                              Image.asset('assets/png/youtube_personal.png', width: 20),
                            const SizedBox( width: 8),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Contacto Corporativo', 
                          style: TextStyle( 
                            fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary,
                          )
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Image.asset('assets/png/icono_telefono.png', width: 10),
                            const SizedBox(width: 5),
                            const Text(
                              '3201561519',
                              textAlign: TextAlign.left, 
                              style: TextStyle( 
                                fontSize: 15, color: AppColors.secondary
                              )
                            )
                          ]
                        ),
                        Row(
                          children: [
                            Image.asset('assets/png/icono_email.png', width: 10),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: dimens.getWidthPercentage(0.453),
                              child: const Text(
                                'corporate_email@email.com',
                                textAlign: TextAlign.left, 
                                style: TextStyle( 
                                  fontSize: 15, color: AppColors.secondary
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/png/icono_oscuro.png', width: 10),
                            const SizedBox(width: 5),
                            const Text(
                              'Av. Circunvalar # 22 - 3' ,
                              textAlign: TextAlign.left, 
                              style: TextStyle( 
                                fontSize: 15, color: AppColors.secondary
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      (true)? 
                        SizedBox(
                          height: dimens.getWidthPercentage(0.35),
                          width: dimens.getWidthPercentage(0.35),
                          child: Center(
                            child: Image(
                              height: dimens.getWidthPercentage(0.15),
                              width: dimens.getWidthPercentage(0.15),
                              image: const NetworkImage('https://static.vecteezy.com/system/resources/previews/024/693/425/original/kfc-logo-transparent-free-png.png')
                            ),
                          )
                        ): Container(),
                      GestureDetector(
                        onTap: (){

                        },
                        child: ZoomQr(
                          dimens: dimens,
                          size: dimens.getWidthPercentage(0.35)
                        )
                      ),
                    ]
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(true)
                    Image.asset('assets/png/boton_linkedin.png', width: 60),
                  if(true)
                    Image.asset('assets/png/boton_facebook.png', width: 60),
                  if(true)
                    Image.asset('assets/png/boton_instagram.png',width: 60),
                  if(true)
                    Image.asset('assets/png/boton_youtube.png',  width: 60),
                  if(true)
                    Image.asset('assets/png/boton_web.png', width: 60)
                ],
              ),
              const SizedBox(height: 10),
              //bottomOption,
              const Center(
                child: Image(
                  image: AssetImage('assets/png/logo_paginas.png'),
                  width: 90,
                  color: Color(0xff666666),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

class ZoomQr extends StatelessWidget {
  final double size;
  final AppDimens dimens;
  const ZoomQr({
    super.key,
    required this.size,
    required this.dimens,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.15),
      child: Container(

      ),
    );
  }
}
