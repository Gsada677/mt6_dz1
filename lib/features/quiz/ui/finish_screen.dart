import 'package:flutter/material.dart';
import 'package:mt_6_dz1/features/quiz/data/model/result_model.dart';
import 'package:mt_6_dz1/features/quiz/data/repositoryi/repo.dart';
import 'package:mt_6_dz1/features/quiz/ui/history_screen.dart';

class FinishScreen extends StatefulWidget {
  final ResultModel resultModel;

  const FinishScreen({super.key, required this.resultModel});

  @override
  State<FinishScreen> createState() => _FinishScreenState();
}

class _FinishScreenState extends State<FinishScreen> {
  final repo = Repo();
  late final Future<int> saveResultFuture;

  @override
  void initState() {
    super.initState();
    saveResultFuture = repo.saveResult(widget.resultModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Result',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<int>(
        future: saveResultFuture,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.check, size: 150, color: Colors.greenAccent),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Category: ${widget.resultModel.category}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _info('Difficulty', widget.resultModel.difficulty),
                        _info(
                          'correct answers',
                          '${widget.resultModel.rightAnswers}/${widget.resultModel.allQuestions}',
                        ),
                        _info('result', '${widget.resultModel.percentage}%'),
                      ],
                    ),
                    if (snapshot.hasError)
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          'Result was not saved',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  minimumSize: const Size(180, 46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'History',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _info(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
