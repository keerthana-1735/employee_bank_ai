import 'package:flutter/material.dart';

class CenterSearch extends StatelessWidget {
  final Function(String) onSearch;
  final List<QuickAction> quickActions;
  final Function(String) onQuickActionTap;

  const CenterSearch({
    Key? key,
    required this.onSearch,
    required this.quickActions,
    required this.onQuickActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
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
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                const Icon(
                  Icons.search,
                  color: Color(0xFF64748B),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    onSubmitted: onSearch,
                    decoration: const InputDecoration(
                      hintText: 'Type here...',
                      hintStyle: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0D1B2A),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Quick Actions Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3.5,
            children: quickActions.map((action) {
              return GestureDetector(
                onTap: () => onQuickActionTap(action.title),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        action.icon,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          action.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF334155),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          
          const SizedBox(height: 24),
          
          // Additional Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F9FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF0EA5E9).withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  color: Color(0xFF0EA5E9),
                  size: 20,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Try asking: "What is KYC process?" or "How to process a loan?"',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF0369A1),
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
}

class QuickAction {
  final String icon;
  final String title;

  const QuickAction({
    required this.icon,
    required this.title,
  });
}

// Update the quickActions list in module_data.dart to match the image:
// You might need to update your module_data.dart file with these quick actions:
final List<QuickAction> quickActions = [
  const QuickAction(icon: '📄', title: 'KYC Guidelines'),
  const QuickAction(icon: '💰', title: 'Loan Policies'),
  const QuickAction(icon: '💳', title: 'Transaction Limits'),
  const QuickAction(icon: '⚙️', title: 'Banking Operations'),
  const QuickAction(icon: '🛡️', title: 'Risk & Compliance'),
  const QuickAction(icon: '🏢', title: 'Branch Services'),
  const QuickAction(icon: '📊', title: 'Reports & Analytics'),
  const QuickAction(icon: '🤝', title: 'Customer Service'),
];