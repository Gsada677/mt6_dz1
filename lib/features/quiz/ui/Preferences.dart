import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mt_6_dz1/features/quiz/data/repositoryi/repo.dart';

class QuizPreferences extends StatefulWidget {
  final Repo? repo;

  const QuizPreferences({super.key, this.repo});

  @override
  State<QuizPreferences> createState() => _QuizPreferences();
}

class _QuizPreferences extends State<QuizPreferences> {
  late final Repo repo;

  @override
  void initState() {
    super.initState();
    repo = widget.repo ?? Repo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const Text(''),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Settings',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              _settings('Share this app'),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              _settings('Rate us'),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              _settings('Leave feedback'),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              _settingsDeleteResults(context, 'Clear history'),
            ],
          ),
    );
  }

  Widget _settings(String settingName) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 80),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(settingName, style: const TextStyle(color: Colors.black)),
          const Icon(Icons.arrow_forward_ios, color: Colors.black),
        ],
      ),
    );
  }

  Future<void> _deleteResults(BuildContext context) async {
    await repo.deleteAllResults();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Results deleted')),
    );
  }

  Widget _settingsDeleteResults(BuildContext context, String settingName) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 80),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      onPressed: () => _deleteResults(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(settingName, style: const TextStyle(color: Colors.black)),
          const Icon(CupertinoIcons.delete, color: Colors.black),
        ],
      ),
    );
  }
}
