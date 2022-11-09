import 'dart:io';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {

    @override
    initState() {
      super.initState();
      // controller.scrollController = widget.scrollController;
      // controller.addObserver();
    }
}