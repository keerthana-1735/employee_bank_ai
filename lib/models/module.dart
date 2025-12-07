// lib/models/module.dart
class Space {
  final String title;
  final String emoji;
  final bool isSelected;
  
  Space({
    required this.title,
    required this.emoji,
    this.isSelected = false,
  });
  
  Space copyWith({bool? isSelected}) {
    return Space(
      title: title,
      emoji: emoji,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class Skill {
  final String title;
  final String emoji;
  final bool isChecked;
  
  Skill({
    required this.title,
    required this.emoji,
    this.isChecked = false,
  });
}

// Remove Module class since we're not using Banking Modules anymore