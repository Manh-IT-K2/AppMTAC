import 'package:flutter/material.dart';
import 'package:mtac/themes/color.dart';
import 'package:mtac/utils/theme_text.dart';
import 'package:sizer/sizer.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  late DateTime _currentDate;
  late List<DateTime> _daysInMonth;
  late ScrollController _scrollController;

  // Danh sách tên viết tắt của các thứ trong tuần (Bắt đầu từ Thứ 2 - Chủ nhật)
  final List<String> _weekdays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _daysInMonth = _generateDaysInMonth(_currentDate);
    _scrollController = ScrollController();
    // Delay 100ms để đảm bảo danh sách được build trước khi cuộn
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToToday();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<DateTime> _generateDaysInMonth(DateTime date) {
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    return List.generate(
        daysInMonth, (index) => DateTime(date.year, date.month, index + 1));
  }

  List<String> tripTimes = List.generate(12, (index) {
    int hour = index * 2; // 00:00, 02:00, 04:00, ..., 22:00
    return '${hour.toString().padLeft(2, '0')}:00';
  });

  // Hàm lấy tên viết tắt của thứ trong tuần
  String _getWeekdayShortName(DateTime date) {
    int weekdayIndex = date.weekday -
        1; // `DateTime.weekday` trả về 1 -> 7 (Thứ 2 -> Chủ nhật)
    return _weekdays[weekdayIndex];
  }

  void _scrollToToday() {
    int todayIndex = _daysInMonth.indexWhere((day) =>
        day.day == _currentDate.day &&
        day.month == _currentDate.month &&
        day.year == _currentDate.year);

    if (todayIndex != -1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        double itemWidth = 13.w + 1; // Kích thước item + khoảng cách
        double screenWidth = 100.w;
        double scrollOffset =
            (todayIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

        _scrollController.animateTo(
          scrollOffset.clamp(0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            Text.rich(
              TextSpan(
                text: "Xin chào bác tài\n",
                style: PrimaryFont.bodyTextMedium()
                    .copyWith(color: Colors.grey, height: 1.5),
                children: <TextSpan>[
                  TextSpan(
                    text: "Phạm Huỳnh Tín",
                    style:
                        PrimaryFont.medium(3.5.w).copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              width: 10.w,
              height: 10.w,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 6.w,
                      color: kPrimaryColor,
                    ),
                  ),
                  Positioned(
                    top: 3.w,
                    right: 3.5.w,
                    child: Container(
                      width: 1.5.w,
                      height: 1.5.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(1.5.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "51C - 7373",
                    style: PrimaryFont.headerTextBold()
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    "MSX: 7362",
                    style: PrimaryFont.bodyTextBold()
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 3.w,
              ),
              Text(
                "Tiện ích của bác tài",
                style:
                    PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
              ),
              Row(
                children: [
                  _UtilDriver(
                    color: Colors.purple.withOpacity(0.2),
                    icon: Icons.calendar_today_outlined,
                    title: "Lịch thu gom",
                    subTitle: "Tổng hợp các lịch\n thu gom của bác tài",
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  _UtilDriver(
                    color: Colors.greenAccent.withOpacity(0.2),
                    icon: Icons.trending_down,
                    title: "Thống kê",
                    subTitle: "Thống kê các chỉ số\n hoạt động của bác tài",
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  _UtilDriver(
                    color: Colors.green.withOpacity(0.1),
                    icon: Icons.developer_mode_outlined,
                    title: "Hỗ trợ",
                    subTitle: "Hãy liện hệ với chúng\n tôi khi cần bác tài nhé",
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  _UtilDriver(
                    color: Colors.orange.withOpacity(0.2),
                    icon: Icons.smartphone_outlined,
                    title: "Lịch sử",
                    subTitle: "Tổng hợp các lịch sử thu\n gom của bác tài",
                  ),
                ],
              ),
              SizedBox(
                height: 3.w,
              ),
              Text(
                "Lịch gom nổi bật",
                style:
                    PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 3.w,
              ),
              SizedBox(
                height: 20.w,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _daysInMonth.length,
                  itemBuilder: (context, index) {
                    DateTime day = _daysInMonth[index];
                    bool isToday = day.day == _currentDate.day &&
                        day.month == _currentDate.month &&
                        day.year == _currentDate.year;
                    return _ItemDayOfWeek(
                      day: day.day.toString(),
                      weekdays: _getWeekdayShortName(day),
                      statusToday: isToday,
                    );
                  },
                ),
              ),
              SizedBox(height: 5.w),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chuyến thu gom hôm nay",
                      style:
                          PrimaryFont.bold(3.5.w).copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 5.w),
                    SizedBox(
                      height: 42.w,
                      child: ListView.builder(
                        shrinkWrap: true, // Quan trọng khi dùng trong Column
                        // Không cuộn riêng
                        itemCount: tripTimes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 5.w),
                            child: _ItemTripToday(
                              hour: tripTimes[index],
                              addressBusiness: 'Bệnh viện Nhi Đồng 1',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Ghi chú quan trọng",
                style:
                    PrimaryFont.headerTextMedium().copyWith(color: Colors.red),
              ),
              Text(
                "Đừng quên mình có ghi chú quan trọng nhé bác tài",
                style: PrimaryFont.bodyTextMedium()
                    .copyWith(color: Colors.red.withOpacity(0.8)),
              ),
              const _ItemNoteImportant(
                title: "Đại học Y Dược",
                subTitle: "Gom đủ khối lượng...",
                hour: "12:00",
              ),
              const _ItemNoteImportant(
                title: "Đại học Sài Gòn",
                subTitle: "Gom đủ khối lượng...",
                hour: "16:00",
              ),
              const _ItemNoteImportant(
                title: "Đại học Bách Khoa",
                subTitle: "Gom đủ khối lượng...",
                hour: "20:00",
              ),
              SizedBox(height: 5.w,),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemNoteImportant extends StatelessWidget {
  const _ItemNoteImportant({
    super.key, required this.title, required this.subTitle, required this.hour,
  });

  final String title, subTitle, hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: double.infinity,
      height: 18.w,
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.5),
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 3.w,
          ),
          Container(
            width: 15.w,
            height: 15.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: Icon(
              Icons.calendar_today,
              size: 8.w,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               SizedBox(height: 2.w,),
              Text(
                title,
                style: PrimaryFont.bodyTextBold()
                    .copyWith(color: Colors.white),
                     maxLines: 1,
                    overflow: TextOverflow.ellipsis,
              ),
              Text(
                subTitle,
                style: PrimaryFont.bodyTextMedium()
                    .copyWith(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
              ),
              Row(
            children: [
              Icon(Icons.access_time_filled, size: 5.w, color: Colors.white,),
              Text(
                hour,
                style: PrimaryFont.bodyTextBold()
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 2.w,),
            ],
          ),
          
        ],
      ),
    );
  }
}

class _ItemTripToday extends StatelessWidget {
  const _ItemTripToday({
    super.key,
    required this.hour,
    required this.addressBusiness,
  });
  final String hour, addressBusiness;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hour,
          style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
        ),
        Container(
          width: 50.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Center(
            child: Text(
              addressBusiness,
              style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
               maxLines: 1,
                    overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemDayOfWeek extends StatelessWidget {
  const _ItemDayOfWeek({
    super.key,
    required this.day,
    required this.weekdays,
    required this.statusToday,
  });

  final String day, weekdays;
  final bool statusToday;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13.w,
      height: 20.w,
      decoration: BoxDecoration(
        color:
            statusToday ? kPrimaryColor.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text.rich(
            TextSpan(
              text: "$day\n",
              style: PrimaryFont.headerTextBold().copyWith(
                  color: statusToday ? Colors.red : Colors.black, height: 1.2),
              children: <TextSpan>[
                TextSpan(
                  text: weekdays,
                  style: PrimaryFont.bodyTextMedium()
                      .copyWith(color: statusToday ? Colors.red : Colors.black),
                ),
              ],
            ),
          ),
          statusToday
              ? Container(
                  width: 2.w,
                  height: 2.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _UtilDriver extends StatelessWidget {
  const _UtilDriver({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.subTitle,
  });

  final IconData icon;
  final Color color;
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.w),
      width: 50.w - 24,
      height: 30.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 7.w,
            color: Colors.black,
          ),
          SizedBox(
            height: 2.w,
          ),
          Text(
            title,
            style: PrimaryFont.bold(3.5.w).copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 2.w,
          ),
          Text(
            subTitle,
            style: PrimaryFont.bodyTextMedium().copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
