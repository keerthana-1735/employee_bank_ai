// lib/widgets/skill_card.dart (if exists)
import 'package:flutter/material.dart';
import 'package:employee_bank_ai/models/module.dart';
import 'package:employee_bank_ai/screens/skill_screen.dart'; // Add this import

class SkillCard extends StatefulWidget {
  final Skill skill;
  final VoidCallback onTap;

  const SkillCard({
    Key? key,
    required this.skill,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to skill details page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SkillScreen(skill: widget.skill),
          ),
        );
        widget.onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.skill.isChecked ? const Color(0xFFF0F9FF) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.skill.isChecked ? const Color(0xFF0D1B2A) : const Color(0xFFE2E8F0),
            width: widget.skill.isChecked ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: widget.skill.isChecked 
                      ? const Color(0xFF0D1B2A).withOpacity(0.1)
                      : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    widget.skill.emoji,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.skill.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: widget.skill.isChecked ? const Color(0xFF0D1B2A) : const Color(0xFF94A3B8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}