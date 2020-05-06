import 'package:flutter/material.dart';
import 'package:flutter_bili/widget/first_loading.dart';
import 'package:flutter_bili/widget/home/activity_card.dart';
import 'package:flutter_bili/widget/home/hour_rank_widget.dart';
import 'package:flutter_bili/widget/home/live_banner.dart';
import 'package:flutter_bili/widget/home/live_nav.dart';
import 'package:flutter_bili/widget/home/recommend_live_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bili/provider/live_provider.dart';

class LivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getLiveAllList(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Consumer<LiveProvider>(
                builder: (context, provider, child) {
                  return Container(
                    color: Colors.white,
                    width: ScreenUtil().setWidth(375),
                    child: ListView(
                      children: <Widget>[
                        LiveBannerWidget(provider.homeLiveInfoModel.data.banner[0].list),
                        LiveNavWidget(list: provider.homeLiveInfoModel.data.areaEntranceV2[0].list,),
                        provider.homeLiveInfoModel.data.activityCardV2[0].list == null ? Container() : ActivityCardWidget(provider.homeLiveInfoModel.data.activityCardV2[0].list),
                        RecommendLiveWidget(provider.homeLiveInfoModel.data.roomList[0]),
                        HourRankWidget(provider.homeLiveInfoModel.data.hourRank[0]),
                        RecommendLiveWidget(provider.homeLiveInfoModel.data.roomList[1]),
                        RecommendLiveWidget(provider.homeLiveInfoModel.data.roomList[2]),
                        RecommendLiveWidget(provider.homeLiveInfoModel.data.roomList[3]),
                        RecommendLiveWidget(provider.homeLiveInfoModel.data.roomList[4]),
                        RecommendLiveWidget(provider.homeLiveInfoModel.data.roomList[5]),
                        RecommendLiveWidget(provider.homeLiveInfoModel.data.roomList[6]),
                        RecommendLiveWidget(provider.homeLiveInfoModel.data.roomList[7]),
                        RecommendLiveWidget(provider.homeLiveInfoModel.data.roomList[8]),
                      ],
                    ),
                  );
                }
            );
          } else {
            return FirstLoadingWidget();
          }
        }
    );
  }

  Future _getLiveAllList(BuildContext context) async{
    await Provider.of<LiveProvider>(context,listen: false).getHomeLiveAllList();
    return 'ok';
  }
}
