// ignore_for_file: body_might_complete_normally_nullable

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rashail_gallery_view/src/controller/controller.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'constants/colors.dart';
import 'constants/screen_size.dart';

class GalleryImages {
  GalleryImages({
    required this.imageId,
    required this.imageName,
    required this.imageData,
  });

  final int imageId;
  final String imageName;
  final Image imageData;
}

class RashailGallery extends StatefulWidget {
  const RashailGallery({
    super.key,
    required this.galleryImages,
    required this.fetchingImages,
    required this.galleryThemeColor,
  });
  final List<GalleryImages> galleryImages;
  final bool fetchingImages;
  final Color galleryThemeColor;

  @override
  State<RashailGallery> createState() => _RashailGalleryState();
}

class ForwardIntent extends Intent {}

class BackwardIntent extends Intent {}

class _RashailGalleryState extends State<RashailGallery> {
  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return SizedBox(
      height: screenHeight(context),
      width: screenWidth(context),
      child: widget.fetchingImages
          ? Center(
              child: CircularProgressIndicator(
                color: widget.galleryThemeColor,
              ),
            )
          : widget.galleryImages.isEmpty
              ? const Center(
                  child: Text("No Images Found"),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: (screenHeight(context) / 3) - 15,
                    mainAxisExtent: (screenWidth(context) / 7) - 15,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: widget.galleryImages.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: SimpleShadow(
                      child: GestureDetector(
                        onTap: () {
                          controller.updateCurrentIndex(
                              widget.galleryImages[index].imageId);
                          showDialog(
                            context: context,
                            builder: (context) => Blur(
                              blur: 3,
                              blurColor: blackColor,
                              overlay: AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: transparentColor,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.galleryImages[index].imageName,
                                      style: const TextStyle(
                                        color: whiteColor,
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      minWidth: 30,
                                      height: 30,
                                      elevation: 0,
                                      hoverElevation: 0,
                                      hoverColor: whiteColor.withOpacity(0.1),
                                      padding: const EdgeInsets.all(20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        side: const BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                      color: transparentColor,
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                content: Obx(
                                  () => Shortcuts(
                                    shortcuts: {
                                      LogicalKeySet(
                                              LogicalKeyboardKey.arrowRight):
                                          ForwardIntent(),
                                      LogicalKeySet(
                                              LogicalKeyboardKey.arrowLeft):
                                          BackwardIntent(),
                                    },
                                    child: Actions(
                                      actions: {
                                        ForwardIntent:
                                            CallbackAction<ForwardIntent>(
                                                onInvoke: (intent) {
                                          if (controller.currentImage.value <
                                              widget.galleryImages.length - 1) {
                                            int l =
                                                controller.currentImage.value;
                                            controller
                                                .updateCurrentIndex(l + 1);
                                          } else {
                                            return;
                                          }
                                        }),
                                        BackwardIntent:
                                            CallbackAction<BackwardIntent>(
                                                onInvoke: (intent) {
                                          if (controller.currentImage.value >
                                              0) {
                                            int l =
                                                controller.currentImage.value;
                                            controller
                                                .updateCurrentIndex(l - 1);
                                          } else {
                                            return;
                                          }
                                        }),
                                      },
                                      child: Focus(
                                        autofocus: true,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 0,
                                              child: MaterialButton(
                                                color: transparentColor,
                                                hoverElevation: 0,
                                                textColor: whiteColor,
                                                hoverColor: whiteColor
                                                    .withOpacity(0.05),
                                                height:
                                                    screenHeight(context) - 100,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    50,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  if (controller
                                                          .currentImage.value >
                                                      0) {
                                                    int l = controller
                                                        .currentImage.value;
                                                    controller
                                                        .updateCurrentIndex(
                                                            l - 1);
                                                  }
                                                },
                                                child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Icon(
                                                    Icons
                                                        .arrow_back_ios_new_rounded,
                                                    size:
                                                        textSize(context) + 40,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                color: transparentColor,
                                                height:
                                                    screenHeight(context) - 200,
                                                width: screenWidth(context),
                                                child: widget
                                                    .galleryImages[controller
                                                        .currentImage.value]
                                                    .imageData,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 0,
                                              child: MaterialButton(
                                                height:
                                                    screenHeight(context) - 100,
                                                color: transparentColor,
                                                elevation: 0,
                                                hoverElevation: 0,
                                                textColor: whiteColor,
                                                hoverColor: whiteColor
                                                    .withOpacity(0.05),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    50,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  if (controller
                                                          .currentImage.value <
                                                      widget.galleryImages
                                                              .length -
                                                          1) {
                                                    int l = controller
                                                        .currentImage.value;
                                                    controller
                                                        .updateCurrentIndex(
                                                            l + 1);
                                                  }
                                                },
                                                child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size:
                                                        textSize(context) + 40,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                width: screenWidth(context),
                                height: screenHeight(context),
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Center(
                                child: widget.galleryImages[index].imageData,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: (screenHeight(context) / 3) - 15,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  color: blackColor,
                                ),
                                child: ListTile(
                                  minLeadingWidth: 20,
                                  leading: const Icon(
                                    Icons.image,
                                    color: whiteColor,
                                  ),
                                  title: Text(
                                    widget.galleryImages[index].imageName,
                                    style: const TextStyle(
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
