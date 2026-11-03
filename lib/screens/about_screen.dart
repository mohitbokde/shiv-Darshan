import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/common.dart';
import '../widgets/trishul.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 12),
        const Center(child: Trishul(height: 140)),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'शिव दर्शन',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.goldLight,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const GoldCard(
          child: Column(
            children: [
              Text(
                'Made by Mohit',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 14),
              Text(
                'एक छोटी-सी भेंट, महादेव के चरणों में।',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: AppColors.textSoft,
                ),
              ),
              SizedBox(height: 14),
              Text(
                'संस्करण 1.0.0',
                style: TextStyle(color: AppColors.goldDark, fontSize: 14),
              ),
            ],
          ),
        ),
        const Center(
          child: Text(
            'हर हर महादेव! 🔱',
            style: TextStyle(fontSize: 18, color: AppColors.goldLight),
          ),
        ),
      ],
    );
  }
}
