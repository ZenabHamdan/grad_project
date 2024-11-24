import 'package:grad_project/exports/exports.dart';

class CardModel {
  final String title;
  final String subtitle;
  final int value;
  final int total;
  final Color textColor;
  final Color subtitleColor;
  final Color cardColor;
  final Color progressBarColor;

  CardModel({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.total,
    required this.textColor,
    required this.subtitleColor,
    required this.cardColor,
    required this.progressBarColor,
  });
}

final List<CardModel> cardsData = [
  CardModel(
    title: 'Application Design',
    subtitle: 'UI Design Kit',
    value: 50,
    total: 80,
    textColor: AppColors.backgroundColor,
    subtitleColor: AppColors.cardSubtitleColor,
    cardColor: AppColors.textColor,
    progressBarColor: AppColors.textColor,
  ),
  CardModel(
    title: 'Overlay Design',
    subtitle: 'UI Design Kit',
    value: 50,
    total: 80,
    textColor: AppColors.headlinesColor,
    subtitleColor: Color(0xffA0BAC5),
    cardColor: AppColors.backgroundColor,
    progressBarColor: Color(0xff756EF3),
  ),
];
