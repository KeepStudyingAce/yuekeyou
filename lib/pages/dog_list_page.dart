import 'package:flutter/material.dart';
import 'package:yuekeyouinterview/common_widget/loading.dart';
import 'package:yuekeyouinterview/providers/dog_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:yuekeyouinterview/routers/routers.dart';
import 'package:yuekeyouinterview/utils/app_config.dart';
import 'package:yuekeyouinterview/utils/navigation_utils.dart';

class DogListPage extends StatefulWidget {
  const DogListPage({Key? key}) : super(key: key);

  @override
  _DogListPageState createState() => _DogListPageState();
}

class _DogListPageState extends State<DogListPage> {
  @override
  void initState() {
    super.initState();
    requestData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void requestData() {
    Provider.of<DogListProvider>(context, listen: false).requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingButtons(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: const Text(
        "DogListPage",
      ),
    );
  }

  Widget buildBody() {
    return Consumer<DogListProvider>(
      builder: (context, provider, _) {
        return provider.getPageData() == null
            ? buildEmpty()
            : ListView.builder(
                itemBuilder: (cxt, index) {
                  List<String> keyList = provider.getPageData()!.keys.toList();
                  keyList.sort((a, b) {
                    return provider.getPageSortType() == 'A-Z'
                        ? a.compareTo(b)
                        : b.compareTo(a);
                  });
                  String breed = keyList[index];
                  int count = provider.getPageData()![breed]?.length ?? 0;
                  return GestureDetector(
                    onTap: () {
                      if (count > 0) {
                        NavigatorUtil.push(
                            context, Routes.dogSubListPage, params: {
                          'list':
                              (provider.getPageData()![breed] ?? []).join(',')
                        });
                      } else {
                        Loading.info('There is no sub-breeds');
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      width: AppConfig.screenWidth(context),
                      height: 70,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text('$breed($count)'),
                    ),
                  );
                },
                itemCount: provider.getPageData()!.keys.length,
              );
      },
    );
  }

  Widget buildEmpty() {
    return GestureDetector(
      onTap: () {
        Provider.of<DogListProvider>(context, listen: false).requestData();
      },
      child: const Center(
        child: Text(
          'Refresh',
        ),
      ),
    );
  }

  Widget buildFloatingButtons() {
    const sortType = ['A-Z', 'Z-A'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        sortType.length,
        (index) {
          return FloatingActionButton(
            heroTag: 'Main:${sortType[index]}',
            key: Key('Main:${sortType[index]}'),
            onPressed: () {
              Provider.of<DogListProvider>(context, listen: false)
                  .sortList(sortType[index]);
            },
            child: Text(sortType[index]),
          );
        },
      ),
    );
  }
}
