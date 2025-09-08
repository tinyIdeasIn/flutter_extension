import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

class DateDemoPage extends StatefulWidget {
  @override
  _DateDemoPageState createState() => _DateDemoPageState();
}

class _DateDemoPageState extends State<DateDemoPage> {
  DateTime selectedDate = DateTime.now();
  int countdownSeconds = 3661; // 示例倒计时时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期时间扩展'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('基础日期信息'),
            _buildBasicDateInfo(),
            20.0.boxH,
            
            _buildSectionTitle('日期格式化'),
            _buildDateFormatDemo(),
            20.0.boxH,
            
            _buildSectionTitle('日期判断'),
            _buildDateJudgmentDemo(),
            20.0.boxH,
            
            _buildSectionTitle('日期计算'),
            _buildDateCalculationDemo(),
            20.0.boxH,
            
            _buildSectionTitle('时间转换'),
            _buildTimeConversionDemo(),
            20.0.boxH,
            
            _buildSectionTitle('倒计时'),
            _buildCountdownDemo(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorManager.gray33,
      ),
    ).paddingBottom(10);
  }

  Widget _buildBasicDateInfo() {
    final now = DateTime.now();
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('当前时间', now.toString()),
          _buildInfoRow('当前毫秒时间戳', '${now.nowMillisecond}'),
          _buildInfoRow('年份', '${now.year}'),
          _buildInfoRow('月份', '${now.month}'),
          _buildInfoRow('日期', '${now.day}'),
          _buildInfoRow('星期', '${now.weekday}'),
          _buildInfoRow('小时', '${now.hour}'),
          _buildInfoRow('分钟', '${now.minute}'),
          _buildInfoRow('秒', '${now.second}'),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$label:',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: ColorManager.gray66),
          ),
        ),
      ],
    ).paddingBottom(8);
  }

  Widget _buildDateFormatDemo() {
    final now = DateTime.now();
    final formats = [
      'yyyy-MM-dd',
      'yyyy-MM-dd HH:mm:ss',
      'yyyy年MM月dd日',
      'MM/dd/yyyy',
      'HH:mm:ss',
      'yyyy-MM-dd HH:mm',
      'dd-MM-yyyy',
    ];

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('不同格式的时间显示:'),
          16.0.boxH,
          ...formats.map((format) => _buildFormatRow(format, now.format(format: format))),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildFormatRow(String format, String result) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            format,
            style: TextStyle(
              fontFamily: 'monospace',
              color: ColorManager.blue,
            ),
          ),
        ),
        Icon(Icons.arrow_forward, size: 16, color: ColorManager.gray99),
        8.0.boxW,
        Expanded(
          flex: 2,
          child: Text(
            result,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    ).paddingBottom(8);
  }

  Widget _buildDateJudgmentDemo() {
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 1));
    final tomorrow = now.add(Duration(days: 1));
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildJudgmentRow('今天', now.format(format: 'MM-dd'), now.isToday),
          _buildJudgmentRow('昨天', yesterday.format(format: 'MM-dd'), yesterday.isYesterday),
          _buildJudgmentRow('本月第一天', now.firstDayOfMonth.format(format: 'MM-dd'), now.isFirstDayOfMonth),
          _buildJudgmentRow('本月最后一天', now.lastDayOfMonth.format(format: 'MM-dd'), now.isLastDayOfMonth),
          16.0.boxH,
          Text('同一天判断:'),
          _buildJudgmentRow('今天 vs 今天', '', DateOption.isSameDay(now, now)),
          _buildJudgmentRow('今天 vs 昨天', '', DateOption.isSameDay(now, yesterday)),
          16.0.boxH,
          Text('同一周判断:'),
          _buildJudgmentRow('今天 vs 昨天', '', DateOption.isSameWeek(now, yesterday)),
          _buildJudgmentRow('今天 vs 上周同一天', '', DateOption.isSameWeek(now, now.subtract(Duration(days: 7)))),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildJudgmentRow(String label, String date, bool result) {
    return Row(
      children: [
        Expanded(
          child: Text('$label ${date.isNotEmpty ? "($date)" : ""}'),
        ),
        Icon(
          result ? Icons.check_circle : Icons.cancel,
          color: result ? Colors.green : Colors.red,
          size: 20,
        ),
        4.0.boxW,
        Text(
          result ? '是' : '否',
          style: TextStyle(
            color: result ? Colors.green : Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ).paddingBottom(8);
  }

  Widget _buildDateCalculationDemo() {
    final now = DateTime.now();
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('日期计算示例:'),
          16.0.boxH,
          _buildCalculationRow('本月第一天', now.firstDayOfMonth.format(format: 'yyyy-MM-dd')),
          _buildCalculationRow('本月最后一天', now.lastDayOfMonth.format(format: 'yyyy-MM-dd')),
          _buildCalculationRow('本周第一天', now.firstDayOfWeek.format(format: 'yyyy-MM-dd')),
          _buildCalculationRow('本周最后一天', now.lastDayOfWeek.format(format: 'yyyy-MM-dd')),
          _buildCalculationRow('上个月', now.previousMonth.format(format: 'yyyy-MM-dd')),
          _buildCalculationRow('下个月', now.nextMonth.format(format: 'yyyy-MM-dd')),
          _buildCalculationRow('上一周', now.previousWeek.format(format: 'yyyy-MM-dd')),
          _buildCalculationRow('下一周', now.nextWeek.format(format: 'yyyy-MM-dd')),
          16.0.boxH,
          Text('本月所有日期:'),
          8.0.boxH,
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: now.daysInMonth.length,
              itemBuilder: (context, index) {
                final day = now.daysInMonth[index];
                final isCurrentMonth = day.month == now.month;
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  margin: EdgeInsets.only(bottom: 2),
                  decoration: BoxDecoration(
                    color: isCurrentMonth ? ColorManager.theme.withOpacity(0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    day.format(format: 'MM-dd (E)'),
                    style: TextStyle(
                      color: isCurrentMonth ? ColorManager.gray33 : ColorManager.gray99,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildCalculationRow(String label, String result) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text('$label:'),
        ),
        Expanded(
          child: Text(
            result,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorManager.blue,
            ),
          ),
        ),
      ],
    ).paddingBottom(8);
  }

  Widget _buildTimeConversionDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('时间转换示例:'),
          16.0.boxH,
          _buildConversionRow('3661秒 → 时:分:秒', DateOption.numToStringTime(3661)),
          _buildConversionRow('7265秒 → 时:分:秒', DateOption.numToStringTime(7265)),
          _buildConversionRow('90秒 → 时:分:秒', DateOption.numToStringTime(90)),
          16.0.boxH,
          _buildConversionRow('3661秒 → 天时分', DateOption.numToStringTimeByDayHourMinute(3661)),
          _buildConversionRow('90061秒 → 天时分', DateOption.numToStringTimeByDayHourMinute(90061)),
          _buildConversionRow('3600秒 → 天时分', DateOption.numToStringTimeByDayHourMinute(3600)),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildConversionRow(String label, String result) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(label),
        ),
        Icon(Icons.arrow_forward, size: 16, color: ColorManager.gray99),
        8.0.boxW,
        Expanded(
          child: Text(
            result,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorManager.green,
            ),
          ),
        ),
      ],
    ).paddingBottom(8);
  }

  Widget _buildCountdownDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('倒计时演示:'),
          16.0.boxH,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorManager.theme.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorManager.theme.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Text(
                  '倒计时时间',
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorManager.gray66,
                  ),
                ),
                8.0.boxH,
                Text(
                  DateOption.numToStringTime(countdownSeconds),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.theme,
                    fontFamily: 'monospace',
                  ),
                ),
                8.0.boxH,
                Text(
                  DateOption.numToStringTimeByDayHourMinute(countdownSeconds),
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorManager.gray66,
                  ),
                ),
              ],
            ),
          ),
          16.0.boxH,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (countdownSeconds > 0) countdownSeconds--;
                    });
                  },
                  child: Text('-1秒'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      countdownSeconds += 60;
                    });
                  },
                  child: Text('+1分钟'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      countdownSeconds = 3661; // 重置
                    });
                  },
                  child: Text('重置'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }
}
