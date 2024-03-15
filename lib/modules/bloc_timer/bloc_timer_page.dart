// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:packages_tester_updated/modules/bloc_timer/bloc/timer_bloc.dart';

class BlocTimerPage extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  BlocTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider<TimerBloc>(
      create: (_) => TimerBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: BlocBuilder<TimerBloc, TimerState>(
              builder: (blocContext, blocState) => Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.8,
                    child: ListView.builder(
                      itemCount: blocState.items.length,
                      itemBuilder: (_, index) => Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5
                          ),
                          child: Text(
                            blocState.items[index],
                            style: const TextStyle(
                              fontSize: 15
                            )
                          ),
                        ),
                      )
                    )
                  ),
                  MaterialButton(
                    onPressed: blocState.canRemove? (){
                      BlocProvider.of<TimerBloc>(blocContext).add(RemoveLastElement());
                    } : (){},
                    child: Text(
                      blocState.secondsToRemove > 0?
                        'Podrás eliminar en ${blocState.secondsToRemove} segundos':
                        'Eliminar'
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: 'El texto a agregar'
                          )
                        )
                      ),
                      MaterialButton(
                        onPressed: (){
                          if(_textController.text.isNotEmpty){
                            BlocProvider.of<TimerBloc>(blocContext).add(AddElement(_textController.text));
                          }
                          _textController.text = '';
                        },
                        color: Colors.blueAccent,
                        child: const Text(
                          'Agregar',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    ],
                  )
        
                ]
              )
            )
          ),
        )
      )
    );
  }
}