import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/character_image_color_or_black_white.dart';
import '../../domain/entities/character.dart';
import '../character_list/character_list_controller.dart';

class CharacterItemStaticWidget extends StatelessWidget {
  final Character character;

  const CharacterItemStaticWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () => onTapCard(),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  child: CharacterImage.colorOrBlackWhite(character),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText(
                        character.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      getText(character.status),
                      getText(character.species),
                      getText(character.type),
                      getText(character.gender),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getText(String? text, {TextStyle? style}) {
    if (text != null && text.isNotEmpty) {
      return Text(
        text,
        style: style,
      );
    }
    return const SizedBox.shrink();
  }

  void onTapCard() {
    final controller = Get.find<CharacterListController>();
    controller.toCharacterForm(character);
  }
}