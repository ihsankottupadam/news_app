import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/news_model.dart';
import '../routes/app_pages.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.news,
  });

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DETAIL, arguments: news);
      },
      child: SizedBox(
          width: double.infinity,
          height: 140,
          child: Stack(
            children: [
              const Positioned(
                  top: 20, bottom: 10, left: 80, right: -20, child: Card()),
              Positioned(
                  left: 30,
                  top: 0,
                  child: Hero(
                    tag: news.id,
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      clipBehavior: Clip.hardEdge,
                      elevation: 10,
                      child: CachedNetworkImage(
                        imageUrl: news.imageUrl,
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                        placeholder: (_, __) {
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  )),
              Positioned(
                  top: 30,
                  left: 160,
                  bottom: 30,
                  right: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        news.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        news.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade600),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
