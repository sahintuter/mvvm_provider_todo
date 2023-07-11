import 'package:flutter/material.dart';


class PriorityTab extends StatefulWidget {
  const PriorityTab({super.key});

  @override
  State<PriorityTab> createState() => _PriorityTabState();
}

class _PriorityTabState extends State<PriorityTab> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: Text('Öncelikli Görevler'),
      ),
    );
  }
}