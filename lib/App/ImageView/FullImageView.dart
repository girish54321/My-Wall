import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:reqres_app/network/model/UnPlashResponse.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/widget/downloadButton.dart';

const style = TextStyle(color: Colors.white);

class FullImageView extends StatefulWidget {
  final UnsplashResponse? unPlashResponse;

  const FullImageView({Key? key, required this.unPlashResponse})
      : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<FullImageView>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  TapDownDetails? tapDownDetails;

  late AnimationController animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        controller.value = animation!.value;
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        child: Stack(
          children: [
            GestureDetector(
              onDoubleTapDown: ((details) => tapDownDetails = details),
              onDoubleTap: () {
                final position = tapDownDetails!.localPosition;
                const double scale = 3;
                final x = -position.dx * (scale - 1);
                final y = -position.dy * (scale - 1);
                final zoomed = Matrix4.identity()
                  ..translate(x, y)
                  ..scale(scale);
                final end =
                    controller.value.isIdentity() ? zoomed : Matrix4.identity();

                animation = Matrix4Tween(begin: controller.value, end: end)
                    .animate(CurveTween(curve: Curves.easeOut)
                        .animate(animationController));
                // controller.value = value;
                animationController.forward(from: 0);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: InteractiveViewer(
                  transformationController: controller,
                  // clipBehavior: Clip.none,
                  // panEnabled: false,
                  // scaleEnabled: false,
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                      widget.unPlashResponse?.urls?.regular ?? "",
                    ),
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Helper().goBack();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: DownloadButton(
        url: widget.unPlashResponse?.urls?.regular ?? "",
      ),
    );
  }
}
