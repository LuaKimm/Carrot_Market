import 'package:carrot_market/models/chat_message.dart';
import 'package:carrot_market/screens/components/image_container.dart';
import 'package:carrot_market/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 채팅 메시지 하나를 표시하는 카드형 UI 컴포넌트
class ChatContainer extends StatelessWidget {
  const ChatContainer({
    Key? key,
    required this.chatMessage,
  }) : super(key: key);

  /// 표시할 채팅 메시지 정보 (보낸 사람, 프로필 이미지, 메시지 내용 등)
  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 하단 테두리 (다음 항목과 구분용)
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20), // 안쪽 여백 설정
        child: Row(
          children: [
            // ▶ 1. 프로필 이미지 (원형)
            ImageContainer(
              width: 50,
              height: 50,
              borderRadius: 25,
              imageUrl: chatMessage.profileImage,
            ),
            const SizedBox(width: 16), // 프로필과 텍스트 사이 간격

            // ▶ 2. 메시지 내용 영역
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(), // 위 공간 밀기

                  // ▶ 2-1. 발신자 이름, 위치, 보낸 시간 (한 줄에 표현)
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: chatMessage.sender,
                          style: textTheme().bodyLarge,
                        ),
                        TextSpan(
                          text: ' ${chatMessage.location}',
                          style: textTheme().bodySmall,
                        ),
                        TextSpan(
                          text: ' · ${chatMessage.sendDate}',
                          style: textTheme().bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),

                  // ▶ 2-2. 실제 채팅 메시지
                  Text(
                    chatMessage.message,
                    style: textTheme().bodyMedium,
                    overflow: TextOverflow.ellipsis, // 너무 길면 "..." 처리
                  ),

                  const Spacer(), // 아래 공간 밀기
                ],
              ),
            ),

            // ▶ 3. (선택적) 메시지에 포함된 이미지 미리보기
            if (chatMessage.imageUri != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                  child: ImageContainer(
                    width: 50,
                    height: 50,
                    borderRadius: 8,
                    imageUrl: chatMessage.imageUri ?? '',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
