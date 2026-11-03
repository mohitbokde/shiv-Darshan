import 'package:flutter/material.dart';

import '../theme.dart';

class GoldCard extends StatelessWidget {
  final Widget child;
  const GoldCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E1808), Color(0xFF0F0D06)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.goldDark, width: 1.2),
        boxShadow: const [
          BoxShadow(color: Color(0x22D4AF37), blurRadius: 14),
        ],
      ),
      child: child,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.goldLight,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
