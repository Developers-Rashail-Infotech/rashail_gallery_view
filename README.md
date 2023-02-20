# Rashail Image Gallery

A gallery package for flutter that allows you to select show a complete gallery of images that can be opened and viewed at the same time.
Can be opearatable with the keyboard keys as well as left and right buttons of the screen.


Add to pubspec.yaml:

```yaml
dependencies:
rashail_gallery_view: latest (Check on [pub.dev](https://pub.dev/packages/rashail_gallery_view))
```


## How to use

You only need to create an instance of the RashailGallery class in the child of your Scaffold or within the widget of your choice, within the children attribute, put the list of GalleryImages.

### Import

```dart
import 'package:rashail_gallery_view/rashail_gallery_view.dart';
```

### Simple examples

Center flutter logo using all space of view port:

```dart
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
```