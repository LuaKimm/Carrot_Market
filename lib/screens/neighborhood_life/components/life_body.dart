import 'package:carrot_market/models/neighborhood_life.dart';
import 'package:carrot_market/screens/components/image_container.dart';
import 'package:carrot_market/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LifeBody extends StatelessWidget {
  final NeighborhoodLife neighborhoodLife;

  const LifeBody({Key? key, required this.neighborhoodLife}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xFFD4D5DD)),
        ),
      ),
      child: Column(
        children: [
          _buildTop(),
          _buildWriter(),
          _buildWriting(),
          _buildImage(),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          _buildTail(neighborhoodLife.commentCount),
        ],
      ),
    );
  }

  Padding _buildTop() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 왼쪽: 카테고리 표시
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Color.fromRGBO(247, 247, 247, 1),
            ),
            child: Text(
              neighborhoodLife.category,
              style: textTheme().displayMedium,
            ),
          ),
          // 오른쪽: 날짜
          Text(
            neighborhoodLife.date,
            style: textTheme().displayMedium,
          ),
        ],
      ),
    );
  }

  Padding _buildWriter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ImageContainer(borderRadius: 15, imageUrl: neighborhoodLife.profileImgUri, width: 30, height: 30),
          Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: ' ${neighborhoodLife.userName}', style: textTheme().bodyLarge),
                  TextSpan(text: ' ${neighborhoodLife.location}', style: textTheme().bodyMedium),
                  TextSpan(text: ' 인증 ${neighborhoodLife.authCount}회', style: textTheme().bodyMedium)
                ]
              ))
        ],
      ),
    );
  }

  Padding _buildWriting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          neighborhoodLife.content,
          style: textTheme().bodyLarge, // TODO 06수정
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Visibility _buildImage() {
    return Visibility(
      visible: neighborhoodLife.contentImgUri != '',
      child: Padding(
        padding: const EdgeInsets.only(left:16, right: 16, bottom: 16),
        child: Image.network(
          neighborhoodLife.contentImgUri,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Padding _buildTail(int commentCount) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.smile,
            color: Colors.grey,
            size: 22,
          ),
          const SizedBox(width: 8),
          const Text(
            '공감하기',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(width:22),
          const Icon(
            FontAwesomeIcons.commentAlt,
            color: Colors.grey,
            size: 22,
          ),
          const SizedBox(width: 8),
          Text(
            "${"댓글쓰기"} $commentCount",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
