import 'package:webfeed/util/iterable.dart';
import 'package:xml/xml.dart';

class Scene {
  final String? title;
  final String? description;
  final String? startTime;
  final String? endTime;

  Scene({
    this.title,
    this.description,
    this.startTime,
    this.endTime,
  });

  factory Scene.parse(XmlElement element) {
    return Scene(
      title: element.findElements('sceneTitle').firstOrNull?.innerText,
      description: element
          .findElements('sceneDescription')
          .firstOrNull
          ?.innerText
          .toString(),
      startTime: element.findElements('sceneStartTime').firstOrNull?.innerText,
      endTime: element.findElements('sceneEndTime').firstOrNull?.innerText,
    );
  }
}
