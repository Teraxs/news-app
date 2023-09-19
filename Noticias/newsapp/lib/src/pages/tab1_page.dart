import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tap1Page extends StatefulWidget {
  const Tap1Page({Key? key}) : super(key: key);

  @override
  State<Tap1Page> createState() => _Tap1PageState();
}

class _Tap1PageState extends State<Tap1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headLines = Provider.of<NewsService>(context).headLines;
    // newsService.headLines;
    //NewsList(news: headLines,),
    return Scaffold(
      body: (headLines?.length == 0)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : NewsList(news: headLines),
    );
  }

// Mantener el estado en mi tab
  @override
  bool get wantKeepAlive => true;
}
