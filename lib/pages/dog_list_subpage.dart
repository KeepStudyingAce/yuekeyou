import 'package:flutter/material.dart';
import 'package:yuekeyouinterview/utils/app_config.dart';

class DogListSubPage extends StatefulWidget {
  const DogListSubPage({Key? key, required this.subList}) : super(key: key);
  final List<String> subList;
  @override
  _DogListSubPageState createState() => _DogListSubPageState();
}

class _DogListSubPageState extends State<DogListSubPage> {
  String sortType = 'A-Z';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingButtons(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: const Text(
        "DogListSubPage",
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)),
    );
  }

  Widget buildBody() {
    return ListView.builder(
      itemBuilder: (cxt, index) {
        List<String> keyList = widget.subList;
        keyList.sort((a, b) {
          return sortType == 'A-Z' ? a.compareTo(b) : b.compareTo(a);
        });
        String breed = keyList[index];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: AppConfig.screenWidth(context),
          height: 70,
          color: Colors.white,
          alignment: Alignment.center,
          child: Text(breed),
        );
      },
      itemCount: widget.subList.length,
    );
  }

  Widget buildFloatingButtons() {
    const sortTypeTemp = ['A-Z', 'Z-A'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        sortTypeTemp.length,
        (index) {
          return FloatingActionButton(
            heroTag: 'SubMain:${sortTypeTemp[index]}',
            key: Key('SubMain:${sortTypeTemp[index]}'),
            onPressed: () {
              setState(() {
                sortType = sortTypeTemp[index];
              });
            },
            child: Text(sortTypeTemp[index]),
          );
        },
      ),
    );
  }
}
