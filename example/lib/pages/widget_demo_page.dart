import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

class WidgetDemoPage extends StatefulWidget {
  @override
  _WidgetDemoPageState createState() => _WidgetDemoPageState();
}

class _WidgetDemoPageState extends State<WidgetDemoPage> {
  bool isVisible = true;
  int tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget扩展'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Padding 扩展'),
            _buildPaddingDemo(),
            20.0.boxH,
            
            _buildSectionTitle('Margin 扩展'),
            _buildMarginDemo(),
            20.0.boxH,
            
            _buildSectionTitle('尺寸扩展'),
            _buildSizeDemo(),
            20.0.boxH,
            
            _buildSectionTitle('点击事件扩展'),
            _buildTapDemo(),
            20.0.boxH,
            
            _buildSectionTitle('布局扩展'),
            _buildLayoutDemo(),
            20.0.boxH,
            
            _buildSectionTitle('样式扩展'),
            _buildStyleDemo(),
            20.0.boxH,
            
            _buildSectionTitle('位置扩展'),
            _buildPositionDemo(),
            20.0.boxH,
            
            _buildSectionTitle('可见性扩展'),
            _buildVisibilityDemo(),
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

  Widget _buildPaddingDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Padding 扩展演示:'),
          16.0.boxH,
          
          Text('paddingAll() - 四周相同内边距:'),
          8.0.boxH,
          Container(
            color: ColorManager.grayF6,
            child: Text('16px padding all')
                .paddingAll(16)
                .color(ColorManager.theme.withOpacity(0.2)),
          ),
          16.0.boxH,
          
          Text('paddingSH() - 水平内边距:'),
          8.0.boxH,
          Container(
            color: ColorManager.grayF6,
            child: Text('20px horizontal padding')
                .paddingSH(20)
                .color(ColorManager.green.withOpacity(0.2)),
          ),
          16.0.boxH,
          
          Text('paddingSV() - 垂直内边距:'),
          8.0.boxH,
          Container(
            color: ColorManager.grayF6,
            child: Text('24px vertical padding')
                .paddingSV(24)
                .color(ColorManager.blue.withOpacity(0.2)),
          ),
          16.0.boxH,
          
          Text('方向性内边距:'),
          8.0.boxH,
          Container(
            color: ColorManager.grayF6,
            child: [
              Text('Top: 10px').paddingTop(10).color(Colors.red.withOpacity(0.2)),
              Text('Bottom: 15px').paddingBottom(15).color(Colors.orange.withOpacity(0.2)),
              Text('Left: 20px').paddingLeft(20).color(Colors.yellow.withOpacity(0.2)),
              Text('Right: 25px').paddingRight(25).color(Colors.green.withOpacity(0.2)),
            ].column(caa: CrossAxisAlignment.start),
          ),
          16.0.boxH,
          
          Text('Double 扩展的 Padding:'),
          8.0.boxH,
          Container(
            color: ColorManager.grayF6,
            child: [
              Text('12.0.paddingAll'),
              12.0.paddingAll,
              Text('8.0.paddingT'),
              8.0.paddingT,
              Text('16.0.paddingB'),
              16.0.paddingB,
            ].column(caa: CrossAxisAlignment.start),
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildMarginDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Margin 扩展演示:'),
          16.0.boxH,
          
          Container(
            color: ColorManager.grayF6,
            child: Column(
              children: [
                Text('marginAll(12) - 四周外边距')
                    .color(ColorManager.theme.withOpacity(0.3))
                    .marginAll(12),
                
                Text('margin(EdgeInsets.only(left: 24)) - 自定义外边距')
                    .color(ColorManager.green.withOpacity(0.3))
                    .margin(EdgeInsets.only(left: 24)),
                
                Text('组合使用: margin + padding')
                    .paddingAll(8)
                    .color(ColorManager.blue.withOpacity(0.3))
                    .marginAll(8),
              ],
            ),
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildSizeDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('尺寸扩展演示:'),
          16.0.boxH,
          
          Text('SizedBox 扩展:'),
          8.0.boxH,
          Row(
            children: [
              Text('宽度间隔'),
              20.0.boxW, // 20px 宽度的 SizedBox
              Text('20px'),
              40.0.boxW, // 40px 宽度的 SizedBox
              Text('40px'),
            ],
          ),
          16.0.boxH,
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('高度间隔'),
              10.0.boxH, // 10px 高度的 SizedBox
              Text('10px间隔'),
              20.0.boxH, // 20px 高度的 SizedBox
              Text('20px间隔'),
            ],
          ),
          16.0.boxH,
          
          Text('Widget 尺寸扩展:'),
          8.0.boxH,
          Row(
            children: [
              Text('固定宽度150')
                  .sizeW(150)
                  .color(ColorManager.theme.withOpacity(0.2))
                  .paddingAll(8),
              8.0.boxW,
              Text('固定高度60')
                  .sizeH(60)
                  .color(ColorManager.green.withOpacity(0.2))
                  .paddingAll(8),
            ],
          ),
          16.0.boxH,
          
          Text('自定义尺寸')
              .size(size: Size(200, 50))
              .color(ColorManager.blue.withOpacity(0.2))
              .paddingAll(8),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildTapDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('点击事件扩展演示:'),
          16.0.boxH,
          
          Text('点击次数: $tapCount', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
          ),
          16.0.boxH,
          
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorManager.theme.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'onTap() 扩展\n点击我！',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ).onTap(() {
                  setState(() {
                    tapCount++;
                  });
                  _showResult('onTap', '点击次数: $tapCount');
                }),
              ),
              8.0.boxW,
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorManager.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'inkWell() 扩展\n带水波纹效果',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ).inkWell(() {
                  setState(() {
                    tapCount++;
                  });
                  _showResult('InkWell', '水波纹点击，次数: $tapCount');
                }),
              ),
            ],
          ),
          16.0.boxH,
          
          ElevatedButton(
            onPressed: () {
              setState(() {
                tapCount = 0;
              });
            },
            child: Text('重置计数'),
          ).sizeW(double.infinity),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildLayoutDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('布局扩展演示:'),
          16.0.boxH,
          
          Text('Row 扩展 (水平布局):'),
          8.0.boxH,
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorManager.grayF6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: [
              Container(width: 40, height: 40, color: Colors.red),
              Container(width: 40, height: 40, color: Colors.green),
              Container(width: 40, height: 40, color: Colors.blue),
            ].row(maa: MainAxisAlignment.spaceEvenly),
          ),
          16.0.boxH,
          
          Text('Column 扩展 (垂直布局):'),
          8.0.boxH,
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorManager.grayF6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: [
              Container(width: 60, height: 20, color: Colors.purple),
              Container(width: 60, height: 20, color: Colors.orange),
              Container(width: 60, height: 20, color: Colors.cyan),
            ].column(maa: MainAxisAlignment.spaceEvenly, caa: CrossAxisAlignment.center),
          ),
          16.0.boxH,
          
          Text('Expanded 扩展:'),
          8.0.boxH,
          Container(
            height: 60,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorManager.grayF6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  color: Colors.red,
                  child: Text('Flex: 1', style: TextStyle(color: Colors.white)),
                ).expand(flex: 1).paddingAll(8),
                8.0.boxW,
                Container(
                  color: Colors.green,
                  child: Text('Flex: 2', style: TextStyle(color: Colors.white)),
                ).expand(flex: 2).paddingAll(8),
                8.0.boxW,
                Container(
                  color: Colors.blue,
                  child: Text('Flex: 1', style: TextStyle(color: Colors.white)),
                ).expand(flex: 1).paddingAll(8),
              ],
            ),
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildStyleDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('样式扩展演示:'),
          16.0.boxH,
          
          Text('颜色扩展:'),
          8.0.boxH,
          Text('背景色扩展')
              .paddingAll(12)
              .color(ColorManager.theme.withOpacity(0.3)),
          16.0.boxH,
          
          Text('圆角扩展:'),
          8.0.boxH,
          Row(
            children: [
              Text('8px圆角')
                  .paddingAll(12)
                  .color(ColorManager.green.withOpacity(0.3))
                  .radius(8),
              8.0.boxW,
              Text('16px圆角')
                  .paddingAll(12)
                  .color(ColorManager.blue.withOpacity(0.3))
                  .radius(16),
            ],
          ),
          16.0.boxH,
          
          Text('边框扩展:'),
          8.0.boxH,
          Row(
            children: [
              Text('1px边框')
                  .paddingAll(12)
                  .border(1),
              8.0.boxW,
              Text('2px彩色边框')
                  .paddingAll(12)
                  .border(2, color: ColorManager.theme),
            ],
          ),
          16.0.boxH,
          
          Text('组合样式:'),
          8.0.boxH,
          Text('圆角 + 边框 + 背景色')
              .paddingAll(16)
              .color(ColorManager.grayF6)
              .radius(12)
              .border(2, color: ColorManager.theme),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildPositionDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('位置扩展演示:'),
          16.0.boxH,
          
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: ColorManager.grayF6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Text('左上角')
                    .paddingAll(8)
                    .color(Colors.red.withOpacity(0.3))
                    .position(left: 0, top: 0),
                
                Text('右上角')
                    .paddingAll(8)
                    .color(Colors.green.withOpacity(0.3))
                    .position(right: 0, top: 0),
                
                Text('左下角')
                    .paddingAll(8)
                    .color(Colors.blue.withOpacity(0.3))
                    .position(left: 0, bottom: 0),
                
                Text('右下角')
                    .paddingAll(8)
                    .color(Colors.orange.withOpacity(0.3))
                    .position(right: 0, bottom: 0),
                
                Text('中心位置')
                    .paddingAll(8)
                    .color(ColorManager.theme.withOpacity(0.3))
                    .position(left: 80, top: 50),
              ],
            ),
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildVisibilityDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('可见性扩展演示:'),
          16.0.boxH,
          
          Row(
            children: [
              Text('显示/隐藏状态: '),
              Switch(
                value: isVisible,
                onChanged: (value) {
                  setState(() {
                    isVisible = value;
                  });
                },
              ),
            ],
          ),
          16.0.boxH,
          
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.grayF6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Text('我总是可见的')
                    .paddingAll(12)
                    .color(ColorManager.green.withOpacity(0.3))
                    .position(left: 10, top: 10),
                
                Text('我会根据开关显示/隐藏')
                    .paddingAll(12)
                    .color(ColorManager.theme.withOpacity(0.3))
                    .position(left: 10, top: 50)
                    .offstage(!isVisible), // 注意：offstage(true) 表示隐藏
              ],
            ),
          ),
          16.0.boxH,
          
          Text(
            'offstage() 扩展说明：\n'
            '• offstage(true) = 隐藏 widget\n'
            '• offstage(false) = 显示 widget\n'
            '• 与 Visibility 不同，offstage 完全移除 widget 的布局空间',
            style: TextStyle(
              fontSize: 12,
              color: ColorManager.gray66,
            ),
          ),
        ],
      ).paddingAll(16),
    );
  }

  void _showResult(String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title: $message'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
