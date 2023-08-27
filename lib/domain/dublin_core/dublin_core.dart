import 'package:webfeed/util/datetime.dart';
import 'package:webfeed/util/iterable.dart';
import 'package:xml/xml.dart';

class DublinCore {
  final String? title;
  final String? description;
  final String? creator;
  final String? subject;
  final String? publisher;
  final String? contributor;
  final DateTime? date;
  final DateTime? created;
  final DateTime? modified;
  final String? type;
  final String? format;
  final String? identifier;
  final String? source;
  final String? language;
  final String? relation;
  final String? coverage;
  final String? rights;

  DublinCore({
    this.title,
    this.description,
    this.creator,
    this.subject,
    this.publisher,
    this.contributor,
    this.date,
    this.created,
    this.modified,
    this.type,
    this.format,
    this.identifier,
    this.source,
    this.language,
    this.relation,
    this.coverage,
    this.rights,
  });

  factory DublinCore.parse(XmlElement element) {
    return DublinCore(
      title: element.findElements('dc:title').firstOrNull?.value.toString(),
      description:
          element.findElements('dc:description').firstOrNull?.value.toString(),
      creator: element.findElements('dc:creator').firstOrNull?.value.toString(),
      subject: element.findElements('dc:subject').firstOrNull?.value.toString(),
      publisher:
          element.findElements('dc:publisher').firstOrNull?.value.toString(),
      contributor:
          element.findElements('dc:contributor').firstOrNull?.value.toString(),
      date: parseDateTime(
          element.findElements('dc:date').firstOrNull?.value.toString()),
      created: parseDateTime(
          element.findElements('dc:created').firstOrNull?.value.toString()),
      modified: parseDateTime(
          element.findElements('dc:modified').firstOrNull?.value.toString()),
      type: element.findElements('dc:type').firstOrNull?.value.toString(),
      format: element.findElements('dc:format').firstOrNull?.value.toString(),
      identifier:
          element.findElements('dc:identifier').firstOrNull?.value.toString(),
      source: element.findElements('dc:source').firstOrNull?.value.toString(),
      language:
          element.findElements('dc:language').firstOrNull?.value.toString(),
      relation:
          element.findElements('dc:relation').firstOrNull?.value.toString(),
      coverage:
          element.findElements('dc:coverage').firstOrNull?.value.toString(),
      rights: element.findElements('dc:rights').firstOrNull?.value.toString(),
    );
  }
}
