import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:packages_tester_updated/modules/multi_methods/domain/use_cases/method_usecase_iml.dart';
import 'package:packages_tester_updated/modules/multi_methods/presentation/bloc/multi_methods_bloc.dart';

class MultiMethodsPage extends StatelessWidget {
  const MultiMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext _) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<MultiMethodsBloc>(
        create: (_) => _initializeBloc(),
        child: SafeArea(
          child: BlocBuilder<MultiMethodsBloc, MultiMethodsState>(
            builder: (context, state){
              final screenWidth = MediaQuery.of(context).size.width;
              _managePostFrameCallbackMethods(context, state);
              if(state is OnCreatingMethods){
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100]
                      ),
                    ),
                    MaterialButton(
                      child: const Text('Agregar método'),
                      color: Colors.amber[400],
                      onPressed: (){
                        BlocProvider.of<MultiMethodsBloc>(context).add(AddMethodEvent());
                      },
                    ),
                    MaterialButton(
                      child: const Text('Mirar transacciones'),
                      color: Colors.lightGreenAccent[200],
                      onPressed: (){
                        BlocProvider.of<MultiMethodsBloc>(context).add(EndMethodsTransactionEvent());
                      },
                    )
                  ],
                );
              }else if(state is OnShowingMethods){
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100]
                      ),
                      child: Column(
                        children: state.transactions.map(
                          (transaction){
                            final finishedEntities = transaction.where((e) => e.finished).length;
                            final finishedEntitiesWidth = finishedEntities / transaction.length;
                            if(transaction.isNotEmpty){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 15,
                                    width: screenWidth * 0.5 * finishedEntitiesWidth,
                                    color: Colors.blue[200],
                                  ),
                                  Container(
                                    height: 15,
                                    width: screenWidth * 0.5 * (1 - finishedEntitiesWidth),
                                    color: Colors.blueGrey[200],
                                  ),
                                  Text(
                                    '$finishedEntities/${transaction.length}'
                                  )
                                ],
                              );
                            }else{
                              return Container();
                            }
                          }
                        ).toList(),
                      ),
                    ),
                    MaterialButton(
                      child: const Text('Iniciar transacción'),
                      color: Colors.deepOrange[300],
                      onPressed: (){
                        BlocProvider.of<MultiMethodsBloc>(context).add(InitMethodsTransactionEvent());
                      },
                    ),
                  ],
                );
              }else{
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  MultiMethodsBloc _initializeBloc(){
    final random = Random();
    final methodUseCase = MethodUseCaseImpl(random: random);
    return MultiMethodsBloc(method: methodUseCase, random: random);
  }

  void _managePostFrameCallbackMethods(BuildContext context, MultiMethodsState state){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(state is MultiMethodsInitial){
        BlocProvider.of<MultiMethodsBloc>(context).add(InitMethodsTransactionEvent());
      }
    });
  }
}
