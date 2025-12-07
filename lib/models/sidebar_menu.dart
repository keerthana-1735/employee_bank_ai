// models/sidebar_menu.dart
import 'package:flutter/material.dart';

class SidebarMenuItem {
  final String title;
  final IconData? icon;
  final String? emoji;
  final String? subtitle;
  final bool isHeader;
  final bool isSelected;
  final String? route;
  final List<SidebarMenuItem>? children;

  SidebarMenuItem({
    required this.title,
    this.icon,
    this.emoji,
    this.subtitle,
    this.isHeader = false,
    this.isSelected = false,
    this.route,
    this.children,
  });
}

// Core Workspaces
final List<SidebarMenuItem> coreWorkspaces = [
  SidebarMenuItem(
    title: 'Branch Operations',
    emoji: '🏦',
    route: '/branch-operations',
    subtitle: 'Daily branch activities',
  ),
  SidebarMenuItem(
    title: 'Customer Onboarding (KYC)',
    emoji: '🪪',
    route: '/kyc',
    subtitle: 'Customer verification',
  ),
  SidebarMenuItem(
    title: 'Loan Processing',
    emoji: '💰',
    route: '/loan-processing',
    subtitle: 'Loan applications & approval',
  ),
  SidebarMenuItem(
    title: 'Account Services',
    emoji: '🏧',
    route: '/account-services',
    subtitle: 'Account management',
  ),
  SidebarMenuItem(
    title: 'Cash & Treasury',
    emoji: '💸',
    route: '/cash-treasury',
    subtitle: 'Cash management',
  ),
  SidebarMenuItem(
    title: 'Risk & Compliance',
    emoji: '🛡️',
    route: '/risk-compliance',
    subtitle: 'Risk management',
  ),
  SidebarMenuItem(
    title: 'IT & System Support',
    emoji: '💻',
    route: '/it-support',
    subtitle: 'Technical support',
  ),
  SidebarMenuItem(
    title: 'HR & Payroll',
    emoji: '👨‍💼',
    route: '/hr-payroll',
    subtitle: 'HR operations',
  ),
  SidebarMenuItem(
    title: 'Sales & Marketing',
    emoji: '📊',
    route: '/sales-marketing',
    subtitle: 'Sales activities',
  ),
  SidebarMenuItem(
    title: 'Document Management',
    emoji: '📑',
    route: '/document-management',
    subtitle: 'Document handling',
  ),
];

// Employee Skills / Knowledge
final List<SidebarMenuItem> employeeSkills = [
  SidebarMenuItem(
    title: 'KYC Guidelines',
    emoji: '📋',
    route: '/kyc-guidelines',
    subtitle: 'Verification procedures',
  ),
  SidebarMenuItem(
    title: 'Loan Policies',
    emoji: '📄',
    route: '/loan-policies',
    subtitle: 'Lending guidelines',
  ),
  SidebarMenuItem(
    title: 'Transaction Limits',
    emoji: '🔒',
    route: '/transaction-limits',
    subtitle: 'Daily limits & rules',
  ),
  SidebarMenuItem(
    title: 'Credit Card Rules',
    emoji: '💳',
    route: '/credit-card-rules',
    subtitle: 'Card policies',
  ),
  SidebarMenuItem(
    title: 'Insurance Documentation Rules',
    emoji: '🏥',
    route: '/insurance-rules',
    subtitle: 'Insurance procedures',
  ),
  SidebarMenuItem(
    title: 'Audit & Legal Compliance FAQs',
    emoji: '⚖️',
    route: '/audit-faqs',
    subtitle: 'Compliance queries',
  ),
];

// Support & Tools
final List<SidebarMenuItem> supportTools = [
  SidebarMenuItem(
    title: 'Help / Password Reset',
    icon: Icons.help_outline,
    route: '/help-password',
    subtitle: 'Get help & reset password',
  ),
  SidebarMenuItem(
    title: 'Internal Contacts Directory',
    icon: Icons.contacts_outlined,
    route: '/contacts',
    subtitle: 'Employee directory',
  ),
  SidebarMenuItem(
    title: 'Training & Certifications',
    icon: Icons.school_outlined,
    route: '/training',
    subtitle: 'Learning resources',
  ),
  SidebarMenuItem(
    title: 'Employee Notices / Announcements',
    icon: Icons.announcement_outlined,
    route: '/announcements',
    subtitle: 'Latest updates',
  ),
  SidebarMenuItem(
    title: 'Report an Issue',
    icon: Icons.report_problem_outlined,
    route: '/report-issue',
    subtitle: 'Report problems',
  ),
];

// Main sidebar structure
final List<SidebarMenuItem> sidebarMenu = [
  SidebarMenuItem(
    title: '1️⃣ Core Workspaces',
    isHeader: true,
  ),
  ...coreWorkspaces,
  
  SidebarMenuItem(
    title: '2️⃣ Employee Skills / Knowledge',
    isHeader: true,
  ),
  ...employeeSkills,
  
  SidebarMenuItem(
    title: '3️⃣ Support & Tools',
    isHeader: true,
  ),
  ...supportTools,
];