import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/pages/details_page.dart';


class ListCard extends StatefulWidget {
  const ListCard({super.key, required this.cardKey});

  final String cardKey;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ignore: avoid_print
      onLongPress: () => print(widget.cardKey),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPages(cardKey: widget.cardKey),
          )),
      child: Hero(
        tag: widget.cardKey,
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            color: Colors.blue[400],
            border: Border.all(
              width: 0.8,
              color: Colors.blue,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'testeeeeeeeee${widget.cardKey}eeeeeeee',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

