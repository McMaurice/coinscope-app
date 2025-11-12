import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinscope_app/src/core/constants/app_colors.dart';
import 'package:coinscope_app/src/core/theme/app_typography.dart';
import 'package:coinscope_app/src/core/utilities/formatters.dart';
import 'package:coinscope_app/src/domain/getx%20manager/market_controller.dart';
import 'package:coinscope_app/src/presentation/shared/error_view.dart';
import 'package:coinscope_app/src/presentation/shared/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppController _appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    _appController.fetchMarkets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Markets', style: AppTextStyle.h2(size: 24.sp)),
      ),
      body: Obx(() {
        if (_appController.isLoading.value) return LoadingView();
        if (_appController.hasError.value) {
          return ErrorView(callBack: _appController.fetchMarkets);
        }
        if (_appController.marketList.isEmpty) {
          return Center(
            child: Text(
              "No market data available",
              style: AppTextStyle.regular(size: 14.sp),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: _appController.refreshMarkets,
          child: CustomScrollView(
            slivers: [
              //----- TOP FIXED SECTION -----
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Top Gainers Today",
                        style: AppTextStyle.medium(size: 16.sp),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "These coins have shown the highest 24h growth",
                        style: AppTextStyle.regular(size: 12.sp),
                      ),
                    ],
                  ),
                ),
              ),

              //----- LIST OF COINS -----
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final coin = _appController.marketList[index];
                  return InkWell(
                    onTap: () {
                      _appController.fetchOhlcChart(coin.id, 1);
                      context.push('/detailScreen', extra: coin);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            coin.marketCapRank.toString(),
                            style: AppTextStyle.regular(size: 13.sp),
                          ),
                          SizedBox(width: 15.w),
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: coin.image,
                              height: 36.w,
                              width: 36.w,
                              placeholder: (_, __) => const CircleAvatar(
                                backgroundColor: AppColors.secondaryAccent,
                              ),
                              errorWidget: (_, __, ___) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coin.symbol.toUpperCase(),
                                  style: AppTextStyle.semiBold(size: 15.sp),
                                ),
                                Text(
                                  "\$${AppFormatter.formatCompactNumber(coin.marketCap)}",
                                  style: AppTextStyle.regular(
                                    size: 13.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "\$${AppFormatter.currency(coin.currentPrice)}",
                            style: AppTextStyle.regular(size: 14.sp),
                          ),
                          SizedBox(width: 30.w),
                          Text(
                            '${coin.priceChangePercentage24h.toStringAsFixed(2)}%',
                            style: AppTextStyle.medium(
                              color: coin.priceChangePercentage24h > 0
                                  ? AppColors.positiveColor
                                  : AppColors.negativeColor,
                              size: 14.sp,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            coin.priceChangePercentage24h > 0
                                ? Icons.trending_up
                                : Icons.trending_down,
                            color: coin.priceChangePercentage24h > 0
                                ? AppColors.positiveColor
                                : AppColors.negativeColor,
                            size: 16.sp,
                          ),
                        ],
                      ),
                    ),
                  );
                }, childCount: _appController.marketList.length),
              ),
            ],
          ),
        );
      }),
    );
  }
}
