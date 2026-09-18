class Meal {
  final String name;
  final String description;
  final int calories;

  Meal({
    required this.name,
    required this.description,
    required this.calories,
  });

  Meal copyWith({String? description, int? calories}) {
    return Meal(
      name: name,
      description: description ?? this.description,
      calories: calories ?? this.calories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'calories': calories,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      calories: map['calories'] ?? 0,
    );
  }
}

class MealPlanGenerator {
  static List<Meal> generateDailyDietPlanScaled({
    required String goal,
    required int targetCalories,
    String? foodPreference,
  }) {
    final isVegetarian = foodPreference?.toLowerCase() == 'vegetarian' || foodPreference == 'خضروات';
    final baseMeals = isVegetarian ? _baseVegetarianMeals(goal) : _baseNormalMeals(goal);
    final totalBaseCalories = baseMeals.fold<int>(0, (sum, meal) => sum + meal.calories);

    if (totalBaseCalories == 0) return baseMeals;
    final scaleFactor = targetCalories / totalBaseCalories;

    final scaledMeals = baseMeals.map((meal) {
      final newCalories = (meal.calories * scaleFactor).round();
      final newDescription = _scaleDescription(meal.description, scaleFactor);
      return meal.copyWith(description: newDescription, calories: newCalories);
    }).toList();

    return scaledMeals;
  }

  static List<Meal> _baseVegetarianMeals(String goal) {
    switch (goal.toLowerCase()) {
      case 'loss weight':
        return [
          Meal(name: "الفطور", description: "1 كوب شوفان", calories: 150),
          Meal(name: "سناك 1", description: "1 تفاحة", calories: 80),
          Meal(name: "الغداء", description: "1 كوب عدس مطبوخ", calories: 250),
          Meal(name: "سناك 2", description: "1 موزة", calories: 100),
          Meal(name: "العشاء", description: "1 كوب حمص وخضار", calories: 120),
        ];
      case 'gain weight':
        return [
          Meal(name: "الفطور", description: "2 خبز بلدي، 1 كوب فول، 1 م زيت زيتون، تمر", calories: 500),
          Meal(name: "سناك 1", description: "1 موزة، 1 م زبدة فول سوداني", calories: 300),
          Meal(name: "الغداء", description: "1.5 كوب أرز، 1 كوب بطاطس، 1 كوب فاصوليا مطبوخة", calories: 700),
          Meal(name: "سناك 2", description: "1 كوب حليب نباتي، 1/4 كوب مكسرات", calories: 250),
          Meal(name: "العشاء", description: "1 كوب عدس، 1 توست بني، 1 كوب سلطة", calories: 400),
        ];
      case 'maintain weight':
        return [
          Meal(name: "الفطور", description: "1 توست، 1 م زبدة فول سوداني، 1 موزة", calories: 400),
          Meal(name: "سناك 1", description: "1/4 كوب مكسرات، 2 تمر", calories: 200),
          Meal(name: "الغداء", description: "1 كوب برغل، 1 كوب خضار مطهو، 1/2 كوب حمص", calories: 550),
          Meal(name: "سناك 2", description: "1 كوب عصير طبيعي، 2 تمر", calories: 180),
          Meal(name: "العشاء", description: "2 خبز، 1 طماطم، 1 م زيت زيتون، زعتر", calories: 350),
        ];
      case 'building muscles':
        return [
          Meal(name: "الفطور", description: "1 كوب شوفان، 1 م زبدة فول سوداني، 1 موزة", calories: 500),
          Meal(name: "سناك 1", description: "1 بروتين بار نباتي، 1/4 كوب مكسرات", calories: 250),
          Meal(name: "الغداء", description: "1 كوب عدس، 1 كوب أرز بني، 1 كوب خضار سوتيه", calories: 600),
          Meal(name: "سناك 2", description: "1 زبادي نباتي، 10 لوز", calories: 200),
          Meal(name: "العشاء", description: "1 كوب فول، 2 توست، 1 كوب سلطة", calories: 400),
        ];
      default:
        return [Meal(name: "وجبة غير محددة", description: "الرجاء اختيار هدف صحيح", calories: 0)];
    }
  }

  static List<Meal> _baseNormalMeals(String goal) {
    switch (goal.toLowerCase()) {
      case 'loss weight':
        return [
          Meal(name: "الفطور", description: "1 كوب شوفان، 1 تفاحة، 1/2 كوب لبن", calories: 300),
          Meal(name: "سناك 1", description: "1 حفنة لوز أو 1 خيارة", calories: 100),
          Meal(name: "الغداء", description: "1 صدر دجاج، 1 كوب أرز بني، 1 سلطة", calories: 450),
          Meal(name: "سناك 2", description: "1 زبادي لايت أو 1 ثمرة فاكهة", calories: 120),
          Meal(name: "العشاء", description: "1 سلطة تونة، 1 توست بني", calories: 250),
        ];
      case 'gain weight':
        return [
          Meal(name: "الفطور", description: "2 بيض، 2 جبن، 2 خبز، 3 تمرات", calories: 600),
          Meal(name: "سناك 1", description: "1 موزة، 1 م زبدة فول سوداني", calories: 300),
          Meal(name: "الغداء", description: "100 جم لحم، 1.5 كوب أرز، 1 كوب بطاطس", calories: 750),
          Meal(name: "سناك 2", description: "1 كوب حليب كامل الدسم، 3 تمرات", calories: 350),
          Meal(name: "العشاء", description: "2 بيض، 1 بطاطا، 2 خبز", calories: 500),
        ];
      case 'maintain weight':
        return [
          Meal(name: "الفطور", description: "2 بيض مسلوق، 1 توست، 1 موزة", calories: 400),
          Meal(name: "سناك 1", description: "1/4 كوب مكسرات، 1 تمرة", calories: 150),
          Meal(name: "الغداء", description: "1 كوب كفتة، 1 كوب مكرونة، 1 كوب خضار", calories: 550),
          Meal(name: "سناك 2", description: "1 كوب زبادي، 1 م عسل", calories: 180),
          Meal(name: "العشاء", description: "2 بيض، 1 توست، 1 كوب لبن", calories: 350),
        ];
      case 'building muscles':
        return [
          Meal(name: "الفطور", description: "2 بيض، 1 كوب شوفان، 1 موزة، 1 م زبدة فول سوداني", calories: 550),
          Meal(name: "سناك 1", description: "1 بروتين بار أو 1 زبادي بروتين", calories: 200),
          Meal(name: "الغداء", description: "1 صدر دجاج، 1 بطاطا، 1 كوب خضار سوتيه", calories: 600),
          Meal(name: "سناك 2", description: "1 مشروب بروتين، 10 حبات لوز", calories: 300),
          Meal(name: "العشاء", description: "2 بيض، 1 توست، 1 كوب خضار", calories: 400),
        ];
      default:
        return [Meal(name: "وجبة غير محددة", description: "الرجاء اختيار هدف صحيح", calories: 0)];
    }
  }

  static String _scaleDescription(String description, double scaleFactor) {
    if (scaleFactor < 1.1) return description;
    final regex = RegExp(r'(\d+)');
    return description.replaceAllMapped(regex, (match) {
      int originalNum = int.parse(match.group(0)!);
      int newNum = (originalNum * scaleFactor).round();
      return newNum.toString();
    });
  }
}

// alternate_meal_plan_generator.dart



class AlternateMealPlanGenerator {
  static List<Meal> generateDailyDietPlan({
    required String goal,
    required int targetCalories,
  }) {
    final meals = _alternateMeals(goal);
    final totalCalories = meals.fold<int>(0, (sum, meal) => sum + meal.calories);

    if (totalCalories == 0) return meals;

    final scaleFactor = targetCalories / totalCalories;

    return meals.map((meal) {
      final newCalories = (meal.calories * scaleFactor).round();
      final newDescription = _scaleDescription(meal.description, scaleFactor);
      return meal.copyWith(description: newDescription, calories: newCalories);
    }).toList();
  }

  static List<Meal> _alternateMeals(String goal) {
    switch (goal.toLowerCase()) {
      case 'loss weight':
        return [
          Meal(name: "الفطور", description: "1 زبادي خالي الدسم، 1 برتقالة", calories: 200),
          Meal(name: "سناك 1", description: "1 خيارة، 5 لوز", calories: 80),
          Meal(name: "الغداء", description: "1 سمك مشوي، 1/2 كوب كينوا، خضار", calories: 400),
          Meal(name: "سناك 2", description: "1 كوب عصير طازج", calories: 100),
          Meal(name: "العشاء", description: "1 شوربة عدس، 1 توست بني", calories: 220),
        ];
      case 'gain weight':
        return [
          Meal(name: "الفطور", description: "2 بيض، 2 توست، 1 كوب عصير، جبنة كاملة الدسم", calories: 600),
          Meal(name: "سناك 1", description: "1 كوب لبن كامل، 1 موزة، تمر", calories: 350),
          Meal(name: "الغداء", description: "1 دجاج مشوي، 1.5 كوب أرز، بطاطس", calories: 800),
          Meal(name: "سناك 2", description: "1 كوب زبادي + مكسرات", calories: 300),
          Meal(name: "العشاء", description: "1 كوب فول، 2 خبز، 1 م زيت زيتون", calories: 450),
        ];
      case 'maintain weight':
        return [
          Meal(name: "الفطور", description: "1 كوب شوفان، 1 موزة، 1 زبادي", calories: 350),
          Meal(name: "سناك 1", description: "1 حفنة مكسرات، 2 تمر", calories: 200),
          Meal(name: "الغداء", description: "1 دجاج مشوي، 1 كوب مكرونة، 1 سلطة", calories: 600),
          Meal(name: "سناك 2", description: "1 كوب عصير طبيعي", calories: 150),
          Meal(name: "العشاء", description: "1 بيض، 1 توست، 1 لبن", calories: 350),
        ];
      case 'building muscles':
        return [
          Meal(name: "الفطور", description: "3 بيض، 1 كوب شوفان، 1 م زبدة فول سوداني", calories: 600),
          Meal(name: "سناك 1", description: "1 كوب بروتين شيك، 1 موزة", calories: 300),
          Meal(name: "الغداء", description: "1 صدر دجاج، 1 كوب أرز، 1 بطاطا", calories: 700),
          Meal(name: "سناك 2", description: "1 بروتين بار، مكسرات", calories: 250),
          Meal(name: "العشاء", description: "2 بيض، 1 توست، 1 كوب زبادي", calories: 400),
        ];
      default:
        return [Meal(name: "وجبة غير محددة", description: "الرجاء اختيار هدف صحيح", calories: 0)];
    }
  }

  static String _scaleDescription(String description, double scaleFactor) {
    if (scaleFactor < 1.1) return description;

    final regex = RegExp(r'(\d+)');
    return description.replaceAllMapped(regex, (match) {
      int originalNum = int.parse(match.group(0)!);
      int newNum = (originalNum * scaleFactor).round();
      return newNum.toString();
    });
  }
}
