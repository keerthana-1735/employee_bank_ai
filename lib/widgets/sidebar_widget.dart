// widgets/sidebar_widget.dart
import 'package:flutter/material.dart';
import 'package:employee_bank_ai/models/sidebar_menu.dart';

class SidebarWidget extends StatefulWidget {
  final Function(String) onMenuItemTap;
  final String currentRoute;

  const SidebarWidget({
    Key? key,
    required this.onMenuItemTap,
    required this.currentRoute,
  }) : super(key: key);

  @override
  State<SidebarWidget> createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  String? _expandedSection;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: const Color(0xFF0A2342), // Dark navy background
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 32),
              
              // Menu Items
              ..._buildMenuItems(),
              
              const SizedBox(height: 32),
              
              // Footer
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF00A4E6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.account_balance,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'BANK AI',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Employee Portal',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMenuItems() {
    List<Widget> widgets = [];
    
    for (int i = 0; i < sidebarMenu.length; i++) {
      final item = sidebarMenu[i];
      
      if (item.isHeader) {
        widgets.add(_buildHeaderItem(item));
        widgets.add(const SizedBox(height: 8));
      } else {
        widgets.add(_buildMenuItem(item));
        widgets.add(const SizedBox(height: 4));
      }
    }
    
    return widgets;
  }

  Widget _buildHeaderItem(SidebarMenuItem item) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 16, bottom: 8),
      child: Text(
        item.title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF94A3B8),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildMenuItem(SidebarMenuItem item) {
    final isSelected = widget.currentRoute == item.route;
    
    return GestureDetector(
      onTap: () {
        if (item.route != null) {
          widget.onMenuItemTap(item.route!);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1C4E80) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: const Color(0xFF00A4E6), width: 1)
              : null,
        ),
        child: Row(
          children: [
            // Icon/Emoji
            if (item.emoji != null)
              Text(
                item.emoji!,
                style: const TextStyle(fontSize: 20),
              )
            else if (item.icon != null)
              Icon(
                item.icon,
                size: 20,
                color: isSelected ? Colors.white : const Color(0xFF94A3B8),
              ),
            const SizedBox(width: 12),
            
            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : const Color(0xFFE2E8F0),
                    ),
                  ),
                  if (item.subtitle != null)
                    Text(
                      item.subtitle!,
                      style: TextStyle(
                        fontSize: 10,
                        color: isSelected
                            ? const Color(0xFF94A3B8)
                            : const Color(0xFF64748B),
                      ),
                    ),
                ],
              ),
            ),
            
            // Selected indicator
            if (isSelected)
              const Icon(
                Icons.chevron_right,
                size: 16,
                color: Color(0xFF00A4E6),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1C4E80).withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF1C4E80)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.person_outline,
              size: 16,
              color: Colors.white.withOpacity(0.7),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Senior Banking Officer',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.settings_outlined,
                size: 16,
                color: Colors.white.withOpacity(0.7),
              ),
              onPressed: () {
                widget.onMenuItemTap('/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}