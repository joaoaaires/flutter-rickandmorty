import 'package:flutter/material.dart';

import '../../features/character/domain/entities/character.dart';

class CharacterImage {
  static Widget colorOrBlackWhite(Character character) {
    final status = character.status;
    final child = getImageNetwork(character);

    if (status != null && status != "Alive") {
      return ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.grey,
          BlendMode.saturation,
        ),
        child: child,
      );
    }

    return child;
  }

  static Widget getImageNetwork(Character character) {
    final imageUrl = character.image ?? "";
    return Image.network(
      imageUrl,
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
