import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:yuekeyouinterview/pages/dog_list_page.dart';
import 'package:yuekeyouinterview/pages/dog_list_subpage.dart';
import 'package:yuekeyouinterview/pages/entrance_page.dart';
import 'package:yuekeyouinterview/providers/dog_list_provider.dart';

var rootHandle = Handler(handlerFunc: (context, params) {
  return const EntrancePage();
});

var dogListPageHandle = Handler(handlerFunc: (context, params) {
  return ChangeNotifierProvider<DogListProvider>(
    create: (_) => DogListProvider(),
    builder: (context, _) => const DogListPage(),
  );
});

var dogSubListPageHandle = Handler(handlerFunc: (context, params) {
  String data = params['list']!.first;
  return DogListSubPage(
    subList: data.split(','),
  );
});
