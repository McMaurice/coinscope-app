import 'package:coinscope_app/src/core/constants/app_colors.dart';
import 'package:coinscope_app/src/core/theme/app_typography.dart';
import 'package:coinscope_app/src/domain/getx%20manager/market_controller.dart';
import 'package:coinscope_app/src/models/coin_model.dart';
import 'package:coinscope_app/src/models/ohlc_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OhlcGraph extends StatefulWidget {
  const OhlcGraph({super.key, required this.coin});

  final CoinModel coin;

  @override
  State<OhlcGraph> createState() => _OhlcGraphState();
}

class _OhlcGraphState extends State<OhlcGraph> {
  final AppController _appController = Get.find<AppController>();
  late TrackballBehavior _trackballBehavior;
  late RxList<OhlcChartModel> currentChart;

  final List<String> _timeRanges = ['24H', '7D', '1M', '3M', '1Y'];
  int _selectedIndex = 0;
  DateFormat getXAxisDateFormat(String range) {
    switch (range) {
      case '24H':
        return DateFormat.Hm();
      case '7D':
        return DateFormat.E();
      case '1M':
        return DateFormat.d().add_MMM();
      case '3M':
        return DateFormat.MMMd();
      case '1Y':
        return DateFormat.MMM();
      default:
        return DateFormat.yMd();
    }
  }

  @override
  void initState() {
    super.initState();
    currentChart = _appController.dayChart;
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: InteractiveTooltip(enable: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: Column(
        children: [
          // ---- CHART ----
          Expanded(
            child: Obx(
              () => currentChart.isEmpty
                  ? Center(
                      child: Text(
                        'Data Loading',
                        style: AppTextStyle.medium(
                          size: 14.sp,
                          color: Colors.grey[400],
                        ),
                      ),
                    )
                  : SfCartesianChart(
                      trackballBehavior: _trackballBehavior,
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        textStyle: TextStyle(fontSize: 12.sp),
                      ),
                      series: <CandleSeries>[
                        CandleSeries<OhlcChartModel, DateTime>(
                          dataSource: currentChart,
                          xValueMapper: (OhlcChartModel e, _) =>
                              DateTime.fromMillisecondsSinceEpoch(e.timestamp),
                          lowValueMapper: (OhlcChartModel e, _) => e.low,
                          highValueMapper: (OhlcChartModel e, _) => e.high,
                          openValueMapper: (OhlcChartModel e, _) => e.open,
                          closeValueMapper: (OhlcChartModel e, _) => e.close,
                          enableSolidCandles: true,
                        ),
                      ],
                      primaryXAxis: DateTimeAxis(
                        dateFormat: getXAxisDateFormat(
                          _timeRanges[_selectedIndex],
                        ),
                        intervalType: _timeRanges[_selectedIndex] == '24H'
                            ? DateTimeIntervalType.hours
                            : _timeRanges[_selectedIndex] == '7D' ||
                                  _timeRanges[_selectedIndex] == '1M'
                            ? DateTimeIntervalType.days
                            : DateTimeIntervalType.months,
                        interval: _timeRanges[_selectedIndex] == '3M'
                            ? 1 // show every month
                            : _timeRanges[_selectedIndex] == '1Y'
                            ? 2 // show every 2 months
                            : null,
                        majorGridLines: MajorGridLines(
                          color: Colors.grey[800],
                          dashArray: [4, 4],
                        ),
                        labelStyle: AppTextStyle.regular(size: 10.sp),
                        axisLine: AxisLine(color: Colors.transparent),
                      ),

                      primaryYAxis: NumericAxis(
                        minimum: _appController.getMinLow(currentChart),
                        maximum: _appController.getMaxHigh(currentChart),
                        numberFormat: NumberFormat.simpleCurrency(
                          decimalDigits: 0,
                        ),
                        majorGridLines: MajorGridLines(
                          color: Colors.grey[800],
                          dashArray: [4, 4],
                        ),
                        axisLine: AxisLine(color: Colors.transparent),
                        labelStyle: AppTextStyle.regular(size: 10.sp),
                      ),
                    ),
            ),
          ),
          SizedBox(height: 10.h),
          // ---- TIME RANGE SELECTOR ----
          SizedBox(
            height: 30.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              itemCount: _timeRanges.length,
              separatorBuilder: (_, __) => SizedBox(width: 8.w),
              itemBuilder: (context, index) {
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;

                      if (_selectedIndex == 0) {
                        currentChart = _appController.dayChart;
                      } else if (_selectedIndex == 1) {
                        currentChart = _appController.weekChart;
                      } else if (_selectedIndex == 2) {
                        currentChart = _appController.monthsChart;
                      } else if (_selectedIndex == 3) {
                        currentChart = _appController.trimesterChart;
                      } else if (_selectedIndex == 4) {
                        currentChart = _appController.yearChart;
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryColor.withValues(alpha: 0.5)
                          : Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.black.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _timeRanges[index],
                        style: AppTextStyle.medium(size: 10.sp),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
