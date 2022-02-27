import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/spacer.dart';
import '../../../../core/widgets/character_image_color_or_black_white.dart';
import '../../../../core/widgets/text_form_field_custom.dart';
import '../../domain/entities/character.dart';
import 'character_form_controller.dart';

class CharacterFormPage extends GetView<CharacterFormController> {
  const CharacterFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Character"),
    );
  }

  Widget floatingActionButton() {
    final character = controller.character;
    final sizeEpisodes = character.episode.length;

    if (sizeEpisodes == 0) return const SizedBox.shrink();

    return FloatingActionButton.extended(
      onPressed: () {},
      label: Text("Show episodes ($sizeEpisodes)"),
    );
  }

  Widget buildBody() {
    final character = controller.character;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(13.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildCircleAvatar(character),
            spacerHeight(height: 10.0),
            buidTextName(character),
            spacerHeight(height: 10.0),
            buildTextFild("Status", character.status),
            spacerHeight(height: 10.0),
            buildTextFild("Specie", character.species),
            spacerHeight(height: 10.0),
            buildTextFild("Type", character.type),
            spacerHeight(height: 10.0),
            buildTextFild("Gender", character.gender),
          ],
        ),
      ),
    );
  }

  CircleAvatar buildCircleAvatar(Character character) {
    return CircleAvatar(
      radius: 95,
      child: ClipOval(
        child: CharacterImage.colorOrBlackWhite(character),
      ),
    );
  }

  Text buidTextName(Character character) {
    final name = character.name ?? "Name";
    return Text(
      name,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildTextFild(String title, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormFieldCustom(
          border: true,
          initialValue: value,
          enable: false,
          labelText: title,
        )
      ],
    );
  }
}
