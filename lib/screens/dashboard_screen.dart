// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:employee_bank_ai/widgets/chat_assistant.dart';
import 'package:employee_bank_ai/data/module_data.dart';
import 'package:employee_bank_ai/screens/workspace_screen.dart';
import 'package:employee_bank_ai/screens/skill_screen.dart';
import 'package:employee_bank_ai/models/module.dart';

// Color Theme - Ocean Blue
const Color primaryColor = Color(0xFF0077B6);
const Color secondaryColor = Color(0xFF00B4D8);
const Color accentColor = Color(0xFF90E0EF);
const Color backgroundColor = Color(0xFFCAF0F8);
const Color textColor = Color(0xFF023047);
const Color lightTextColor = Color(0xFF64748B);
const Color sidebarBackground = Color(0xFFFFFFFF);
const Color cardBackground = Color(0xFFFFFFFF);

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedTab = 0;
  bool _isSearchUsed = false;
  String _lastSearchQuery = '';
  String _contextTopic = '';
  String _currentSpace = 'Overview'; // Track current workspace
  
  // Smart suggestion buttons
  final List<QuickSuggestion> _quickSuggestions = [
    const QuickSuggestion(text: 'What is KYC process?'),
    const QuickSuggestion(text: 'How to process a loan?'),
    const QuickSuggestion(text: 'How to reset customer password?'),
    const QuickSuggestion(text: 'Show today\'s active cases'),
    const QuickSuggestion(text: 'Explain transaction limits'),
    const QuickSuggestion(text: 'HR leave policy'),
    const QuickSuggestion(text: 'IT system issues'),
    const QuickSuggestion(text: 'Fraud prevention steps'),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _handleSearch(String query) {
    if (query.trim().isNotEmpty) {
      setState(() {
        _lastSearchQuery = query;
        _contextTopic = '';
        _isSearchUsed = true;
      });
    }
  }

  void _handleQuickSuggestion(String suggestion) {
    setState(() {
      _lastSearchQuery = suggestion;
      _contextTopic = '';
      _isSearchUsed = true;
    });
  }

  void _handleSpaceSelection(Space space) {
    setState(() {
      _selectedTab = 0; // Switch to Overview tab
      _currentSpace = space.title;
      _lastSearchQuery = "Tell me about ${space.title}";
      _contextTopic = space.title;
      _isSearchUsed = true;
    });
    
    // Navigate to workspace details page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WorkspaceScreen(space: space),
      ),
    );
  }

  void _handleSkillSelection(Skill skill) {
    // Navigate to skill details page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SkillScreen(skill: skill),
      ),
    );
  }

  void _closeChat() {
    setState(() {
      _isSearchUsed = false;
      _contextTopic = '';
    });
  }

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
                'Employee Dashboard',
                style: TextStyle(
                  fontSize: 16,
                  color: lightTextColor,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Navigation
              Column(
                children: [
                  _buildNavItem(Icons.dashboard_outlined, 'Overview', 0),
                  _buildNavItem(Icons.settings_outlined, 'Settings', 1),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Spaces Section
              Text(
                'Workspaces',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Click to access workspace details:',
                style: TextStyle(
                  fontSize: 14,
                  color: lightTextColor,
                ),
              ),
              const SizedBox(height: 12),
              
              // Spaces List - Now clickable to open workspace pages
              Column(
                children: List.generate(allSpaces.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => _handleSpaceSelection(allSpaces[index]),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: _currentSpace == allSpaces[index].title
                              ? accentColor.withOpacity(0.2)
                              : Colors.transparent,
                          border: _currentSpace == allSpaces[index].title
                              ? Border.all(color: primaryColor, width: 1.5)
                              : null,
                        ),
                        child: Row(
                          children: [
                            Text(
                              allSpaces[index].emoji,
                              style: const TextStyle(fontSize: 22),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                allSpaces[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            if (_currentSpace == allSpaces[index].title)
                              Icon(Icons.arrow_forward_ios, size: 16, color: primaryColor),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              
              const SizedBox(height: 24),
              
              // Skills Section
              Text(
                'Skills',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Click to access skill details:',
                style: TextStyle(
                  fontSize: 14,
                  color: lightTextColor,
                ),
              ),
              const SizedBox(height: 12),
              
              // Skills List - Now clickable to open skill pages
              Column(
                children: List.generate(allSkills.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () => _handleSkillSelection(allSkills[index]),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Text(
                              allSkills[index].emoji,
                              style: const TextStyle(fontSize: 22),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                allSkills[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 16, color: primaryColor),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              
              const SizedBox(height: 32),
              
              // Footer note
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: accentColor),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 20, color: primaryColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Go to Settings to configure your workspace',
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
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, int index) {
    bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
          _currentSpace = 'Overview';
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? accentColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? textColor : lightTextColor,
            ),
            const SizedBox(width: 14),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? textColor : lightTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverview() {
    return Column(
      children: [
        // Welcome Message
        Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                  color: lightTextColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'BANK AI Assistant',
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your intelligent banking companion for customer service,\ncompliance, and operational excellence.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: lightTextColor,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        
        // Main Chat Interface
        Expanded(
          child: _isSearchUsed
              ? _buildChatInterface()
              : _buildInitialSearchCenter(),
        ),
      ],
    );
  }

  Widget _buildInitialSearchCenter() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 600,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: cardBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: accentColor, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Main Search Box
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: accentColor, width: 1.5),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 18),
                        Icon(
                          Icons.search,
                          color: primaryColor,
                          size: 26,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: TextField(
                            onSubmitted: _handleSearch,
                            decoration: InputDecoration(
                              hintText: 'Type here...',
                              hintStyle: TextStyle(
                                color: lightTextColor,
                                fontSize: 18,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              color: textColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 18),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 28),
                  
                  // Smart Suggestion Buttons
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Try asking:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: _quickSuggestions.map((suggestion) {
                          return GestureDetector(
                            onTap: () => _handleQuickSuggestion(suggestion.text),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: accentColor, width: 1.5),
                              ),
                              child: Text(
                                suggestion.text,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: textColor,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
                        _contextTopic.isNotEmpty 
                            ? 'Context: $_contextTopic'
                            : 'Online • Ready to help',
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
                onPressed: _closeChat,
              ),
            ],
          ),
        ),
        
        // Chat Messages Area
        Expanded(
          child: ChatAssistant(
            initialQuery: _lastSearchQuery,
            contextTopic: _contextTopic,
          ),
        ),
      ],
    );
  }

  Widget _buildSettings() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings_outlined, size: 80, color: lightTextColor),
          const SizedBox(height: 24),
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Configure your workspace preferences',
            style: TextStyle(
              fontSize: 18,
              color: lightTextColor,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: _handleLogout,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade50,
              foregroundColor: Colors.red.shade700,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.red.shade200),
              ),
            ),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
          ),
        ],
      ),
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
                          _selectedTab == 0 ? 'Overview' 
                          : 'Settings',
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
                    child: _selectedTab == 0 
                        ? _buildOverview() 
                        : _buildSettings(),
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

class QuickSuggestion {
  final String text;

  const QuickSuggestion({
    required this.text,
  });
}