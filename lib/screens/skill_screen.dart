// lib/screens/skill_screen.dart
import 'package:flutter/material.dart';
import 'package:employee_bank_ai/models/module.dart';
import 'package:employee_bank_ai/widgets/chat_assistant.dart';

// Color Theme - Ocean Blue
const Color primaryColor = Color(0xFF0077B6);
const Color secondaryColor = Color(0xFF00B4D8);
const Color accentColor = Color(0xFF90E0EF);
const Color backgroundColor = Color(0xFFCAF0F8);
const Color textColor = Color(0xFF023047);
const Color lightTextColor = Color(0xFF64748B);
const Color sidebarBackground = Color(0xFFFFFFFF);
const Color cardBackground = Color(0xFFFFFFFF);

class SkillScreen extends StatefulWidget {
  final Skill skill;
  
  const SkillScreen({Key? key, required this.skill}) : super(key: key);

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  bool _showChat = false;
  String _chatQuery = '';
  String _chatContext = '';
  
  // Skill content based on skill type
  final Map<String, Map<String, dynamic>> _skillContent = {
    'Customer Service': {
      'title': 'Customer Service Excellence',
      'description': 'Professional customer interaction protocols, complaint resolution, and service standards for banking professionals.',
      'sections': [
        {
          'title': 'Greeting Protocols',
          'icon': Icons.handshake_outlined,
          'points': [
            'Greet customers within 15 seconds of arrival',
            'Maintain eye contact and professional smile',
            'Use customer name where possible',
            'Offer assistance proactively'
          ]
        },
        {
          'title': 'Complaint Resolution',
          'icon': Icons.feedback_outlined,
          'points': [
            'Listen without interruption',
            'Empathize with customer concerns',
            'Provide solution timeline',
            'Follow-up within 48 hours'
          ]
        },
        {
          'title': 'Service Standards',
          'icon': Icons.star_outline,
          'points': [
            'Response time: < 2 minutes',
            'Transaction completion: < 5 minutes',
            'Phone response: < 3 rings',
            'Email response: < 4 hours'
          ]
        },
        {
          'title': 'Special Needs Assistance',
          'icon': Icons.accessible_outlined,
          'points': [
            'Wheelchair accessibility',
            'Large print documents available',
            'Sign language interpreter on call',
            'Priority queue for elderly'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Service Manual', 'icon': Icons.menu_book},
        {'title': 'FAQ Guide', 'icon': Icons.question_answer},
        {'title': 'Feedback Forms', 'icon': Icons.feedback},
        {'title': 'Training Videos', 'icon': Icons.video_library},
      ]
    },
    'Transaction Processing': {
      'title': 'Transaction Processing',
      'description': 'Accurate and secure processing of banking transactions including deposits, withdrawals, and transfers.',
      'sections': [
        {
          'title': 'Cash Handling',
          'icon': Icons.money_outlined,
          'points': [
            'Count cash twice before customer',
            'Use currency counting machines',
            'Verify denomination authenticity',
            'Record serial numbers for large notes'
          ]
        },
        {
          'title': 'Digital Transactions',
          'icon': Icons.phone_iphone_outlined,
          'points': [
            'NEFT/RTGS verification steps',
            'UPI transaction limits',
            'IMPS processing rules',
            'Digital receipt generation'
          ]
        },
        {
          'title': 'Error Correction',
          'icon': Icons.error_outline,
          'points': [
            'Immediate supervisor notification',
            'Transaction reversal procedures',
            'Customer compensation policy',
            'Incident documentation'
          ]
        },
        {
          'title': 'Compliance Checks',
          'icon': Icons.verified_user_outlined,
          'points': [
            'KYC verification for large transactions',
            'AML screening procedures',
            'Suspicious activity reporting',
            'Daily transaction limits'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Process Manual', 'icon': Icons.book},
        {'title': 'Error Codes', 'icon': Icons.code},
        {'title': 'Forms Library', 'icon': Icons.library_books},
        {'title': 'Compliance Guide', 'icon': Icons.security},
      ]
    },
    'Risk Assessment': {
      'title': 'Risk Assessment',
      'description': 'Identifying, analyzing, and mitigating banking risks including credit, market, and operational risks.',
      'sections': [
        {
          'title': 'Credit Risk Analysis',
          'icon': Icons.assessment_outlined,
          'points': [
            'Credit score evaluation',
            'Debt-to-income ratio calculation',
            'Collateral valuation methods',
            'Industry risk classification'
          ]
        },
        {
          'title': 'Market Risk Management',
          'icon': Icons.trending_up_outlined,
          'points': [
            'Interest rate risk monitoring',
            'Foreign exchange exposure',
            'Liquidity risk assessment',
            'Investment portfolio analysis'
          ]
        },
        {
          'title': 'Operational Risk Controls',
          'icon': Icons.settings_outlined,
          'points': [
            'System failure procedures',
            'Fraud detection mechanisms',
            'Business continuity plans',
            'Internal audit requirements'
          ]
        },
        {
          'title': 'Reporting Standards',
          'icon': Icons.bar_chart_outlined,
          'points': [
            'Daily risk dashboard',
            'Weekly risk committee reports',
            'Monthly regulatory filings',
            'Quarterly risk assessment'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Risk Calculator', 'icon': Icons.calculate},
        {'title': 'Assessment Forms', 'icon': Icons.description},
        {'title': 'Policy Manual', 'icon': Icons.policy},
        {'title': 'Case Studies', 'icon': Icons.cases},
      ]
    },
    'Compliance Knowledge': {
      'title': 'Compliance Knowledge',
      'description': 'Understanding and implementing banking regulations, policies, and legal requirements.',
      'sections': [
        {
          'title': 'Regulatory Framework',
          'icon': Icons.gavel_outlined,
          'points': [
            'RBI Act 1934 provisions',
            'Banking Regulation Act 1949',
            'FEMA 1999 regulations',
            'Prevention of Money Laundering Act'
          ]
        },
        {
          'title': 'Documentation Requirements',
          'icon': Icons.description_outlined,
          'points': [
            'KYC documentation checklist',
            'Transaction reporting forms',
            'Audit trail maintenance',
            'Record retention policies'
          ]
        },
        {
          'title': 'Training Requirements',
          'icon': Icons.school_outlined,
          'points': [
            'Annual compliance training',
            'AML/KYC refresher courses',
            'Fraud prevention workshops',
            'Regulatory updates briefing'
          ]
        },
        {
          'title': 'Monitoring Procedures',
          'icon': Icons.monitor_outlined,
          'points': [
            'Daily transaction monitoring',
            'Weekly compliance checks',
            'Monthly risk assessments',
            'Quarterly internal audits'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Compliance Manual', 'icon': Icons.book},
        {'title': 'Regulation Guide', 'icon': Icons.gavel},
        {'title': 'Training Modules', 'icon': Icons.video_library},
        {'title': 'Checklists', 'icon': Icons.checklist},
      ]
    },
    'System Operations': {
      'title': 'System Operations',
      'description': 'Core banking system operations, troubleshooting, and technical support procedures.',
      'sections': [
        {
          'title': 'Core Banking Systems',
          'icon': Icons.computer_outlined,
          'points': [
            'Finacle navigation and operations',
            'Transaction posting procedures',
            'Account maintenance functions',
            'Report generation methods'
          ]
        },
        {
          'title': 'Troubleshooting Guides',
          'icon': Icons.build_outlined,
          'points': [
            'System login issues',
            'Transaction processing errors',
            'Report generation problems',
            'Connectivity issues resolution'
          ]
        },
        {
          'title': 'Security Protocols',
          'icon': Icons.security_outlined,
          'points': [
            'Password change every 90 days',
            'Two-factor authentication mandatory',
            'VPN access for remote work',
            'Data backup procedures'
          ]
        },
        {
          'title': 'Support Channels',
          'icon': Icons.support_agent_outlined,
          'points': [
            'IT helpdesk contact procedures',
            'Priority ticket escalation',
            'Emergency support protocols',
            'System outage procedures'
          ]
        }
      ],
      'quickActions': [
        {'title': 'System Manual', 'icon': Icons.computer},
        {'title': 'Troubleshooting', 'icon': Icons.build},
        {'title': 'User Guides', 'icon': Icons.help_outline},
        {'title': 'Contact Support', 'icon': Icons.contact_support},
      ]
    },
    'Document Verification': {
      'title': 'Document Verification',
      'description': 'Procedures for verifying customer documents, detecting fraud, and ensuring compliance.',
      'sections': [
        {
          'title': 'Verification Protocols',
          'icon': Icons.verified_outlined,
          'points': [
            'Physical document inspection',
            'Digital verification methods',
            'Signature verification procedures',
            'Photograph matching guidelines'
          ]
        },
        {
          'title': 'Fraud Detection',
          'icon': Icons.warning_outlined,
          'points': [
            'Forged document indicators',
            'Tampered document detection',
            'Expired document identification',
            'Suspicious pattern recognition'
          ]
        },
        {
          'title': 'Compliance Requirements',
          'icon': Icons.assignment_outlined,
          'points': [
            'Minimum document requirements',
            'Additional verification triggers',
            'Exception handling procedures',
            'Document retention policies'
          ]
        },
        {
          'title': 'Technology Tools',
          'icon': Icons.scanner_outlined,
          'points': [
            'Document scanning procedures',
            'OCR verification methods',
            'Biometric verification systems',
            'Digital signature validation'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Verification Guide', 'icon': Icons.verified_user},
        {'title': 'Fraud Indicators', 'icon': Icons.warning},
        {'title': 'Document Templates', 'icon': Icons.description},
        {'title': 'Training Videos', 'icon': Icons.video_library},
      ]
    },
    'Financial Analysis': {
      'title': 'Financial Analysis',
      'description': 'Financial statement analysis, ratio calculations, and credit assessment techniques.',
      'sections': [
        {
          'title': 'Financial Ratios',
          'icon': Icons.calculate_outlined,
          'points': [
            'Liquidity ratio calculations',
            'Profitability ratio analysis',
            'Solvency ratio assessment',
            'Efficiency ratio evaluation'
          ]
        },
        {
          'title': 'Cash Flow Analysis',
          'icon': Icons.trending_up_outlined,
          'points': [
            'Operating cash flow calculation',
            'Investing cash flow analysis',
            'Financing cash flow assessment',
            'Free cash flow determination'
          ]
        },
        {
          'title': 'Credit Assessment',
          'icon': Icons.credit_score_outlined,
          'points': [
            'Credit score interpretation',
            'Debt capacity analysis',
            'Collateral evaluation methods',
            'Repayment capacity assessment'
          ]
        },
        {
          'title': 'Reporting Standards',
          'icon': Icons.summarize_outlined,
          'points': [
            'Financial statement preparation',
            'Analysis report formatting',
            'Risk assessment documentation',
            'Recommendation presentation'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Analysis Tools', 'icon': Icons.calculate},
        {'title': 'Report Templates', 'icon': Icons.description},
        {'title': 'Case Studies', 'icon': Icons.cases},
        {'title': 'Training Modules', 'icon': Icons.school},
      ]
    }
  };

  void _handleLogout() {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false, // Remove all routes
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 280,
      color: sidebarBackground,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(Icons.account_balance, color: primaryColor, size: 36),
                  const SizedBox(width: 12),
                  Text(
                    'BANK AI',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Skill Development',
                style: TextStyle(
                  fontSize: 16,
                  color: lightTextColor,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Back Button
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: accentColor, width: 1.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back, size: 20, color: primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        'Back to Overview',
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Skill Info
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primaryColor, width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.skill.emoji,
                          style: const TextStyle(fontSize: 32),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            widget.skill.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _skillContent[widget.skill.title]?['description'] as String? ?? 
                      'Professional banking skill development and training materials.',
                      style: TextStyle(
                        fontSize: 14,
                        color: lightTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Chat with AI Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showChat = true;
                    _chatQuery = "Tell me about ${widget.skill.title} skills";
                    _chatContext = widget.skill.title;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.smart_toy_outlined, size: 20),
                    SizedBox(width: 8),
                    Text('Ask AI Assistant', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final content = _skillContent[widget.skill.title];
    final defaultContent = {
      'title': widget.skill.title,
      'description': 'Professional banking skill development and training materials.',
      'sections': [
        {
          'title': 'Core Competencies',
          'icon': Icons.star_outline,
          'points': [
            'Develop fundamental banking knowledge',
            'Master operational procedures',
            'Understand compliance requirements',
            'Apply risk management principles'
          ]
        },
        {
          'title': 'Training Resources',
          'icon': Icons.school_outlined,
          'points': [
            'Complete online training modules',
            'Attend skill development workshops',
            'Review case studies and examples',
            'Practice with simulation exercises'
          ]
        },
        {
          'title': 'Assessment Methods',
          'icon': Icons.assessment_outlined,
          'points': [
            'Monthly skill assessments',
            'Practical performance evaluation',
            'Customer feedback analysis',
            'Supervisor review sessions'
          ]
        },
        {
          'title': 'Career Development',
          'icon': Icons.trending_up_outlined,
          'points': [
            'Set skill development goals',
            'Track progress and achievements',
            'Identify areas for improvement',
            'Plan advancement opportunities'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Training Modules', 'icon': Icons.video_library},
        {'title': 'Study Materials', 'icon': Icons.menu_book},
        {'title': 'Practice Tests', 'icon': Icons.quiz},
        {'title': 'Career Guide', 'icon': Icons.trending_up},
      ]
    };

    final displayContent = content ?? defaultContent;
    final sections = (displayContent['sections'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
    final quickActions = (displayContent['quickActions'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    widget.skill.emoji,
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayContent['title'] as String? ?? widget.skill.title,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      displayContent['description'] as String? ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: lightTextColor,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 40),
          
          // Quick Action Buttons
          Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: quickActions.map((action) {
              return Container(
                width: 180,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardBackground,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: accentColor, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getIconFromMap(action['icon']) ?? Icons.help_outline,
                      size: 32,
                      color: primaryColor,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      action['title'] as String? ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          
          const SizedBox(height: 40),
          
          // Sections
          Text(
            'Skill Details',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          
          ...sections.map((section) {
            return Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: cardBackground,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: accentColor, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _getIconFromMap(section['icon']) ?? Icons.help_outline,
                        size: 28,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        section['title'] as String? ?? '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<Widget>.from(
                      (section['points'] as List<dynamic>?)?.map((point) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 8,
                                color: primaryColor,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  point.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }) ?? [],
                    ),
                  ),
                ],
              ),
            );
          }),
          
          const SizedBox(height: 40),
          
          // Footer Note
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: accentColor, width: 1.5),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 24, color: primaryColor),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skill Development Tracking',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Track your progress and complete training modules to enhance your banking skills.',
                        style: TextStyle(
                          fontSize: 12,
                          color: lightTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to safely get icons from the map
  IconData? _getIconFromMap(dynamic iconData) {
    if (iconData == null) return null;
    if (iconData is IconData) return iconData;
    return null;
  }

  Widget _buildChatInterface() {
    return Column(
      children: [
        // Chat Header
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: cardBackground,
            border: Border(
              bottom: BorderSide(color: accentColor, width: 1.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.smart_toy_outlined,
                      color: primaryColor,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bank AI Assistant',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: textColor,
                        ),
                      ),
                      Text(
                        'Skill: ${widget.skill.title}',
                        style: TextStyle(
                          fontSize: 14,
                          color: lightTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.close, color: lightTextColor, size: 24),
                onPressed: () {
                  setState(() {
                    _showChat = false;
                  });
                },
              ),
            ],
          ),
        ),
        
        // Chat Messages Area
        Expanded(
          child: ChatAssistant(
            initialQuery: _chatQuery,
            contextTopic: _chatContext,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar
          _buildSidebar(),
          
          // Main Content Area
          Expanded(
            child: Container(
              color: backgroundColor,
              child: Column(
                children: [
                  // Top Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                    decoration: BoxDecoration(
                      color: cardBackground,
                      border: Border(
                        bottom: BorderSide(color: accentColor, width: 1.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.skill.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.notifications_outlined, 
                                  color: lightTextColor, size: 26),
                              onPressed: () {},
                            ),
                            const SizedBox(width: 6),
                            // Logout button
                            IconButton(
                              icon: Icon(Icons.logout, 
                                  color: lightTextColor, size: 22),
                              onPressed: _handleLogout,
                              tooltip: 'Logout',
                            ),
                            const SizedBox(width: 6),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: primaryColor,
                              child: Icon(Icons.person, size: 22, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Main Content
                  Expanded(
                    child: _showChat
                        ? _buildChatInterface()
                        : _buildContent(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}