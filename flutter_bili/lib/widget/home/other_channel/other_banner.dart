import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bili/model/home_common_channel_model.dart';
import 'package:flutter_bili/routes/routes.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OtherChannelBanner extends StatelessWidget {
  final List<CommonChannelBannerItem> bannerItemList;
  OtherChannelBanner(this.bannerItemList);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(200),
      child: Swiper(
        itemCount: this.bannerItemList.length,
        onTap: (index) {
          CommonChannelBannerItem banner = this.bannerItemList[index];
          Routes.navigateTo(context, Routes.webView,
              params: {'title': banner.title, 'url': banner.uri});
        },
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Positioned(
                left: 0,right: 0,top: 0,bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: this.bannerItemList[index].image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: ScreenUtil().setWidth(375),
                      height: ScreenUtil().setHeight(200),
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent,Color.fromRGBO(0, 0, 0, 0.5)]
                      )
                  ),
                  child: Text(this.bannerItemList[index].title, style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(14)),maxLines: 1,overflow: TextOverflow.ellipsis,),
                ),
              )
            ],
          );
        },
        autoplayDelay: 3000,
        autoplay: true,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            builder: DotSwiperPaginationBuilder(
                color: Color.fromRGBO(244, 244, 244, 0.5),
                activeColor: Colors.white,
                size: ScreenUtil().setWidth(7),
                activeSize: ScreenUtil().setWidth(7))),
      ),
    );
  }
}
