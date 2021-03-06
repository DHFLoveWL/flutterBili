import 'package:flutter/material.dart';
import 'package:flutter_bili/pages/home/home_bangumi_page.dart';
import 'package:flutter_bili/pages/home/home_cinema_page.dart';
import 'package:flutter_bili/pages/home/home_live_page.dart';
import 'package:flutter_bili/pages/home/home_other_channel_page.dart';
import 'package:flutter_bili/pages/home/home_popular_page.dart';
import 'package:flutter_bili/pages/home/home_recommend_page.dart';

class ChannelCommonPage extends StatelessWidget {

  final String uri;
  final int channelId;
  ChannelCommonPage({this.uri,this.channelId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getCustomWidget(),
    );
  }

  Widget _getCustomWidget() {
    if (this.uri == 'bilibili://live/home') { //直播
      return LivePage();
    } else if (this.uri == 'bilibili://pegasus/promo') {
      return HomeRecommendPage();
    }  else if (this.uri == 'bilibili://pegasus/hottopic') {
      return HomePopularPage();
    }  else if (this.uri == 'bilibili://pgc/home') {
      return HomeBangumiPage();
    }  else if (this.uri == 'bilibili://pgc/cinema-tab') {
      return HomeCinemaPage();
    } else {
      return HomeOtherChannelPage(channelId);
    }
  }
}
