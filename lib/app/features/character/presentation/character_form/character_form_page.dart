import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/spacer.dart';
import '../../../../core/widgets/character_image_color_or_black_white.dart';
import '../../../../core/widgets/text_form_field_custom.dart';
import '../../../location/presentation/location_item/location_item_widget.dart';
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
      onPressed: () => controller.toEpisodeList(),
      label: Text("Show episodes ($sizeEpisodes)"),
    );
  }

  Widget buildBody() {
    final character = controller.character;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(13.0).copyWith(bottom: 85.0),
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
            spacerHeight(height: 10.0),
            buildTextFildOrigin(),
            spacerHeight(height: 10.0),
            buildTextFildLocation(),
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
    return TextFormFieldCustom(
      border: true,
      initialValue: value,
      enable: false,
      labelText: title,
    );
  }

  Widget buildTextFildOrigin() {
    final primaryColor = Get.theme.primaryColor;

    final character = controller.character;
    final origin = character.origin;
    final name = origin['name']?.toString();
    final url = origin['url']?.toString();

    final borderSide = BorderSide(
      color: primaryColor,
      width: 0.8,
    );

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: borderSide,
    );

    return InputDecorator(
      decoration: InputDecoration(
        filled: true,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
        disabledBorder: border,
        fillColor: const Color(0xffF5F6FA),
        labelText: "Origin",
      ),
      child: url != null && url.isNotEmpty
          ? LocationItemWidget(
              url: url,
              showCard: false,
            )
          : Text(name ?? ""),
    );
  }

  Widget buildTextFildLocation() {
    final primaryColor = Get.theme.primaryColor;

    final character = controller.character;
    final location = character.location;

    final name = location['name']?.toString();
    final url = location['url']?.toString();

    final borderSide = BorderSide(
      color: primaryColor,
      width: 0.8,
    );

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: borderSide,
    );

    return InputDecorator(
      decoration: InputDecoration(
        filled: true,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
        disabledBorder: border,
        fillColor: const Color(0xffF5F6FA),
        labelText: "Location",
      ),
      child: url != null && url.isNotEmpty
          ? LocationItemWidget(
              url: url,
              showCard: false,
            )
          : Text(name ?? ""),
    );
  }
}
