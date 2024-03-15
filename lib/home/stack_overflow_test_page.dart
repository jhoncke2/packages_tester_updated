import 'package:flutter/material.dart';
import 'package:packages_tester_updated/globals/app_dimens.dart';
class StackOverflowTestPage extends StatefulWidget {
  const StackOverflowTestPage({Key? key}) : super(key: key);

  @override
  State<StackOverflowTestPage> createState() => _StackOverflowTestPageState();
}

class _StackOverflowTestPageState extends State<StackOverflowTestPage> {
  String gender = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom,
        decoration: BoxDecoration(
          color: AppColors.customWhite,
          border: Border.all(
            color: AppColors.customWhite,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            top: MediaQuery.of(context).size.width * 0.14,
            right: 10.0,
            bottom: MediaQuery.of(context).size.width * 0.14
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Flexible(
                    flex: 1,
                    child: IntrinsicWidth(
                      child: Text('UserName 0',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.black
                        )
                      )
                    )
                  ),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      maxLength: 50,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'UserName1',
                        contentPadding: EdgeInsets.all(8),
                        filled: true,
                        counterText: ""
                      )
                    )
                  )
                ]
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  const Flexible(
                    flex: 1,
                    child: IntrinsicWidth(
                      child: Text(
                        'Gender',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(
                              () {
                                gender = value.toString();
                              },
                            );
                          },
                        ),
                        const Text('Male'),
                        Radio(
                          value: 'Female',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(
                              () {
                                gender = value.toString();
                              },
                            );
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  const Flexible(
                    flex: 1,
                    child: IntrinsicWidth(
                      child: Text('Birthday',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      maxLength: 50,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "...",
                          contentPadding: EdgeInsets.all(8),
                          filled: true,
                          counterText: ""),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0,
                    top: 15.0,
                    bottom: 15.0,
                    right: 0.0),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Identification',
                      contentPadding: EdgeInsets.all(8),
                      filled: true,
                      counterText: ""),
                )
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.all(10.0),
                    textStyle: const TextStyle(fontSize: 15.0)
                ),
                child: const Text('Save'),
              )
            ]
          )
        )
      ),
    );
  }
}