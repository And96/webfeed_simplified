import 'dart:core';

//import 'package:webfeed/domain/dublin_core/dublin_core.dart';
//import 'package:webfeed/domain/itunes/itunes.dart';
//import 'package:webfeed/domain/rss_category.dart';
//import 'package:webfeed/domain/rss_cloud.dart';
//import 'package:webfeed/domain/rss_image.dart';
import 'package:webfeed/domain/rss_item.dart';
//import 'package:webfeed/domain/syndication/syndication.dart';
import 'package:webfeed/util/iterable.dart';
import 'package:xml/xml.dart';

class RssFeed {
  final String? title;
  //final String? author;
  final String? description;
  final String? link;
  final List<RssItem>? items;

  //final RssImage? image;
  //final RssCloud? cloud;
  //final List<RssCategory>? categories;
  //final List<String>? skipDays;
  //final List<int>? skipHours;
  final String? lastBuildDate;
  final String? language;
  /*final String? generator;
  final String? copyright;
  final String? docs;
  final String? managingEditor;
  final String? rating;
  final String? webMaster;
  final int? ttl;
  final DublinCore? dc;
  final Itunes? itunes;
  final Syndication? syndication;*/

  RssFeed({
    this.title,
    //this.author,
    this.description,
    this.link,
    this.items,
    //this.image,
    //this.cloud,
    //this.categories,
    //this.skipDays,
    //this.skipHours,
    this.lastBuildDate,
    this.language,
    /*this.generator,
    this.copyright,
    this.docs,
    this.managingEditor,
    this.rating,
    this.webMaster,
    this.ttl,
    this.dc,
    this.itunes,
    this.syndication,*/
  });

  factory RssFeed.parse(String xmlString) {
    var document = XmlDocument.parse(xmlString);
    var rss = document.findElements('rss').firstOrNull;
    var rdf = document.findElements('rdf:RDF').firstOrNull;
    if (rss == null && rdf == null) {
      throw ArgumentError('not a rss feed');
    }
    var channelElement = (rss ?? rdf)!.findElements('channel').firstOrNull;
    if (channelElement == null) {
      throw ArgumentError('channel not found');
    }
    return RssFeed(
      title: channelElement.findElements('title').firstOrNull?.value.toString(),
      //author: channelElement.findElements('author').firstOrNull?.value.toString(),
      description: channelElement
          .findElements('description')
          .firstOrNull
          ?.value
          .toString(),
      link: channelElement.findElements('link').firstOrNull?.value.toString(),
      items: (rdf ?? channelElement)
          .findElements('item')
          .map((e) => RssItem.parse(e))
          .toList(),
      /*image: (rdf ?? channelElement)
          .findElements('image')
          .map((e) => RssImage.parse(e))
          .firstOrNull,*/
      /*cloud: channelElement
          .findElements('cloud')
          .map((e) => RssCloud.parse(e))
          .firstOrNull,*/
      /*categories: channelElement
          .findElements('category')
          .map((e) => RssCategory.parse(e))
          .toList(),*/
      /*skipDays: channelElement
              .findElements('skipDays')
              .firstOrNull
              ?.findAllElements('day')
              .map((e) => e.value.toString())
              .toList() ??
          [],*/
      /*skipHours: channelElement
              .findElements('skipHours')
              .firstOrNull
              ?.findAllElements('hour')
              .map((e) => int.tryParse(e.value.toString()) ?? 0)
              .toList() ??
          [],*/
      lastBuildDate: channelElement
          .findElements('lastBuildDate')
          .firstOrNull
          ?.value
          .toString(),
      language:
          channelElement.findElements('language').firstOrNull?.value.toString(),
      /*generator: channelElement.findElements('generator').firstOrNull?.value.toString(),
      copyright: channelElement.findElements('copyright').firstOrNull?.value.toString(),
      docs: channelElement.findElements('docs').firstOrNull?.value.toString(),
      managingEditor:
          channelElement.findElements('managingEditor').firstOrNull?.value.toString(),
      rating: channelElement.findElements('rating').firstOrNull?.value.toString(),
      webMaster: channelElement.findElements('webMaster').firstOrNull?.value.toString(),
      ttl: int.tryParse(
          channelElement.findElements('ttl').firstOrNull?.value.toString() ?? '0'),
      dc: DublinCore.parse(channelElement),
      itunes: Itunes.parse(channelElement),
      syndication: Syndication.parse(channelElement),*/
    );
  }
}
