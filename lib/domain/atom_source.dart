import 'package:webfeed/util/iterable.dart';
import 'package:xml/xml.dart';

class AtomSource {
  final String? id;
  final String? title;
  final String? updated;

  AtomSource({
    this.id,
    this.title,
    this.updated,
  });

  factory AtomSource.parse(XmlElement element) {
    return AtomSource(
      id: element.findElements('id').firstOrNull?.value.toString(),
      title: element.findElements('title').firstOrNull?.value.toString(),
      updated: element.findElements('updated').firstOrNull?.value.toString(),
    );
  }
}
