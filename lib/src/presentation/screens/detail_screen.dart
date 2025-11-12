import 'package:cached_network_image/cached_network_image.dart';
import 'package:coinscope_app/src/core/utilities/formatters.dart';
import 'package:coinscope_app/src/models/coin_model.dart';
import 'package:coinscope_app/src/presentation/shared/coin_infocard.dart';
import 'package:coinscope_app/src/presentation/shared/ohlc_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coinscope_app/src/core/constants/app_colors.dart';
import 'package:coinscope_app/src/core/theme/app_typography.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.coin});
  final CoinModel coin;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final coin = widget.coin;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: coin.image,
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
              coin.symbol.toUpperCase(),
              style: AppTextStyle.semiBold(size: 14.sp),
            ),
            SizedBox(width: 5.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.secondary.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                '#${coin.marketCapRank}',
                style: AppTextStyle.medium(
                  size: 12.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: Theme.of(
              context,
            ).colorScheme.secondary.withValues(alpha: 0.2),
            height: 1.h,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //TODO
        child: Icon(
          Icons.favorite_outline_outlined,
          size: 24.sp,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Text(coin.name, style: AppTextStyle.semiBold(size: 16.sp)),
            SizedBox(height: 5.h),

            // ---- PRICE SECTION ----
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "\$${AppFormatter.currency(coin.currentPrice)}",
                  style: AppTextStyle.h1(size: 25.sp),
                ),
                SizedBox(width: 8.w),
                Row(
                  children: [
                    Text(
                      '${coin.priceChangePercentage24h.toStringAsFixed(2)}%',
                      style: AppTextStyle.medium(
                        size: 14.sp,
                        color: coin.priceChangePercentage24h >= 0
                            ? AppColors.positiveColor
                            : AppColors.negativeColor,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      coin.priceChangePercentage24h >= 0
                          ? Icons.trending_up
                          : Icons.trending_down,
                      color: coin.priceChangePercentage24h >= 0
                          ? AppColors.positiveColor
                          : AppColors.negativeColor,
                      size: 16.sp,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    '24H',
                    style: AppTextStyle.medium(
                      size: 12.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(width: 5.h),
                Text(
                  "\$${AppFormatter.currency(coin.priceChange24h)}",
                  style: AppTextStyle.semiBold(
                    size: 20.sp,
                    color: coin.priceChangePercentage24h >= 0
                        ? AppColors.positiveColor
                        : AppColors.negativeColor,
                  ),
                ),
              ],
            ),
            OhlcGraph(coin: coin),
            SizedBox(height: 20.h),
            Text('Info', style: AppTextStyle.medium(size: 14.sp)),
            SizedBox(height: 8.h),
            Column(
              children: [
                BorderedTwoColumn(
                  title: "Market Cap",
                  description: "\$${AppFormatter.currency(coin.marketCap)}",
                ),
                SizedBox(height: 8.h),
                BorderedTwoColumn(
                  title: "Fully Diluted Valuation",
                  description:
                      "\$${AppFormatter.currency(coin.fullyDilutedValuation)}",
                ),
                SizedBox(height: 8.h),
                BorderedTwoColumn(
                  title: "Total Volum",
                  description: AppFormatter.currency(coin.totalVolume),
                ),
                SizedBox(height: 8.h),
                BorderedTwoColumn(
                  title: "Total Supply",
                  description: AppFormatter.currency(coin.totalSupply),
                ),
                SizedBox(height: 8.h),
                BorderedTwoColumn(
                  title: "Circulating Supply",
                  description: AppFormatter.currency(coin.circulatingSupply),
                ),
                SizedBox(height: 8.h),
                BorderedTwoColumn(
                  title: "Max Supply",
                  description: AppFormatter.currency(coin.maxSupply),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
