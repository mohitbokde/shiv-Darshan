import 'package:flutter/material.dart';

import '../data/daily_content.dart';
import '../theme.dart';
import '../widgets/common.dart';

class KathaScreen extends StatelessWidget {
  final Katha katha;
  const KathaScreen({super.key, required this.katha});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('आज की शिव कथा')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GoldCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  katha.title,
                  style: const TextStyle(
                    color: AppColors.goldLight,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  katha.story,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.8,
                    color: AppColors.textSoft,
                  ),
                ),
              ],
            ),
          ),
          GoldCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle('🪔 जीवन की सीख'),
                Text(
                  katha.seekh,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.7,
                    color: AppColors.gold,
                    fontWeight: FontWeight.w600,
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
