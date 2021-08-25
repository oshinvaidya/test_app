import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailScreen extends StatefulWidget {
 final imageUrl;

  const DetailScreen({Key? key, this.imageUrl}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: PhotoView(
                imageProvider:
                NetworkImage(widget.imageUrl)
              /// Image.network(photosList[index].url.toString())
            )
        ),
      ),
    );
  }
}
