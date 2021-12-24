import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CZScaffold extends StatelessWidget {
  final Widget body;
  final bool showBackButton;
  const CZScaffold({Key? key, required this.body, this.showBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasPreviousPage = Get.previousRoute != '';
    final bool showFab = showBackButton && hasPreviousPage;
    return Scaffold(
      floatingActionButton: showFab
          ? Container(
              margin: const EdgeInsets.only(top: 16),
              width: 42,
              height: 42,
              child: FittedBox(
                child: new FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.black54, size: 24)),
              ),
            )
          : null,
      floatingActionButtonLocation:
          showFab ? FloatingActionButtonLocation.miniStartTop : null,
      body: SafeArea(child: SingleChildScrollView(child: body)),
    );
  }
}
