import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinscope_app/src/core/utilities/formatters.dart';
import 'package:coinscope_app/src/domain/getx%20manager/market_controller.dart';
import 'package:coinscope_app/src/models/ohlc_model.dart';
import 'package:coinscope_app/src/models/coin_model.dart';
import 'package:coinscope_app/src/presentation/shared/error_view.dart';
import 'package:coinscope_app/src/presentation/shared/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coinscope_app/src/core/constants/app_colors.dart';
import 'package:coinscope_app/src/core/theme/app_typography.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.coin});
  final CoinModel coin;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final AppController _appController = Get.find<AppController>();

  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    super.initState();
    _appController.fetchOhlcChart(widget.coin.id, 1);
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: widget.coin.image,
                height: 30.h,
                width: 30.w,
                placeholder: (_, __) => const CircleAvatar(
                  backgroundColor: AppColors.secondaryAccent,
                ),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              widget.coin.symbol.toUpperCase(),
              style: AppTextStyle.semiBold(size: 14.sp, color: Colors.white),
            ),
            SizedBox(width: 4.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.h),
              decoration: BoxDecoration(
                color: AppColors.secondaryAccent.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(5.sp),
              ),
              child: Text(
                '#${widget.coin.marketCapRank}',
                style: AppTextStyle.regular(
                  size: 14.sp,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.primaryAccent,
        elevation: 0,
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

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.coin.name,
                      style: AppTextStyle.semiBold(size: 14.sp),
                    ),
                    Text(
                      "\$${AppFormatter.formatCompactNumber(widget.coin.currentPrice)}",
                      style: AppTextStyle.h1(size: 20.sp),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 250.h,
                  child: SfCartesianChart(
                    title: ChartTitle(
                      text: widget.coin.name,
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      alignment: ChartAlignment.near,
                    ),
                    backgroundColor: AppColors.secondaryAccent,
                    plotAreaBorderWidth: 0, // remove border for clean look
                    trackballBehavior: _trackballBehavior,
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      header: '',
                      textStyle: TextStyle(fontSize: 12.sp),
                    ),
                    series: <CandleSeries>[
                      CandleSeries<OhlcChartModel, DateTime>(
                        dataSource: _appController.candleDataList,
                        xValueMapper: (OhlcChartModel sales, _) =>
                            DateTime.fromMillisecondsSinceEpoch(sales.timestamp),
                        lowValueMapper: (OhlcChartModel sales, _) => sales.low,
                        highValueMapper: (OhlcChartModel sales, _) => sales.high,
                        openValueMapper: (OhlcChartModel sales, _) => sales.open,
                        closeValueMapper: (OhlcChartModel sales, _) =>
                            sales.close,
                        enableSolidCandles: true,
                      ),
                    ],
                    primaryXAxis: DateTimeAxis(
                      dateFormat: DateFormat.Hm(),
                      labelStyle: AppTextStyle.regular(size: 10.sp),
                      axisLine: AxisLine(color: Colors.transparent),
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: _appController.getMinLow(
                        _appController.candleDataList,
                      ),
                      maximum: _appController.getMaxHigh(
                        _appController.candleDataList,
                      ),
                      numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                      majorGridLines: MajorGridLines(
                        color: Colors.grey[800],
                        dashArray: [4, 4],
                      ),
                      axisLine: AxisLine(color: Colors.transparent),
                      labelStyle: AppTextStyle.regular(size: 10.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
