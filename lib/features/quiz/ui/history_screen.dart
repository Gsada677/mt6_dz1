import 'package:flutter/material.dart';
import 'package:mt_6_dz1/features/quiz/data/app_database/app_database.dart';
import 'package:mt_6_dz1/features/quiz/data/repositoryi/repo.dart';

class HistoryScreen extends StatefulWidget {
  final Repo? repo;

  const HistoryScreen({super.key, this.repo});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late final Repo repo;
  late final Stream<List<Result>> resultsStream;

  @override
  void initState() {
    super.initState();
    repo = widget.repo ?? Repo();
    resultsStream = repo.watchResults();
  }

  Future<void> _deleteResult(Result result) async {
    await repo.deleteResult(result.id);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Result deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'History',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Result>>(
        stream: resultsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'History loading error: ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }

          final results = snapshot.data ?? [];

          if (results.isEmpty) {
            return const Center(child: Text('No saved results yet'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: results.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final result = results[index];

              return ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.black12),
                ),
                title: Text(
                  '${result.rightAnswers}/${result.allQuestions} correct',
                ),
                subtitle: Text('${result.category} - ${result.difficulty}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${result.percentage}%',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () => _deleteResult(result),
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
