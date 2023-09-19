import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/components/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView.separated(
          itemBuilder: (context, index) {
            return index == 0
                ? const Padding(
                  padding: EdgeInsets.only(top: 30, left: 60),
                  child: Row(
                    
                      children: [
                        Text(
                          'HISTÓRICO',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        )
                      ],
                    ),
                )
                : const HistoryCard();
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 30,
          ),
          itemCount: 11,
        ));
  }
}
