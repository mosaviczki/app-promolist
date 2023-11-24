// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_dispositivos_moveis/pages/profile_pages/profile_page.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key, required this.nome, required this.email});
  final String nome, email;
  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  XFile? fotoPerfil;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = false;
  bool uploading = false;
  double total = 0;
  User? usuario = FirebaseAuth.instance.currentUser;

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) setState(() => fotoPerfil = image);
    return image;
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String ref =
          'images/${usuario!.uid}/img-${DateTime.now().toString()}.jpg';
      return storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload');
    }
  }

  pickAndUploadImage() async {
    if (fotoPerfil != null) {
      UploadTask task = await upload(fotoPerfil!.path);
      atualizaPerfil();
      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            uploading = true;
            total = (snapshot.bytesTransferred / snapshot.totalBytes * 100);
          });
        } else if (snapshot.state == TaskState.success) {
          arquivos.add(await snapshot.ref.getDownloadURL());
          refs.add(snapshot.ref);
          setState(() => uploading = false);
        }
      });
    }
  }

  atualizaPerfil() async {
    refs = (await storage.ref('images/${usuario!.uid}').listAll()).items;
    final arquivo = await refs[0].getDownloadURL();
    await usuario!.updatePhotoURL(arquivo);
    await usuario!.reload();
  }

  loadImages() async {
    refs = (await storage.ref('images').listAll()).items;
    for (var ref in refs) {
      final arquivo = await ref.getDownloadURL();
      arquivos.add(arquivo);
    }
    setState(() => loading = false);
  }

  deleteImage(int index) async {
    await storage.ref(refs[index].fullPath).delete();
    arquivos.removeAt(index);
    refs.removeAt(index);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        forceMaterialTransparency: true,
      ),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Configurações do perfil',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  fotoPerfil != null
                      ? GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: SizedBox(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      Image.file(File(fotoPerfil!.path!))
                                          .image)),
                        )
                      : usuario?.photoURL == null
                          ? GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: const CircleAvatar(
                                  radius: 50,
                                  child: Icon(
                                    Icons.person,
                                    size: 90,
                                  ),
                                ),
                              ))
                          : SizedBox(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      Image.network(usuario!.photoURL!).image)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(widget.nome),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(widget.email),
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      pickAndUploadImage();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text('Salvar alterações')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
