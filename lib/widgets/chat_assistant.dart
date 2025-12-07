import 'package:flutter/material.dart';

// Color Theme - Ocean Blue
const Color primaryColor = Color(0xFF0077B6);
const Color secondaryColor = Color(0xFF00B4D8);
const Color accentColor = Color(0xFF90E0EF);
const Color backgroundColor = Color(0xFFCAF0F8);
const Color textColor = Color(0xFF023047);
const Color lightTextColor = Color(0xFF64748B);

class ChatAssistant extends StatefulWidget {
  final String? initialQuery;
  final String? contextTopic;
  
  const ChatAssistant({Key? key, this.initialQuery, this.contextTopic}) : super(key: key);

  @override
  State<ChatAssistant> createState() => _ChatAssistantState();
}

class _ChatAssistantState extends State<ChatAssistant> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    const ChatMessage(
      text: 'Hello! I\'m Bank AI Assistant. How can I help you with banking operations today?',
      isUser: false,
      time: 'Just now',
    ),
  ];

  // Comprehensive banking knowledge database
  final Map<String, Map<String, dynamic>> _bankingKnowledge = {
    // Branch Operations
    'Branch Operations': {
      'keyPoints': [
        'Operating Hours: 10 AM - 4 PM (Mon-Fri), 10 AM - 1 PM (Sat)',
        'Cash handling limit per teller: ₹10 lakhs per day',
        'Dual control required for vault access',
        'Daily cash reconciliation by 5 PM',
        'Customer queue time target: < 15 minutes'
      ],
      'procedures': [
        'Morning: Cash verification, ATM replenishment',
        'Afternoon: Transaction processing, customer service',
        'Evening: Cash balancing, report generation'
      ],
      'compliance': 'RBI Branch Banking Guidelines 2022'
    },

    // KYC & Account Opening
    'KYC Guidelines': {
      'keyPoints': [
        'Mandatory for all new accounts',
        'Aadhaar + PAN for individuals',
        'Company PAN + GST for businesses',
        'Video KYC available for digital onboarding',
        'Periodic updation every 10 years'
      ],
      'documents': {
        'Individual': ['Aadhaar', 'PAN', 'Passport/Voter ID', 'Recent photo'],
        'Business': ['Company PAN', 'GST certificate', 'Board resolution', 'MOA/AOA']
      },
      'compliance': 'RBI KYC Master Direction 2021'
    },

    // Loan Policies
    'Loan Policies': {
      'personalLoan': {
        'amount': '₹50,000 - ₹20,00,000',
        'tenure': '1-5 years',
        'interest': '10.5% - 15% p.a.',
        'documents': ['3 months salary slips', '6 months bank statements', 'KYC']
      },
      'homeLoan': {
        'amount': 'Up to ₹5 crores',
        'tenure': '5-30 years',
        'interest': '8.4% - 9.5% p.a.',
        'margin': '10-20%'
      },
      'approvalProcess': 'Credit check → Document verification → Sanction → Disbursement'
    },

    // Transaction Rules
    'Transaction Limits': {
      'dailyLimits': {
        'ATM Withdrawal': '₹50,000',
        'NEFT/RTGS': '₹25,00,000',
        'UPI': '₹1,00,000',
        'Cash Deposit': '₹2,00,000'
      },
      'charges': {
        'IMPS': '₹5 + GST (up to ₹1 lakh), ₹15 + GST (above ₹1 lakh)',
        'Cheque Bounce': '₹500 per instance',
        'DD Cancellation': '₹100 + GST'
      }
    },

    // HR & Payroll
    'HR & Payroll': {
      'workingHours': '9:30 AM - 6:30 PM (includes 1 hour lunch)',
      'leavePolicy': {
        'Casual Leave': '12 days/year',
        'Sick Leave': '12 days/year',
        'Earned Leave': '30 days/year'
      },
      'payroll': {
        'Processing Date': 'Last working day of month',
        'Advances': 'Up to 50% of net salary',
        'Reimbursements': 'Submit by 25th of each month'
      },
      'codeOfConduct': 'Maintain confidentiality, no insider trading, professional attire'
    },

    // Risk & Compliance
    'Risk & Compliance': {
      'amlPolicy': [
        'STR filing for transactions > ₹10 lakhs',
        'KYM for high-risk customers',
        'Monthly risk assessment reports',
        'Annual compliance audit'
      ],
      'fraudPrevention': [
        'Dual authorization for > ₹5 lakhs transactions',
        'Regular security training',
        'Whistleblower protection',
        '24/7 fraud monitoring'
      ],
      'regulations': ['RBI Act 1934', 'Banking Regulation Act 1949', 'FEMA 1999']
    },

    // IT & Systems
    'IT Support': {
      'systemIssues': [
        'Core banking downtime: Contact NOC at 1800-XXX-XXXX',
        'Internet connectivity: ISP escalation within 30 mins',
        'Hardware failure: Replacement within 24 hours'
      ],
      'security': [
        'Password change every 90 days',
        'Two-factor authentication mandatory',
        'No personal devices on bank network',
        'Regular vulnerability scans'
      ],
      'software': 'Finacle 10.2.16, SWIFT Alliance 7.3, Antivirus: Symantec'
    },

    // Treasury Management
    'Treasury & Cash Flow': {
      'cashManagement': [
        'Minimum cash reserve: 4% of NDTL',
        'Inter-branch transfer limit: ₹5 crores',
        'Cash forecasting daily by 11 AM'
      ],
      'investments': [
        'SLR: 18.5% in government securities',
        'Call money lending: Overnight only',
        'Repo operations: Through CCIL'
      ]
    },

    // Foreign Exchange
    'Foreign Exchange': {
      'limits': {
        'Individuals': 'USD 250,000 per financial year',
        'Business': 'As per LRS with proper documentation',
        'Education': 'No limit with admission proof'
      },
      'rates': 'Updated twice daily: 10 AM & 3 PM',
      'documentation': ['Form A2', 'PAN', 'Passport', 'Purpose declaration']
    },

    // Sales & Marketing
    'Sales & Marketing': {
      'targets': {
        'Retail RM': '₹5 crores deposits/month',
        'Corporate RM': '₹50 crores deposits/month',
        'Loan Officer': '₹2 crores disbursals/month'
      },
      'policies': [
        'No mis-selling of insurance products',
        'Transparent fee disclosure',
        'Customer suitability assessment',
        'Cooling-off period for all products'
      ]
    },

    // Account Services
    'Account Services': {
      'types': {
        'Savings': 'Min balance ₹5,000, 4% interest',
        'Current': 'Min balance ₹10,000, no interest',
        'Salary': 'Zero balance, free transactions',
        'NRI': 'NRO/NRE/FCNR options available'
      },
      'closures': {
        'Savings': 'Immediate, balance transfer',
        'Current': '7 days notice, clearance required',
        'Loan': 'After full repayment, NOC issued'
      }
    }
  };

  @override
  void initState() {
    super.initState();
    // Process initial query with context
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.contextTopic != null && widget.contextTopic!.isNotEmpty) {
        _handleContextTopic(widget.contextTopic!);
      } else if (widget.initialQuery != null && widget.initialQuery!.isNotEmpty) {
        _processQuery(widget.initialQuery!);
      }
    });
  }

  // Intent detection function
  String _detectIntent(String message) {
    final lowerMessage = message.toLowerCase();
    
    // Greetings
    if (lowerMessage.contains('hi') || 
        lowerMessage.contains('hello') || 
        lowerMessage.contains('hey') ||
        lowerMessage.contains('good morning') ||
        lowerMessage.contains('good afternoon') ||
        lowerMessage.contains('good evening')) {
      return 'greeting';
    }
    
    // Casual conversation
    if (lowerMessage.contains('thank') ||
        lowerMessage.contains('thanks') ||
        lowerMessage.contains('ok') ||
        lowerMessage.contains('okay') ||
        lowerMessage.contains('who are you') ||
        lowerMessage.contains('what can you do') ||
        lowerMessage.contains('how are you')) {
      return 'casual';
    }
    
    // Banking topics - check for keywords
    final bankingKeywords = [
      'kyc', 'loan', 'transaction', 'limit', 'branch', 'operation',
      'hr', 'payroll', 'risk', 'compliance', 'it', 'system', 'account',
      'foreign', 'exchange', 'forex', 'cash', 'treasury', 'sales',
      'marketing', 'security', 'fraud', 'aml', 'customer', 'service',
      'document', 'procedure', 'process', 'guideline', 'policy', 'rbi',
      'banking', 'deposit', 'withdrawal', 'neft', 'rtgs', 'upi', 'atm',
      'credit', 'debit', 'balance', 'interest', 'rate', 'fee', 'charge'
    ];
    
    for (var keyword in bankingKeywords) {
      if (lowerMessage.contains(keyword)) {
        return 'banking';
      }
    }
    
    // Default to casual if no specific intent detected
    return 'casual';
  }

  void _handleContextTopic(String topic) {
    final response = _getTopicResponse(topic);
    _addUserMessage("Tell me about $topic");
    _addAIResponse(response);
  }

  String _getTopicResponse(String topic) {
    final knowledge = _bankingKnowledge[topic];
    if (knowledge == null) {
      // FIX: Return a default response instead of calling _getGenericBankingResponse
      return "I can provide information about various banking topics including:\n\n" +
             "• KYC Compliance & Customer Verification\n" +
             "• Loan Processing & Credit Policies\n" +
             "• Transaction Rules & Limits\n" +
             "• Branch Operations & Procedures\n" +
             "• Risk Management & Compliance\n" +
             "• HR Policies & Payroll\n" +
             "• IT Support & Security\n\n" +
             "What specific banking topic would you like to learn about?";
    }

    final buffer = StringBuffer();
    buffer.write('**${topic.toUpperCase()}**\n\n');
    
    knowledge.forEach((key, value) {
      if (key != 'compliance') {
        buffer.write('• ${_formatKey(key)}: ');
        
        if (value is List) {
          buffer.writeAll(value.map((item) => '\n  ◦ $item'), '');
        } else if (value is Map) {
          value.forEach((subKey, subValue) {
            buffer.write('\n  ◦ $subKey: $subValue');
          });
        } else {
          buffer.write('$value');
        }
        buffer.write('\n\n');
      }
    });
    
    if (knowledge['compliance'] != null) {
      buffer.write('📋 **Compliance**: ${knowledge['compliance']}\n\n');
    }
    
    buffer.write('*Need more specific details? Feel free to ask!*');
    
    return buffer.toString();
  }

  String _formatKey(String key) {
    return key.replaceAllMapped(RegExp(r'[A-Z]'), (match) => ' ${match.group(0)}').trim();
  }

  String _getGenericBankingResponse(String query) {
    final lowerQuery = query.toLowerCase();
    
    // FIX: Direct mapping without recursion
    if (lowerQuery.contains('kyc') || lowerQuery.contains('know your customer')) {
      return _getTopicResponse('KYC Guidelines');
    } else if (lowerQuery.contains('loan')) {
      return _getTopicResponse('Loan Policies');
    } else if (lowerQuery.contains('transaction') || lowerQuery.contains('limit')) {
      return _getTopicResponse('Transaction Limits');
    } else if (lowerQuery.contains('hr') || lowerQuery.contains('payroll')) {
      return _getTopicResponse('HR & Payroll');
    } else if (lowerQuery.contains('risk') || lowerQuery.contains('compliance')) {
      return _getTopicResponse('Risk & Compliance');
    } else if (lowerQuery.contains('branch') || lowerQuery.contains('operation')) {
      return _getTopicResponse('Branch Operations');
    } else if (lowerQuery.contains('it') || lowerQuery.contains('system')) {
      return _getTopicResponse('IT Support');
    } else if (lowerQuery.contains('account') || lowerQuery.contains('service')) {
      return _getTopicResponse('Account Services');
    } else if (lowerQuery.contains('foreign') || lowerQuery.contains('forex')) {
      return _getTopicResponse('Foreign Exchange');
    } else if (lowerQuery.contains('sales') || lowerQuery.contains('marketing')) {
      return _getTopicResponse('Sales & Marketing');
    } else if (lowerQuery.contains('cash') || lowerQuery.contains('treasury')) {
      return _getTopicResponse('Treasury & Cash Flow');
    }
    
    // Professional banking response - FIXED: No recursion
    return "I can help you with various banking topics including:\n\n" +
           "• **KYC Compliance** - Customer verification processes\n" +
           "• **Loan Processing** - Eligibility, rates, and procedures\n" +
           "• **Transaction Rules** - Limits, charges, and authorization\n" +
           "• **Branch Operations** - Daily banking procedures\n" +
           "• **Risk Management** - AML, fraud prevention\n" +
           "• **HR Policies** - Payroll, leave management\n" +
           "• **IT Support** - System issues and security\n\n" +
           "What specific banking area would you like to know about?";
  }

  String _getGreetingResponse() {
    final hour = DateTime.now().hour;
    String greeting;
    
    if (hour < 12) {
      greeting = 'Good morning!';
    } else if (hour < 17) {
      greeting = 'Good afternoon!';
    } else {
      greeting = 'Good evening!';
    }
    
    return '$greeting How can I assist you with banking operations today?';
  }

  String _getCasualResponse(String message) {
    final lowerMessage = message.toLowerCase();
    
    if (lowerMessage.contains('thank')) {
      return "You're welcome! I'm here to help with any banking questions you might have.";
    } else if (lowerMessage.contains('ok') || lowerMessage.contains('okay')) {
      return "Alright! Let me know if you need assistance with banking procedures.";
    } else if (lowerMessage.contains('who are you')) {
      return "I'm Bank AI Assistant, your intelligent banking companion. I help bank employees with procedures, compliance, and daily operations.";
    } else if (lowerMessage.contains('what can you do')) {
      return "I can help you with:\n• Banking procedures and guidelines\n• KYC and compliance questions\n• Loan processing information\n• Transaction rules and limits\n• HR and payroll queries\n• IT system support\n\nJust ask me anything banking-related!";
    } else if (lowerMessage.contains('how are you')) {
      return "I'm doing great, ready to help you with banking operations! How can I assist you today?";
    }
    
    return "I'm here to help with banking operations. What would you like to know about?";
  }

  void _processQuery(String query) {
    final intent = _detectIntent(query);
    String response;
    
    switch (intent) {
      case 'greeting':
        response = _getGreetingResponse();
        break;
      case 'casual':
        response = _getCasualResponse(query);
        break;
      case 'banking':
        response = _getGenericBankingResponse(query);
        break;
      default:
        response = _getCasualResponse(query);
    }
    
    _addUserMessage(query);
    _addAIResponse(response);
  }

  void _addUserMessage(String text) {
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isUser: true,
        time: _getCurrentTime(),
      ));
    });
  }

  void _addAIResponse(String response) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _messages.add(ChatMessage(
            text: response,
            isUser: false,
            time: _getCurrentTime(),
          ));
        });
      }
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  void _sendMessage() {
    final userMessage = _messageController.text.trim();
    if (userMessage.isEmpty) return;

    _processQuery(userMessage);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Messages Area
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            reverse: false,
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              return ChatBubble(message: message);
            },
          ),
        ),
        
        // Input Area - FIXED SUBMISSION
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: accentColor, width: 1.5),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: accentColor, width: 1.5),
                  ),
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: lightTextColor, fontSize: 16),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    style: TextStyle(fontSize: 16, color: textColor),
                    onSubmitted: (value) {
                      // FIX: Ensure Enter key submits message
                      _sendMessage();
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // FIX: Ensure Send button submits message
              GestureDetector(
                onTap: _sendMessage,
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(Icons.send, color: Colors.white, size: 22),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final String time;

  const ChatMessage({
    required this.text,
    required this.isUser,
    required this.time,
  });
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.smart_toy_outlined,
                size: 22,
                color: primaryColor,
              ),
            ),
          if (!message.isUser) const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: message.isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? primaryColor
                        : Color(0xFFE0F7FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: SelectableText(
                    message.text,
                    style: TextStyle(
                      color: message.isUser ? Colors.white : textColor,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  message.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: lightTextColor,
                  ),
                ),
              ],
            ),
          ),
          if (message.isUser) const SizedBox(width: 12),
          if (message.isUser)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.person,
                size: 22,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}