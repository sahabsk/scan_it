import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:path/path.dart';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


class AddFace extends StatefulWidget {
  @override
  _AddFaceState createState() => _AddFaceState();
}

class _AddFaceState extends State<AddFace> {
  GlobalKey _globalKey = GlobalKey();
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    final savedPath = await ImageGallerySaver.saveFile(pickedFile.path);
    print(savedPath);
    // if(pickedFile != null){
    //   await Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(),))
    // }

    setState(() {
      if(pickedFile != null) {
        _image = File(pickedFile.path);
        // _image = File(savedPath.filepath);
      } else
        {
          print("No Image is selected");
        }
      // _image = pickedFile as File;
      // if (pickedFile != null) {
      //   _image = File(savedPath.filePath);
      // } else {
      //   print('No image selected.');
      // }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Capture'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage ,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );


  }

}

