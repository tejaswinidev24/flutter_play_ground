import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {

  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedimage;

  Future<void> _takePicture() async{
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(imageFile == null)
    {
      return;
    }
    
    setState(() {
      _storedimage = imageFile;
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedimage!= null ? Image.file(_storedimage,
          fit: BoxFit.cover,
          width: double.infinity,
          ) 
          : Text('Image not found', textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10),
        Expanded(
          child: FlatButton.icon(
            onPressed: _takePicture, 
            icon: Icon(Icons.camera), 
            label: Text('Take a picture'),
            textColor: Theme.of(context).primaryColor,
            ),
          ),
      ],
    );
  }
}