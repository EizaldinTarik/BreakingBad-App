import 'package:breaking_bad/constants/my_colors.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', character.jobs.join(' / ')),
                      buildDivider(260),
                      characterInfo(
                          'Appeared in : ', character.categoryForTwoSeries),
                      buildDivider(220),
                      characterInfo('Seasons : ',
                          character.appearanceOfSeasons.join(' / ')),
                      buildDivider(240),
                      characterInfo('Status : ', character.statusIfDeadOrAlive),
                      buildDivider(260),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : characterInfo('Better Caul Saul Seasons : ',
                              character.betterCallSaulAppearance.join(' / ')),
                      character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : buildDivider(100),
                      characterInfo('Actor/Actress: ', character.actorName),
                      buildDivider(200),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 500),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.nickName,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }
}
