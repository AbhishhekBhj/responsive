import 'package:eigital_task/features/guestbook/widgets/guest_allergies_panel.dart' show SectionLabel;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../notes_panel.dart';
import 'info_empty_tile.dart';
import 'online_review_card_data.dart';
import 'section_label.dart';

class RecentOrdersAndReviewsPanel extends StatelessWidget {
  const RecentOrdersAndReviewsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = <OnlineReviewCardData>[
      const OnlineReviewCardData(
        platform: ReviewPlatform.google,
        rating: 4,
        text:
            'The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.',
      ),
      const OnlineReviewCardData(
        platform: ReviewPlatform.yelp,
        rating: 3,
        text:
            'The service was prompt and attentive, making our evening enjoyable. Highly recommend this gem.',
      ),
      const OnlineReviewCardData(
        platform: ReviewPlatform.foursquare,
        rating: 3,
        text:
            'I highly recommend trying their Japan Chicken. it was bursting with flavor.',
      ),
        const OnlineReviewCardData(
        platform: ReviewPlatform.google,
        rating: 4,
        text:
            'The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.',
      ),
      const OnlineReviewCardData(
        platform: ReviewPlatform.yelp,
        rating: 3,
        text:
            'The service was prompt and attentive, making our evening enjoyable. Highly recommend this gem.',
      ),
      const OnlineReviewCardData(
        platform: ReviewPlatform.foursquare,
        rating: 3,
        text:
            'I highly recommend trying their Japan Chicken. it was bursting with flavor.',
      ),
    ];

    return Material(
        color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(text: 'RECENT ORDERS'),
          SizedBox(height: 10.h),
          InfoEmptyTile(
            icon: Icons.restaurant,
            title: 'No Recent Orders to Show',
            onTap: () {
              // optional
            },
          ),
          SizedBox(height: 18.h),
          SectionLabel(text: 'ONLINE REVIEWS'),
          SizedBox(height: 10.h),
          SizedBox(
            height: 350.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              itemBuilder: (context, index) {
                return OnlineReviewCard(data: reviews[index]);
              },
              separatorBuilder: (_, __) => SizedBox(width: 14.w),
              itemCount: reviews.length,
            ),
          ),
        ],
      ),
    );
  }
}


enum ReviewPlatform { google, yelp, foursquare }




