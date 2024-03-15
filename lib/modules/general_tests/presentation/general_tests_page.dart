import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
class GeneralTestsPage extends StatelessWidget {
  const GeneralTestsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final html = Html(
      data: '''
<h1> this is a title </h1>
<p> And this is a paragraph </p>
<h2> And this is a subtitle </h2>
'''
    );
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          child: Column(
            children: [
              const Text(
                'On General Tests',
                style: TextStyle(
                  fontSize: 20
                )
              ),
              Text(
                html.data ?? 'No data',
                style: const TextStyle(
                  fontSize: 15
                )
              ),
              Text(
                html.documentElement?.innerHtml.characters.string ?? 'No document documentElement',
                style: const TextStyle(
                  fontSize: 15
                )
              ),
              Text(
                html.onlyRenderTheseTags?.toString() ?? 'No onlyRenderTheseTags',
                style: const TextStyle(
                  fontSize: 15
                )
              ),
              Text(
                html.toString(),
                style: const TextStyle(
                  fontSize: 15
                )
              )
            ]
          )
        )
      )
    );
  }
}