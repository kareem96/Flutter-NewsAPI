import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

class ListCardNews extends StatefulWidget {
  final String? pictureId;
  final String? author;
  final String? title;
  final String? publishedAt;
  final String? description;
  final Function() onPress;

  const ListCardNews(
      {Key? key,
      required this.pictureId,
      required this.title,
      required this.author,
      required this.publishedAt,
      required this.description,
      required this.onPress})
      : super(key: key);

  @override
  State<ListCardNews> createState() => _ListCardNewsState();
}

class _ListCardNewsState extends State<ListCardNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        child: InkWell(
          onTap: widget.onPress,
          child: Parent(
            style: ParentStyle()..margin(horizontal: 16, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(tag: widget.title ?? "",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.pictureId ?? "",
                      height: 100,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.title ?? ""),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.description ?? "",
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Text(
                      timeago.format(DateTime.parse(widget.publishedAt ?? "")).toString(),
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
