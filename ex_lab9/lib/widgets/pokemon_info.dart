import 'package:flutter/material.dart';
import '../widgets/pokemon_quiz.dart';

class PokemonInfo extends StatefulWidget {
  const PokemonInfo({Key? key}) : super(key: key);

  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  var pokeInfo = {
    1: {
      'question': 'Who’s that Pokémon?',
      'imgurl':
          'https://cdn.vox-cdn.com/thumbor/e6Xz2K9_IRripMxMt4LutXtnrFU=/0x0:1920x1080/920x613/filters:focal(271x342:577x648):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/57794409/who_pokemon.0.jpg',
      'choice1': 'Pichu',
      'c1_color': Colors.blueAccent,
      'c1_answer': false,
      'choice2': 'Pikapika',
      'c2_color': Colors.purpleAccent,
      'c2_answer': false,
      'choice3': 'Pikachu',
      'c3_color': Colors.yellowAccent,
      'c3_answer': true,
      'choice4': 'Pigachu',
      'c4_color': Colors.greenAccent,
      'c4_answer': false,
    },
    2: {
      'question': 'Who’s that Pokémon?',
      'imgurl': 'https://www.outcyders.net/images/quizzes/4/question1.jpg',
      'choice1': 'Jigglypuff',
      'c1_color': Colors.purpleAccent,
      'c1_answer': true,
      'choice2': 'Jiggrypuff',
      'c2_color': Colors.yellowAccent,
      'c2_answer': false,
      'choice3': 'Jigllypub',
      'c3_color': Colors.blueAccent,
      'c3_answer': false,
      'choice4': 'Gigglypuff',
      'c4_color': Colors.greenAccent,
      'c4_answer': false,
    },
    3: {
      'question': 'Who’s that Pokémon?',
      'imgurl':
          'https://assets1.ignimgs.com/2018/06/20/maxresdefault-1529534302190.jpg',
      'choice1': 'Mimicyu',
      'c1_color': Colors.yellowAccent,
      'c1_answer': false,
      'choice2': 'Mimikyu',
      'c2_color': Colors.greenAccent,
      'c2_answer': true,
      'choice3': 'Pikachu',
      'c3_color': Colors.blueAccent,
      'c3_answer': false,
      'choice4': 'Pichu',
      'c4_color': Colors.purpleAccent,
      'c4_answer': false,
    },
  };

  @override
  Widget build(BuildContext context) {
    return PokemonQuiz(num: 1, info: pokeInfo);
  }
}
