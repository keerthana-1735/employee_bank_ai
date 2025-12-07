// lib/data/module_data.dart
import 'package:employee_bank_ai/models/module.dart';

// Spaces (Workspaces)
final List<Space> allSpaces = [
  Space(title: 'Branch Operations', emoji: '🏢', isSelected: false),
  Space(title: 'KYC Guidelines', emoji: '📋', isSelected: false),
  Space(title: 'Loan Policies', emoji: '💰', isSelected: false),
  Space(title: 'HR & Payroll', emoji: '👥', isSelected: false),
  Space(title: 'Risk & Compliance', emoji: '🛡️', isSelected: false),
  Space(title: 'IT Support', emoji: '💻', isSelected: false),
  Space(title: 'Account Services', emoji: '🏦', isSelected: false),
  Space(title: 'Foreign Exchange', emoji: '💱', isSelected: false),
];

// Skills - Expanded list
final List<Skill> allSkills = [
  Skill(title: 'Customer Service', emoji: '😊', isChecked: false),
  Skill(title: 'Transaction Processing', emoji: '💳', isChecked: false),
  Skill(title: 'Risk Assessment', emoji: '📊', isChecked: false),
  Skill(title: 'Compliance Knowledge', emoji: '✅', isChecked: false),
  Skill(title: 'System Operations', emoji: '⚙️', isChecked: false),
  Skill(title: 'Document Verification', emoji: '📄', isChecked: false),
  Skill(title: 'Financial Analysis', emoji: '📈', isChecked: false),
  Skill(title: 'Cash Management', emoji: '💰', isChecked: false),
  Skill(title: 'Loan Processing', emoji: '🏠', isChecked: false),
  Skill(title: 'Fraud Detection', emoji: '🔍', isChecked: false),
];