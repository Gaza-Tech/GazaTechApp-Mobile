import 'package:flutter/material.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class AddListingScreen extends StatefulWidget {
  const AddListingScreen({super.key});

  @override
  State<AddListingScreen> createState() => _AddListingScreenState();
}

class _AddListingScreenState extends State<AddListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Listing '),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Save Draft')),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // add product images section
            Text('Product Images (Max 5)', style: MyTextStyle.body.l),
          ],
        ),
      ),
    );
  }
}
