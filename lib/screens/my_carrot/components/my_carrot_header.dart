import 'package:carrot_market/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCarrotHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            _buildProfileRow(),
            const SizedBox(height: 30),
            _buildProfileButton(),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundTextButton('판매 내역', FontAwesomeIcons.receipt),
                _buildRoundTextButton('구매 내역', FontAwesomeIcons.shoppingBag),
                _buildRoundTextButton('관심 목록', FontAwesomeIcons.heart),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _buildProfileRow() {
    return Row(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: Image.network(
                  'https://placeimg.com/200/100/people',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100]),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 15,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('developer', style: textTheme().bodyMedium),
            const SizedBox(height: 10),
            const Text('좌동 #00912'),
          ],
        )
      ],
    );
  }
  Widget _buildProfileButton(){
    return InkWell(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFD4D5DD),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          height:45,
          child: Center(
            child: Text(
              '프로필 보기',
              style: textTheme().titleMedium,
            ),
          ),
        ),
      );
  }

  Widget _buildRoundTextButton(String title, IconData iconData){
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(iconData, size: 28, color: Colors.deepOrange),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: textTheme().bodySmall,
        )
      ],
    );
  }
}