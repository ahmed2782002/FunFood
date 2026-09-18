import 'package:flutter/material.dart';


import '../../l10n/app_localizations.dart';
class Category {
  final String title;
  final String imagePath;
  final List<Map<String, String>> articles;

  Category({
    required this.title,
    required this.imagePath,
    required this.articles,
  });
}

class Articles extends StatelessWidget {
  const Articles({super.key});



  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context)!;
    final List<Category> categories = [
      Category(
        title: localizations.hydration,
        imagePath: "assets/hydration.jpeg",
        articles: [
          {
            "title": localizations.hydration_tip_1_title,
            "body": localizations.hydration_tip_1_body,
          },
          {
            "title": localizations.hydration_tip_2_title,
            "body": localizations.hydration_tip_2_body,
          },
          {
            "title": localizations.hydration_tip_3_title,
            "body": localizations.hydration_tip_3_body,
          },
          {
            "title": localizations.hydration_tip_4_title,
            "body": localizations.hydration_tip_4_body
          },
          {
            "title": localizations.hydration_tip_5_title,
            "body":localizations.hydration_tip_5_body
          },
          {
            "title": localizations.hydration_tip_6_title,
            "body": localizations.hydration_tip_6_body
          },
          {
            "title": localizations.hydration_tip_7_title,
            "body": localizations.hydration_tip_7_body
          },
          {
            "title": localizations.hydration_tip_8_title,
            "body": localizations.hydration_tip_8_body
          },
          {
            "title": localizations.hydration_tip_9_title,
            "body": localizations.hydration_tip_9_body
          },
          {
            "title":localizations.hydration_tip_10_title,
            "body": localizations.hydration_tip_10_body
          },
        ],
      ),
      Category(
        title: localizations.sleep_recovery,
        imagePath: "assets/sleep.jpg",
        articles: [
          {
            "title": localizations.sleep_tip_1_title,
            "body": localizations.sleep_tip_1_body
          },
          {
            "title": localizations.sleep_tip_2_title,
            "body": localizations.sleep_tip_2_body
          },
          {
            "title": localizations.sleep_tip_3_title,
            "body": localizations.sleep_tip_3_body
          },
          {
            "title": localizations.sleep_tip_4_title,
            "body": localizations.sleep_tip_4_body
          },
          {
            "title": localizations.sleep_tip_5_title,
            "body": localizations.sleep_tip_5_body
          },
          {
            "title": localizations.sleep_tip_6_title,
            "body": localizations.sleep_tip_6_body
          },
          {
            "title": localizations.sleep_tip_7_title,
            "body": localizations.sleep_tip_7_body
          },
          {
            "title": localizations.sleep_tip_8_title,
            "body": localizations.sleep_tip_8_body
          },
          {
            "title": localizations.sleep_tip_9_title,
            "body": localizations.sleep_tip_9_body
          },
          {
            "title": localizations.sleep_tip_10_title,
            "body": localizations.sleep_tip_10_body
          },
        ],
      ),
      Category(
        title: AppLocalizations.of(context)!.nutrition,
        imagePath: "assets/foodd.png",
        articles: [
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_1_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_1_body
          },
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_2_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_2_body
          },
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_3_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_3_body
          },
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_4_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_4_body
          },
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_5_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_5_body
          },
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_6_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_6_body
          },
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_7_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_7_body
          },
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_8_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_8_body
          },
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_9_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_9_body
          },
          {
            "title": AppLocalizations.of(context)!.nutrition_tip_10_title,
            "body": AppLocalizations.of(context)!.nutrition_tip_10_body
          },
        ],
      ),


      Category(
        title: AppLocalizations.of(context)!.exercise_movement,
        imagePath: "assets/exercise.webp",
        articles: [
          {
            "title": AppLocalizations.of(context)!.exercise_tip_1_title,
            "body": AppLocalizations.of(context)!.exercise_tip_1_body
          },
          {
            "title": AppLocalizations.of(context)!.exercise_tip_2_title,
            "body": AppLocalizations.of(context)!.exercise_tip_2_body
          },
          {
            "title": AppLocalizations.of(context)!.exercise_tip_3_title,
            "body": AppLocalizations.of(context)!.exercise_tip_3_body
          },
          {
            "title": AppLocalizations.of(context)!.exercise_tip_4_title,
            "body": AppLocalizations.of(context)!.exercise_tip_4_body
          },
          {
            "title": AppLocalizations.of(context)!.exercise_tip_5_title,
            "body": AppLocalizations.of(context)!.exercise_tip_5_body
          },
          {
            "title": AppLocalizations.of(context)!.exercise_tip_6_title,
            "body": AppLocalizations.of(context)!.exercise_tip_6_body
          },
          {
            "title": AppLocalizations.of(context)!.exercise_tip_7_title,
            "body": AppLocalizations.of(context)!.exercise_tip_7_body
          },
          {
            "title": AppLocalizations.of(context)!.exercise_tip_8_title,
            "body": AppLocalizations.of(context)!.exercise_tip_8_body
          },
          {
            "title": AppLocalizations.of(context)!.exercise_tip_9_title,
            "body": AppLocalizations.of(context)!.exercise_tip_9_body
          },
          {
            "title": AppLocalizations.of(context)!.exercise_tip_10_title,
            "body": AppLocalizations.of(context)!.exercise_tip_10_body
          },
        ],
      ),

      Category(
        title: AppLocalizations.of(context)!.mental_health,
        imagePath: "assets/mental.png",
        articles: [
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_1_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_1_body
          },
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_2_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_2_body
          },
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_3_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_3_body
          },
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_4_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_4_body
          },
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_5_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_5_body
          },
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_6_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_6_body
          },
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_7_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_7_body
          },
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_8_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_8_body
          },
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_9_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_9_body
          },
          {
            "title": AppLocalizations.of(context)!.mental_health_tip_10_title,
            "body": AppLocalizations.of(context)!.mental_health_tip_10_body
          },
        ],
      ),

      Category(
        title: AppLocalizations.of(context)!.skin_oral_care,
        imagePath: "assets/skin.webp",
        articles: [
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_1_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_1_body
          },
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_2_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_2_body
          },
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_3_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_3_body
          },
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_4_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_4_body
          },
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_5_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_5_body
          },
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_6_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_6_body
          },
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_7_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_7_body
          },
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_8_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_8_body
          },
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_9_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_9_body
          },
          {
            "title": AppLocalizations.of(context)!.skin_care_tip_10_title,
            "body": AppLocalizations.of(context)!.skin_care_tip_10_body
          },
        ],
      ),


      Category(
        title: AppLocalizations.of(context)!.health_prevention,
        imagePath: "assets/prevention.png",
        articles: [
          {
            "title": AppLocalizations.of(context)!.prevention_tip_1_title,
            "body": AppLocalizations.of(context)!.prevention_tip_1_body
          },
          {
            "title": AppLocalizations.of(context)!.prevention_tip_2_title,
            "body": AppLocalizations.of(context)!.prevention_tip_2_body
          },
          {
            "title": AppLocalizations.of(context)!.prevention_tip_3_title,
            "body": AppLocalizations.of(context)!.prevention_tip_3_body
          },
          {
            "title": AppLocalizations.of(context)!.prevention_tip_4_title,
            "body": AppLocalizations.of(context)!.prevention_tip_4_body
          },
          {
            "title": AppLocalizations.of(context)!.prevention_tip_5_title,
            "body": AppLocalizations.of(context)!.prevention_tip_5_body
          },
          {
            "title": AppLocalizations.of(context)!.prevention_tip_6_title,
            "body": AppLocalizations.of(context)!.prevention_tip_6_body
          },
          {
            "title": AppLocalizations.of(context)!.prevention_tip_7_title,
            "body": AppLocalizations.of(context)!.prevention_tip_7_body
          },
          {
            "title": AppLocalizations.of(context)!.prevention_tip_8_title,
            "body": AppLocalizations.of(context)!.prevention_tip_8_body
          },
          {
            "title": AppLocalizations.of(context)!.prevention_tip_9_title,
            "body": AppLocalizations.of(context)!.prevention_tip_9_body
          },
          {
            "title": AppLocalizations.of(context)!.prevention_tip_10_title,
            "body": AppLocalizations.of(context)!.prevention_tip_10_body
          },
        ],
      ),

      Category(
        title: AppLocalizations.of(context)!.lifestyle_tips,
        imagePath: "assets/lifestyle.jpg",
        articles: [
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_1_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_1_body,
          },
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_2_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_2_body,
          },
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_3_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_3_body,
          },
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_4_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_4_body,
          },
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_5_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_5_body,
          },
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_6_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_6_body,
          },
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_7_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_7_body,
          },
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_8_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_8_body,
          },
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_9_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_9_body,
          },
          {
            "title": AppLocalizations.of(context)!.lifestyle_tip_10_title,
            "body": AppLocalizations.of(context)!.lifestyle_tip_10_body,
          },
        ],
      ),

    ];
    return Scaffold(

      backgroundColor: const Color(0xFF0B192C),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0B192C),
        title: Center(
          child: Text(
            localizations.health_categories,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryDetailsPage(category: category),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(category.imagePath),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  category.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryDetailsPage extends StatelessWidget {
  final Category category;
  const CategoryDetailsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B192C),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: const Color(0xFF0B192C),
        title: Text(
          category.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: category.articles.length,
        itemBuilder: (context, index) {
          final article = category.articles[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "${article['title']}\n\n",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: article['body'],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
