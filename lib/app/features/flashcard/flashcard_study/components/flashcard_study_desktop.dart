import 'package:audioplayers/audioplayers.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/dimens.dart';
import 'package:fe_ezlang_flashcard/app/config/resources/styles.dart';
import 'package:fe_ezlang_flashcard/app/models/category.dart';
import 'package:fe_ezlang_flashcard/app/providers/flashcard_study_controller.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/circle_studied_dot.dart';
import 'package:fe_ezlang_flashcard/app/shared_components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:fe_ezlang_flashcard/app/utils/extensions/globalkey_ex.dart';

class FlashcardStudyDesktop extends StatefulWidget {
  CategoryModel? category;

  FlashcardStudyDesktop({Key? key, this.category}) : super(key: key);

  @override
  State<FlashcardStudyDesktop> createState() => _FlashcardStudyDesktopState();
}

class _FlashcardStudyDesktopState extends State<FlashcardStudyDesktop> {
  bool isCardOpened = false;
  double? _ratingValue;
  AudioPlayer? _audioPlayer;
  var bottom = .0, top = .0;
  var headerKey = GlobalKey(),
      bottomKey = GlobalKey(),
      overViewKey = GlobalKey();
  var panY = 0.0;
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Header(
        key: headerKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.category?.title ?? '',
            ),
            Text(
              widget.category?.description ?? '',
              style: Styles.subtitleText,
            )
          ],
        ),
      ),
      const SizedBox(
        height: Dimens.mm,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.mp),
        child: _buildOverview(),
      ),
      const SizedBox(
        height: Dimens.mm,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.mp),
        child: _buildCard(),
      ),
      const SizedBox(
        height: Dimens.mm,
      ),
      Expanded(
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: Dimens.mm, left: Dimens.mm, right: Dimens.mm),
                child: _buidControllButtons(),
              )))
    ]));
  }

  Widget _buidControllButtons() {
    return Row(
      key: bottomKey,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isCardOpened)
          _buildControllButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.white,
              ),
              backgroundColor: Color(0xFFFF763F),
              onPressed: () {
                setState(() {
                  isCardOpened = !isCardOpened;
                });
              }),
        if (isCardOpened)
          RatingBar(
              initialRating: _ratingValue ?? 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 2),
              ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.orange),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.orange,
                  ),
                  empty: const Icon(
                    Icons.star_outline,
                    color: Colors.orange,
                  )),
              onRatingUpdate: (value) {
                setState(() {
                  _ratingValue = value;
                });
              })
        else
          Container(
            height: 0,
          )
      ],
    );
  }

  Widget _buildControllButton(
      {required Icon icon,
      Color? backgroundColor,
      required VoidCallback onPressed}) {
    final controllButtom = ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        color: backgroundColor ?? Colors.white24,
        child: IconButton(
            splashRadius: 40, iconSize: 30, icon: icon, onPressed: onPressed),
      ),
    );

    return controllButtom;
  }

  Widget _buildCard() {
    var size = MediaQuery.of(context).size;

    if (top == 0 && bottom == 0) {
      size = Size(size.width, 2);
      top = 1;
      bottom = 1;
    } else {
      bottom = bottomKey.height;
      top = headerKey.height;
      top += overViewKey.height;
      top += Dimens.mm * 3;
      top += Dimens.mp * 2;
      top += MediaQuery.of(context).viewPadding.top;
    }
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [_buildCardContent(size), _buildDeck(size)],
      ),
    );
  }

  Widget _buildDeck(Size size) {
    var startPoint = 0.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 500),
        height: (size.height - top - bottom) / 2,
        width: double.infinity,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              width: double.infinity,
              height: (size.height - top - bottom) / 2 * 3 / 4,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(Dimens.lRadius),
                  image: DecorationImage(
                      image: Image.network(
                        "http://cdn.differencebetween.net/wp-content/uploads/2018/03/Difference-Between-Institute-and-University--768x520.jpg",
                        errorBuilder: (context, error, stackTrace) {
                          return Text("HELLO");
                        },
                      ).image,
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onVerticalDragStart: (details) {
                  startPoint = details.localPosition.dy;
                },
                onVerticalDragUpdate: (details) {
                  var distance = details.localPosition.dy - startPoint;
                  if (isCardOpened) {
                    if (distance < 0) {
                      if (-distance >=
                          (size.height - top - bottom) / 2 * 3 / 4) {
                        distance =
                            -1 * (size.height - top - bottom) / 2 * 3 / 4;
                      }
                      setState(() {
                        panY = distance;
                        if (distance < -(size.height - top - bottom) / 4) {
                          isCardOpened = !isCardOpened;
                          panY = 0;
                        }
                      });
                    }
                  } else {
                    if (distance > 0) {
                      if (distance > (size.height - top - bottom) / 2 * 3 / 4) {
                        distance = (size.height - top - bottom) / 2 * 3 / 4;
                      }
                      setState(() {
                        panY = distance;
                        if (distance > (size.height - top - bottom) / 4) {
                          isCardOpened = !isCardOpened;
                          panY = 0;
                        }
                      });
                    }
                  }
                },
                onVerticalDragEnd: (details) {
                  setState(() {
                    panY = 0;
                  });
                },
                child: AnimatedContainer(
                  height: isCardOpened
                      ? (size.height - top - bottom) / 2 * 1 / 4 - panY
                      : (size.height - top - bottom) / 2 - panY,
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    width: double.infinity,
                    color: Color(0xFF4F42D8),
                    child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "institute",
                                style: TextStyle(fontSize: Dimens.lts),
                              ),
                              if (!isCardOpened)
                                Text(
                                  "/ˈɪn.stə.tuːt/",
                                  style: TextStyle(fontSize: Dimens.mts),
                                ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: ClipOval(
                    child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                      splashRadius: 40,
                      icon: Icon(Icons.volume_down),
                      onPressed: () {
                        if (_audioPlayer == null) _audioPlayer = AudioPlayer();
                        _audioPlayer?.stop();

                        _audioPlayer?.play(UrlSource(
                            'https://dictionary.cambridge.org/media/english/us_pron/e/eus/eus75/eus75808.mp3'));
                      }),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardContent(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 700),
        height: isCardOpened
            ? size.height - top - bottom
            : (size.height - top - bottom) / 2 + Dimens.mp,
        width: isCardOpened ? size.width * 0.9 : size.width * 0.8,
        curve: Curves.fastOutSlowIn,
        child: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: (size.height - top - bottom) / 2,
              child: Padding(
                padding: const EdgeInsets.all(Dimens.mp),
                child: Align(
                  alignment: Alignment.center,
                  child: Scrollbar(
                    scrollbarOrientation: ScrollbarOrientation.right,
                    controller: scrollController,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "institute \n noun [ C ] \nUK  /ˈɪn.stɪ.tʃuːt/ US  /ˈɪn.stə.tuːt/ \n  B2 \n an organization where people do a particular type of scientific, educational, or social work, or the buildings that it uses: \nthe Massachusetts Institute of Technology \n ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverview() {
    return Row(
      key: overViewKey,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleStudiedDot(color: Colors.blue),
        CircleStudiedDot(color: Colors.blue),
        CircleStudiedDot(color: Colors.blue),
        CircleStudiedDot(color: Colors.blue),
        CircleStudiedDot(color: Colors.blue),
        CircleStudiedDot(color: Colors.blue),
        CircleStudiedDot(
          color: Colors.blue,
          selected: true,
        ),
        CircleStudiedDot(color: Colors.blue),
        CircleStudiedDot(color: Colors.blue),
      ],
    );
  }
}
