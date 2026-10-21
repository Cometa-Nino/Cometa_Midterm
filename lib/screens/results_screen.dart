import 'package:flutter/material.dart';
import '../widgets/result_view.dart';

class ResultsScreen extends StatefulWidget {
  final int score;

  const ResultsScreen({super.key, required this.score});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  bool _isCalculating = true;

  @override
  void initState() {
    super.initState();
    // Short simulated delay so the adaptive loading indicator is visible.
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() => _isCalculating = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Results')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 700;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: _isCalculating
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator.adaptive(),
                          const SizedBox(height: 16),
                          Text(
                            'Calculating your results...',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      )
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            ResultView(score: widget.score),
                            SizedBox(height: isWide ? 32 : 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.popUntil(
                                  context,
                                  (route) => route.isFirst,
                                );
                              },
                              child: const Text('Restart Assessment'),
                            ),
                          ],
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}