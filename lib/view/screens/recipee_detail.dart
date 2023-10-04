

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:video_player/video_player.dart';

import '../../colors/colors.dart';

class RecipeDetail extends StatefulWidget {
  String video;
  String name;
  String calories;
  String fat;
  String protein;
  String carbohydrates;
  String cholesterol;
  RecipeDetail(
      {super.key,
        required this.video,
        required this.name,
        required this.calories,
        required this.fat,
        required this.protein,
        required this.carbohydrates,
        required this.cholesterol});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.network(widget.video);
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(widget.name),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                Stack(children: [
                  AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                  Positioned(
                    bottom: 10,
                    left: MediaQuery.of(context).size.width / 2.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (controller.value.isPlaying) {
                                controller.pause();
                              } else {
                                controller.play();
                              }
                              setState(() {});
                            },
                            icon: Icon(controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow)),
                        IconButton(
                            onPressed: () {
                              controller.seekTo(const Duration(seconds: 0));

                              setState(() {});
                            },
                            icon: const Icon(MaterialIcons.stop))
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.timer,
                      color: ColorsField.greyColor,
                      size: 30,
                    ),
                    Text("Prep-\t" +
                        "${controller.value.duration.inMinutes}" +
                        "\tmin"),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FontAwesome5Solid.fire,
                      color: ColorsField.greyColor,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Calories\t" + widget.calories),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView(
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Protein\t${widget.protein}'),
                                  const Icon(Icons.health_and_safety),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Calories\t${widget.calories}'),
                                  const Icon(Icons.local_fire_department),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Fat\t${widget.fat}'),
                                  const Icon(Icons.sick),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Calestrol\t${widget.cholesterol}'),
                                  const Icon(Icons.psychology_sharp),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('CarboHydrates\t${widget.carbohydrates}'),
                                  const Icon(Icons.accessible_sharp),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        ));
  }}