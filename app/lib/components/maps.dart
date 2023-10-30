import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_dispositivos_moveis/components/maps_card.dart';
import 'package:projeto_dispositivos_moveis/model/cards_model.dart';
import 'package:projeto_dispositivos_moveis/repositories/card_repository.dart';
import 'package:provider/provider.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late CardRepository cardsRepository;
  late GoogleMapController mapController;
  double lat = -25.072556;
  double long = -50.152239;
  List<String> mercados = ['Tozzeto', 'Condor', 'Max Atacadista'];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: cardsRepository.lista.isEmpty ? 150 : 250,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: cardsRepository.lista.isEmpty
                ? const Center(
                    child: Text(
                    'Nenhuma lista de compras cadastrada!',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ))
                : ListView.separated(
                    itemBuilder: (context, index) => MapsCard(
                      titulo: cardsRepository.lista[index].titulo,
                      deleteCard: () {
                        deleteCard(cardsRepository.lista[index]);
                      },
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: cardsRepository.lista.length,
                  ),
          ),
        );
      },
    );
  }

  void deleteCard(CardsModel card) {
    setState(() {
      cardsRepository.remove(card);
      Navigator.pop(context);
      mostrarAviso(context, 'Lista concluída!', true);
    });
  }

  void mostrarAviso(BuildContext context, String mensagem, bool success) {
    final snackBar = SnackBar(
      content: Center(child: Text(mensagem)),
      duration:
          const Duration(seconds: 4), // Duração da notificação em segundos
      backgroundColor: success ? Colors.green[300] : Colors.red[300],
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    cardsRepository = Provider.of<CardRepository>(context);
    var markers = {
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(-25.0739148, -50.1533899),
        infoWindow: const InfoWindow(title: 'Tozetto', snippet: '350,00'),
        onTap: () {
          showBottomSheet(context);
        },
      ),
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(-25.072164, -50.150362),
        infoWindow: const InfoWindow(title: 'Condor', snippet: '315,00'),
        onTap: () {
          showBottomSheet(context);
        },
      ),
      Marker(
        markerId: const MarkerId('3'),
        position: const LatLng(-25.069979, -50.147477),
        infoWindow: const InfoWindow(title: 'MaxAtacadista', snippet: '335,00'),
        onTap: () {
          showBottomSheet(context);
        },
      ),
    };

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            markers: markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, long),
              zoom: 17.0,
            ),
            zoomControlsEnabled: false,
          ),
        ],
      ),
    );
  }
}
