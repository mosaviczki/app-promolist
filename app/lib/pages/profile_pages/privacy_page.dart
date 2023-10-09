import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        forceMaterialTransparency: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          children: [
            Text(
              'Política e Privacidade',
              style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse suscipit auctor lobortis. Etiam non lacus dignissim ante imperdiet gravida eu at risus. Aliquam non tristique dui. Vestibulum nec maximus diam, sed scelerisque massa. Vivamus vitae tellus placerat, bibendum quam molestie, imperdiet lorem. Pellentesque sed felis a ipsum laoreet placerat. Duis rhoncus a felis nec sodales. Morbi accumsan dui lectus, ut consectetur eros euismod sit amet. Aliquam nisl odiovenenatis mi semper. Etiam sagittis neque ut metus imperdiet varius. Aenean eget dignissim arcu. Praesent eros turpis, hendrerit in consectetur at, dictum a tellus. Mauris nisl eros, ultrices sed varius id, venenatis in lorem. Etiam posuere eros in luctus ultricies. Ut ac ligula elit. Quisque a erat euismod, cursus est quis, scelerisque ante. Pellentesque enim urna, lobortis vel lacus ut, faucibus tincidunt arcu. Vivamus quis ipsum in nunc sollicitudin suscipit eget sit amet neque. Vestibulum ut euismod libero. In fringilla a orci vitae interdum. Fusce in tincidunt augue, ac vehicula arcu.', style: TextStyle(height: 1.5, fontFamily: 'Poppins'),),
          ],
        ),
      ),
    );
  }
}
