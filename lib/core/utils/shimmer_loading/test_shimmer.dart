import 'package:booky/core/utils/shimmer_loading/shimmer_widget.dart';
import 'package:flutter/material.dart';

class TestShimmer extends StatefulWidget {
  const TestShimmer({super.key});

  @override
  State<TestShimmer> createState() => _TestShimmerState();
}

class _TestShimmerState extends State<TestShimmer> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Shimmer'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return buildShimmerLoader(context);
            }),
      );
}
