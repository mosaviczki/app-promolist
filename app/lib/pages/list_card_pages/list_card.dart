import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/pages/details_page.dart';

class ListCard extends StatefulWidget {
   ListCard({
    super.key,
    required this.title,
  });

  String title;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailsPages(),
          )),
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
        child:  Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
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
    );
  }
}
