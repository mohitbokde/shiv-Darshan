import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/daily_content.dart';
import '../data/hindi_date.dart';
import '../theme.dart';
import '../widgets/common.dart';
import 'katha_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  DateTime _today = DateTime.now();
  Timer? _midnight;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scheduleMidnight();
  }

  // आधी रात को तारीख, मंत्र और कथा अपने-आप बदलें
  void _scheduleMidnight() {
    _midnight?.cancel();
    final now = DateTime.now();
    final next = DateTime(now.year, now.month, now.day + 1);
    _midnight = Timer(next.difference(now) + const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() => _today = DateTime.now());
      _scheduleMidnight();
    });
  }

  // ऐप वापस खुलने पर भी तारीख जाँचें
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() => _today = DateTime.now());
      _scheduleMidnight();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _midnight?.cancel();
    super.dispose();
  }

  void _copyMantra(Mantra m) {
    Clipboard.setData(ClipboardData(text: '${m.sanskrit}\n\nअर्थ: ${m.meaning}'));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('मंत्र कॉपी हो गया')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mantra = mantraFor(_today);
    final katha = kathaFor(_today);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            children: [
              const SizedBox(height: 4),
              Text(
                'हर हर महादेव',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: AppColors.goldLight,
                  shadows: [
                    Shadow(
                      color: const Color(0x99D4AF37),
                      blurRadius: 18,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Text(
                hindiDate(_today),
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textSoft,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        GoldCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle('🔱 आज का मंत्र'),
              Text(
                mantra.title,
                style: const TextStyle(color: AppColors.gold, fontSize: 15),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  mantra.sanskrit,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    height: 1.6,
                    color: AppColors.goldLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Divider(height: 28, color: AppColors.goldDark),
              const Text(
                'अर्थ',
                style: TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                mantra.meaning,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: AppColors.textSoft,
                ),
              ),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton.icon(
                  onPressed: () => _copyMantra(mantra),
                  icon: const Icon(Icons.copy_rounded, size: 18),
                  label: const Text('मंत्र कॉपी करें'),
                ),
              ),
            ],
          ),
        ),
        GoldCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle('📖 आज की शिव कथा'),
              Text(
                katha.title,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                katha.story,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: AppColors.textSoft,
                ),
              ),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => KathaScreen(katha: katha),
                      ),
                    );
                  },
                  child: const Text('पूरी कथा पढ़ें'),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'हर दिन रात 12 बजे नया मंत्र और नई कथा आती है।',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.goldDark, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
