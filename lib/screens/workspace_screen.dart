// lib/screens/workspace_screen.dart
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

class WorkspaceScreen extends StatefulWidget {
  final Space space;
  
  const WorkspaceScreen({Key? key, required this.space}) : super(key: key);

  @override
  State<WorkspaceScreen> createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  bool _showChat = false;
  String _chatQuery = '';
  String _chatContext = '';
  
  // Workspace content based on the space type
  final Map<String, Map<String, dynamic>> _workspaceContent = {
    'Branch Operations': {
      'title': 'Branch Operations',
      'description': 'Complete guidelines for daily branch operations, customer servicing, cash handling, and compliance procedures.',
      'sections': [
        {
          'title': 'Customer Servicing Workflow',
          'icon': Icons.people_outlined,
          'points': [
            'Welcome customers within 30 seconds of arrival',
            'Queue management system implementation',
            'Priority service for senior citizens & differently-abled',
            'Customer feedback collection process'
          ]
        },
        {
          'title': 'Cash Handling Rules',
          'icon': Icons.money_outlined,
          'points': [
            'Teller cash limit: ₹10 lakhs per day',
            'Dual control for vault access',
            'Daily cash reconciliation by 5 PM',
            'Cash deposit verification process'
          ]
        },
        {
          'title': 'Teller Operations',
          'icon': Icons.account_balance_outlined,
          'points': [
            'Transaction processing time: < 5 minutes',
            'Error logging and correction procedure',
            'End-of-day balancing checklist',
            'Receipt and documentation handling'
          ]
        },
        {
          'title': 'Vault Management',
          'icon': Icons.lock_outlined,
          'points': [
            'Biometric + key access required',
            'Audit trail maintenance',
            'Emergency access procedures',
            'Cash movement documentation'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Daily Checklist', 'icon': Icons.checklist},
        {'title': 'Teller Manual', 'icon': Icons.menu_book},
        {'title': 'Forms Library', 'icon': Icons.library_books},
        {'title': 'Compliance Docs', 'icon': Icons.description},
      ]
    },
    'KYC Guidelines': {
      'title': 'KYC Guidelines',
      'description': 'Customer verification procedures, document requirements, compliance standards, and periodic review processes.',
      'sections': [
        {
          'title': 'ID Proof Requirements',
          'icon': Icons.badge_outlined,
          'points': [
            'Aadhaar card (mandatory)',
            'PAN card for all accounts',
            'Passport/Voter ID as address proof',
            'Recent photograph'
          ]
        },
        {
          'title': 'Verification Steps',
          'icon': Icons.verified_user_outlined,
          'points': [
            'Document authenticity check',
            'Photo match verification',
            'Address confirmation',
            'Digital signature collection'
          ]
        },
        {
          'title': 'Customer Update Rules',
          'icon': Icons.update_outlined,
          'points': [
            'Annual review for high-risk customers',
            'Bi-annual for medium risk',
            'Address update within 7 days',
            'Photograph update every 10 years'
          ]
        },
        {
          'title': 'KYC Forms',
          'icon': Icons.description_outlined,
          'points': [
            'Form 60 for no-PAN customers',
            'Form 61 for agricultural income',
            'Customer information sheet',
            'Risk categorization form'
          ]
        }
      ],
      'quickActions': [
        {'title': 'KYC Forms', 'icon': Icons.description},
        {'title': 'Exception Cases', 'icon': Icons.error_outline},
        {'title': 'Video KYC Guide', 'icon': Icons.video_call},
        {'title': 'Compliance Rules', 'icon': Icons.gavel},
      ]
    },
    'Loan Policies': {
      'title': 'Loan Policies',
      'description': 'Complete loan processing procedures, eligibility criteria, risk assessment, and disbursement guidelines.',
      'sections': [
        {
          'title': 'Eligibility Criteria',
          'icon': Icons.rule_outlined,
          'points': [
            'Minimum income: ₹25,000/month',
            'Credit score: 750+',
            'Employment stability: 2+ years',
            'Age: 21-58 years'
          ]
        },
        {
          'title': 'Approval Workflow',
          'icon': Icons.work_outlined,
          'points': [
            'Application screening',
            'Document verification',
            'Credit appraisal',
            'Sanction committee review'
          ]
        },
        {
          'title': 'Risk Assessment',
          'icon': Icons.assessment_outlined,
          'points': [
            'Debt-to-income ratio analysis',
            'Collateral valuation',
            'Industry risk assessment',
            'Customer behavior analysis'
          ]
        },
        {
          'title': 'Documentation Checklist',
          'icon': Icons.checklist_outlined,
          'points': [
            '3 months salary slips',
            '6 months bank statements',
            'Identity & address proof',
            'Employment certificate'
          ]
        }
      ],
      'quickActions': [
        {'title': 'EMI Calculator', 'icon': Icons.calculate},
        {'title': 'Forms Library', 'icon': Icons.library_books},
        {'title': 'Rate Sheet', 'icon': Icons.rate_review},
        {'title': 'Checklist', 'icon': Icons.checklist},
      ]
    },
    'HR & Payroll': {
      'title': 'HR & Payroll',
      'description': 'Employee policies, leave management, payroll processing, and compliance procedures.',
      'sections': [
        {
          'title': 'Employee Leave Rules',
          'icon': Icons.calendar_today_outlined,
          'points': [
            'Casual Leave: 12 days/year',
            'Sick Leave: 12 days/year',
            'Earned Leave: 30 days/year',
            'Maternity Leave: 6 months'
          ]
        },
        {
          'title': 'Attendance System',
          'icon': Icons.access_time_outlined,
          'points': [
            'Biometric check-in: 9:30 AM',
            'Flexi hours for special needs',
            'Overtime approval process',
            'Leave application procedure'
          ]
        },
        {
          'title': 'Salary Structure',
          'icon': Icons.monetization_on_outlined,
          'points': [
            'Basic salary: 40% of CTC',
            'HRA: 50% of basic',
            'Special allowances',
            'Performance bonuses'
          ]
        },
        {
          'title': 'Onboarding Process',
          'icon': Icons.person_add_outlined,
          'points': [
            'Background verification',
            'Document submission',
            'Bank account setup',
            'Training program assignment'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Leave Forms', 'icon': Icons.edit_document},
        {'title': 'Pay Slips', 'icon': Icons.receipt_long},
        {'title': 'Policies', 'icon': Icons.policy},
        {'title': 'Tax Forms', 'icon': Icons.description},
      ]
    },
    'Risk & Compliance': {
      'title': 'Risk & Compliance',
      'description': 'Fraud detection, compliance reporting, audit procedures, and regulatory requirements.',
      'sections': [
        {
          'title': 'Reporting Rules',
          'icon': Icons.report_outlined,
          'points': [
            'STR filing: Transactions > ₹10 lakhs',
            'CTR: Monthly aggregate reports',
            'Fraud reports within 24 hours',
            'Compliance dashboard updates'
          ]
        },
        {
          'title': 'Fraud Detection Alerts',
          'icon': Icons.warning_outlined,
          'points': [
            'Unusual transaction patterns',
            'Multiple account access attempts',
            'High-value cash transactions',
            'Cross-border transaction monitoring'
          ]
        },
        {
          'title': 'Audit Procedures',
          'icon': Icons.assignment_outlined, // Changed from audit_outlined
          'points': [
            'Internal audit quarterly',
            'External audit annually',
            'Surprise cash verification',
            'System access audit logs'
          ]
        },
        {
          'title': 'Compliance Training',
          'icon': Icons.school_outlined,
          'points': [
            'Monthly training sessions',
            'AML/KYC refresher courses',
            'Fraud prevention workshops',
            'Regulatory updates briefings'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Report Forms', 'icon': Icons.description},
        {'title': 'Compliance Docs', 'icon': Icons.library_books},
        {'title': 'Fraud Cases', 'icon': Icons.warning},
        {'title': 'Audit Reports', 'icon': Icons.assignment},
      ]
    },
    'IT Support': {
      'title': 'IT Support',
      'description': 'System troubleshooting, software management, security protocols, and user support.',
      'sections': [
        {
          'title': 'Ticket Management',
          'icon': Icons.support_agent_outlined,
          'points': [
            'Priority 1: Resolution within 1 hour',
            'Priority 2: Resolution within 4 hours',
            'Priority 3: Resolution within 24 hours',
            'Escalation matrix for delays'
          ]
        },
        {
          'title': 'System Troubleshooting',
          'icon': Icons.build_outlined,
          'points': [
            'Core banking system issues',
            'Network connectivity problems',
            'Hardware failure procedures',
            'Software update processes'
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
          'title': 'Software Updates',
          'icon': Icons.update_outlined,
          'points': [
            'Monthly security patches',
            'Quarterly system updates',
            'Annual version upgrades',
            'Emergency update procedures'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Raise Ticket', 'icon': Icons.add_task},
        {'title': 'System Status', 'icon': Icons.monitor_heart},
        {'title': 'User Guides', 'icon': Icons.help_outline},
        {'title': 'Contact Support', 'icon': Icons.contact_support},
      ]
    },
    'Account Services': {
      'title': 'Account Services',
      'description': 'Account opening/closing procedures, debit card issuance, cheque book management, and customer service.',
      'sections': [
        {
          'title': 'Opening/Closing Accounts',
          'icon': Icons.account_balance_wallet_outlined,
          'points': [
            'KYC verification completion',
            'Account type selection',
            'Minimum balance requirements',
            'Account closure documentation'
          ]
        },
        {
          'title': 'Debit Card Policies',
          'icon': Icons.credit_card_outlined,
          'points': [
            'Issuance within 7 working days',
            'Replacement for lost cards',
            'International usage activation',
            'Transaction limits setting'
          ]
        },
        {
          'title': 'Cheque Book Management',
          'icon': Icons.book_outlined,
          'points': [
            'First cheque book free',
            'Subsequent charges apply',
            'Stop payment procedures',
            'Clearing time frames'
          ]
        },
        {
          'title': 'Customer Service',
          'icon': Icons.headset_mic_outlined,
          'points': [
            '24/7 helpline support',
            'Email response within 4 hours',
            'Branch visit appointments',
            'Digital service assistance'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Account Forms', 'icon': Icons.description},
        {'title': 'Fee Structure', 'icon': Icons.attach_money},
        {'title': 'Service Request', 'icon': Icons.request_quote},
        {'title': 'FAQ', 'icon': Icons.question_answer},
      ]
    },
    'Foreign Exchange': {
      'title': 'Foreign Exchange',
      'description': 'Currency exchange procedures, rate management, transaction limits, and compliance documentation.',
      'sections': [
        {
          'title': 'Currency Rules',
          'icon': Icons.currency_exchange_outlined,
          'points': [
            'Acceptable foreign currencies',
            'Exchange rate application',
            'Counterfeit detection procedures',
            'Currency holding limits'
          ]
        },
        {
          'title': 'Rate Management',
          'icon': Icons.trending_up_outlined,
          'points': [
            'Rate updates twice daily',
            'Margin calculation methods',
            'Competitor rate monitoring',
            'Special rate approvals'
          ]
        },
        {
          'title': 'Transaction Limits',
          'icon': Icons.timelapse,
          'points': [
            'Individuals: \$250,000/year',
            'Business: As per LRS limits',
            'Education: Unlimited with proof',
            'Medical: Unlimited with bills'
          ]
        },
        {
          'title': 'Compliance Documentation',
          'icon': Icons.folder_open_outlined,
          'points': [
            'Form A2 submission',
            'PAN card verification',
            'Purpose declaration',
            'Customs declaration forms'
          ]
        }
      ],
      'quickActions': [
        {'title': 'Rate Calculator', 'icon': Icons.calculate},
        {'title': 'Forms', 'icon': Icons.description},
        {'title': 'Limits Chart', 'icon': Icons.bar_chart},
        {'title': 'Compliance', 'icon': Icons.gavel},
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
                'Workspace',
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
              
              // Workspace Info
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
                          widget.space.emoji,
                          style: const TextStyle(fontSize: 32),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            widget.space.title,
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
                      _workspaceContent[widget.space.title]?['description'] as String? ?? '',
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
                    _chatQuery = "Tell me about ${widget.space.title}";
                    _chatContext = widget.space.title;
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
    final content = _workspaceContent[widget.space.title];
    if (content == null) {
      return Center(
        child: Text(
          'Workspace content not found',
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      );
    }

    final sections = (content['sections'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
    final quickActions = (content['quickActions'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];

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
                    widget.space.emoji,
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
                      content['title'] as String? ?? widget.space.title,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content['description'] as String? ?? '',
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
            'Quick Actions',
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
            'Detailed Information',
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
                  child: Text(
                    'For specific queries or additional details, use the "Ask AI Assistant" button on the sidebar.',
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
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
                        'Context: ${widget.space.title}',
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
                          widget.space.title,
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