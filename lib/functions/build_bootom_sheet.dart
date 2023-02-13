import 'package:flutter/material.dart';
import '../theme/colors.dart';

void buildBottomSheet(BuildContext context, currentSystolicValue,
    currentDiastolicValue, currentPulseValue, Function saveData) {
  showModalBottomSheet(
      backgroundColor: color4,
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
            builder: ((BuildContext context, setState) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 100,
                            height: 8,
                            decoration: const BoxDecoration(
                                color: color2,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      const Text(
                        'Dodaj zmierzone ciśnienie',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: color1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Skurczowe',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 18,
                              color: color1)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: SliderTheme(
                          data: SliderThemeData(
                              trackHeight: 40,
                              thumbShape: SliderComponentShape.noOverlay,
                              overlayShape: SliderComponentShape.noOverlay,
                              valueIndicatorShape:
                                  SliderComponentShape.noOverlay,
                              activeTrackColor:
                                  const Color.fromARGB(255, 228, 89, 89),
                              inactiveTrackColor:
                                  const Color.fromARGB(35, 255, 255, 255)),
                          child: Stack(
                            children: [
                              Slider(
                                min: 0,
                                max: 200,
                                divisions: 200,
                                value: currentSystolicValue,
                                onChanged: (double value) {
                                  setState(() {
                                    currentSystolicValue = value;
                                  });
                                },
                                label: currentSystolicValue.round().toString(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20.0, top: 6),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '${currentSystolicValue.round()}',
                                        style: const TextStyle(
                                            color: color1,
                                            fontSize: 18,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Rozkurczowe',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 18,
                              color: color1)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: SliderTheme(
                          data: SliderThemeData(
                              trackHeight: 40,
                              thumbShape: SliderComponentShape.noOverlay,
                              overlayShape: SliderComponentShape.noOverlay,
                              valueIndicatorShape:
                                  SliderComponentShape.noOverlay,
                              activeTrackColor:
                                  const Color.fromARGB(255, 255, 93, 93),
                              inactiveTrackColor:
                                  const Color.fromARGB(35, 255, 255, 255)),
                          child: Stack(
                            children: [
                              Slider(
                                min: 0,
                                max: 150,
                                divisions: 150,
                                value: currentDiastolicValue,
                                onChanged: (double value) {
                                  setState(() {
                                    currentDiastolicValue = value;
                                  });
                                },
                                label: currentDiastolicValue.round().toString(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20.0, top: 6),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${currentDiastolicValue.round()}',
                                        style: const TextStyle(
                                            color: color1,
                                            fontSize: 18,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Puls',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 18,
                              color: color1)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 300,
                        child: SliderTheme(
                          data: SliderThemeData(
                              trackHeight: 40,
                              thumbShape: SliderComponentShape.noOverlay,
                              overlayShape: SliderComponentShape.noOverlay,
                              valueIndicatorShape:
                                  SliderComponentShape.noOverlay,
                              activeTrackColor:
                                  const Color.fromARGB(255, 250, 212, 212),
                              inactiveTrackColor:
                                  const Color.fromARGB(35, 255, 255, 255)),
                          child: Stack(
                            children: [
                              Slider(
                                min: 0,
                                max: 200,
                                divisions: 200,
                                value: currentPulseValue,
                                onChanged: (double value) {
                                  setState(() {
                                    currentPulseValue = value;
                                  });
                                },
                                label: currentPulseValue.round().toString(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20.0, top: 6),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${currentPulseValue.round()}',
                                        style: const TextStyle(
                                            color: color1,
                                            fontSize: 18,
                                            fontFamily: 'OpenSans'),
                                      ),
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox.fromSize(
                        size: const Size(56, 56),
                        child: ClipOval(
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              splashColor: color1,
                              onTap: () {
                                saveData(currentSystolicValue,
                                    currentDiastolicValue, currentPulseValue);
                                Navigator.pop(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.add,
                                    color: color4,
                                    size: 32,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])));
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))));
}
