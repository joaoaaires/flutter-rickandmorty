import 'package:flutter/material.dart';
import 'package:flutterrickandmorty/app/core/util/spacer.dart';

import '../character/domain/entities/character.dart';

class HomeItemWidget extends StatelessWidget {
  final Character character;

  const HomeItemWidget({
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
        onTap: () {},
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
                  child: Image.network(
                    character.image ?? "",
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                // child: Container(
                //   decoration: const BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(10.0),
                //       bottomLeft: Radius.circular(10.0),
                //     ),
                //     color: Colors.amber,
                //   ),
                //   child: Image.network('https://picsum.photos/250?image=9', ),
                // ),
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
}
