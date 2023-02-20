import 'package:flutter/material.dart';
import 'package:rashail_gallery_view/rashail_gallery_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rashail Image Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Rashail Image Gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RashailGallery(galleryImages: [
          GalleryImages(
            imageId: 0,
            imageData: Image.asset(
              "assets/images/image1.jpg",
            ),
            imageName: "Image 1",
          ),
          GalleryImages(
            imageId: 1,
            imageData: Image.asset(
              "assets/images/image2.jpg",
            ),
            imageName: "Image 2",
          ),
          GalleryImages(
            imageId: 2,
            imageData: Image.asset(
              "assets/images/image3.jpg",
            ),
            imageName: "Image 3",
          ),
          GalleryImages(
            imageId: 3,
            imageData: Image.asset(
              "assets/images/image4.jpg",
            ),
            imageName: "Image 4",
          ),
        ], fetchingImages: false, galleryThemeColor: Colors.purple),
      ),
    );
  }
}
