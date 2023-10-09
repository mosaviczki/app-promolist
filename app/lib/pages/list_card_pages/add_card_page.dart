import 'package:flutter/material.dart';
import 'package:projeto_dispositivos_moveis/model/cards_model.dart';
import 'package:projeto_dispositivos_moveis/model/item_model.dart';
import 'package:projeto_dispositivos_moveis/repositories/card_repository.dart';
import 'package:provider/provider.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  late CardRepository cardsRepository;
  final _titleController = TextEditingController();
  final _itemController = TextEditingController();
  final _quantityController = TextEditingController(text: '1');
  List<ItemModel> listaItens = [];

  void incrementValue() {
    int currentValue = int.tryParse(_quantityController.text) ?? 1;
    currentValue++;
    _quantityController.text = currentValue.toString();
  }

  void decrementValue() {
    int currentValue = int.tryParse(_quantityController.text) ?? 1;
    if (currentValue != 1) {
      currentValue--;
      _quantityController.text = currentValue.toString();
    }
  }

  void saveCard() {
    setState(() {
      List<CardsModel> listaCards = [
        CardsModel(
          id: 12,
          titulo: _titleController.text,
          listaItens: listaItens,
        ),
      ];
      cardsRepository.saveAll(listaCards);
      limpaLista();
      print(cardsRepository.lista.length);
    });
  }

  void limpaLista() {
    setState(() {
      listaItens = [];
      _quantityController.text = '1';
      _titleController.clear();
      _itemController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    cardsRepository = Provider.of<CardRepository>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            const Text('Adicionar Lista'),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Titulo para a compra',
              ),
              validator: (value) {
                if (value != null) {
                  return value.isEmpty ? 'Por favor, insira um titulo!' : null;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 230,
                  child: TextFormField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      labelText: 'Adicione um item',
                    ),
                    validator: (value) {
                      if (value != null) {
                        return value.isEmpty
                            ? 'Por favor, insira um item!'
                            : null;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () => {
                          setState(
                            () {
                              incrementValue();
                            },
                          )
                        },
                    icon: const Icon(Icons.add)),
                Text(_quantityController.text),
                IconButton(
                  onPressed: () {
                    setState(() {
                      decrementValue();
                      print(_quantityController.text);
                    });
                  },
                  icon: const Icon(Icons.remove),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                child: const Text('Adicionar item'),
                onPressed: () => {
                  setState(
                    () {
                      listaItens.add(
                        ItemModel(
                          nome: _itemController.text,
                          quantidade: int.parse(_quantityController.text),
                        ),
                      );
                      _itemController.clear();
                      _quantityController.text = '1';
                    },
                  )
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 180,
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    visualDensity: const VisualDensity(vertical: -3),
                    leading: const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Icon(
                        Icons.circle,
                        size: 15,
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(listaItens[index].nome),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(listaItens[index].quantidade.toString()),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          listaItens.remove(listaItens[index]);
                        });
                      },
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: listaItens.length,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            listaItens.isNotEmpty ? 
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: const Text('Salvar Lista'),
                onPressed: () => saveCard(),
              ),
            )
            : SizedBox(),
          ],
        ),
      ),
    );
  }
}
