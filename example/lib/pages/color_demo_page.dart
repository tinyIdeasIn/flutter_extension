import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

class ColorDemoPage extends StatefulWidget {
  @override
  _ColorDemoPageState createState() => _ColorDemoPageState();
}

class _ColorDemoPageState extends State<ColorDemoPage> {
  String hexInput = '';
  Color randomColor = ColorManager.random;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('颜色管理扩展'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('预定义颜色'),
            _buildPredefinedColors(),
            20.0.boxH,
            
            _buildSectionTitle('主题色设置'),
            _buildThemeColorDemo(),
            20.0.boxH,
            
            _buildSectionTitle('十六进制颜色转换'),
            _buildHexColorDemo(),
            20.0.boxH,
            
            _buildSectionTitle('随机颜色生成'),
            _buildRandomColorDemo(),
            20.0.boxH,
            
            _buildSectionTitle('透明度颜色'),
            _buildTransparentColorDemo(),
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

  Widget _buildPredefinedColors() {
    return Card(
      child: [
        _buildColorRow('黑色 (black)', ColorManager.black),
        _buildColorRow('白色 (white)', ColorManager.white),
        _buildColorRow('红色 (red)', ColorManager.red),
        _buildColorRow('绿色 (green)', ColorManager.green),
        _buildColorRow('蓝色 (blue)', ColorManager.blue),
        _buildColorRow('粉色 (pink)', ColorManager.pink),
        _buildColorRow('灰色33 (gray33)', ColorManager.gray33),
        _buildColorRow('灰色99 (gray99)', ColorManager.gray99),
        _buildColorRow('背景色 (bg)', ColorManager.bg),
        _buildColorRow('分割线 (divider)', ColorManager.divider),
      ].column(caa: CrossAxisAlignment.start).paddingAll(16),
    );
  }

  Widget _buildColorRow(String name, Color color) {
    return [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: ColorManager.grayCC),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      12.0.boxW,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              color.toString(),
              style: TextStyle(
                fontSize: 12,
                color: ColorManager.gray66,
              ),
            ),
          ],
        ),
      ),
    ].row().paddingBottom(12);
  }

  Widget _buildThemeColorDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('当前主题色：'),
          8.0.boxH,
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: ColorManager.theme,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Theme Color (0x25C489)',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          16.0.boxH,
          ElevatedButton(
            onPressed: () {
              // 随机设置新的主题色
              final colors = [0xFF5722, 0x2196F3, 0x9C27B0, 0x4CAF50, 0xFF9800];
              final randomTheme = colors[colors.length.random];
              ColorManager.init(randomTheme);
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('主题色已更新为: 0x${randomTheme.toRadixString(16).toUpperCase()}')),
              );
            },
            child: Text('随机更换主题色'),
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildHexColorDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('输入十六进制颜色值 (如：FF5722):'),
          TextField(
            onChanged: (value) {
              hexInput = value;
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: '输入十六进制颜色值',
              border: OutlineInputBorder(),
            ),
          ),
          16.0.boxH,
          if (hexInput.isNotEmptyOrNull) ...[
            Text('转换结果:'),
            8.0.boxH,
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: _parseHexColor(hexInput),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorManager.grayCC),
              ),
              child: Center(
                child: Text(
                  hexInput,
                  style: TextStyle(
                    color: _parseHexColor(hexInput).computeLuminance() > 0.5 
                        ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ).paddingAll(16),
    );
  }

  Color _parseHexColor(String hex) {
    try {
      final value = int.parse(hex, radix: 16);
      return ColorManager.hex(value);
    } catch (e) {
      return ColorManager.grayCC;
    }
  }

  Widget _buildRandomColorDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('随机颜色生成:'),
          16.0.boxH,
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: randomColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                randomColor.toString(),
                style: TextStyle(
                  color: randomColor.computeLuminance() > 0.5 
                      ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          16.0.boxH,
          ElevatedButton(
            onPressed: () {
              setState(() {
                randomColor = ColorManager.random;
              });
            },
            child: Text('生成新的随机颜色'),
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildTransparentColorDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('透明度颜色示例:'),
          16.0.boxH,
          Row(
            children: [
              Expanded(
                child: _buildTransparentBox('透明度 0.1', ColorManager.transparent(alpha: 0.1)),
              ),
              8.0.boxW,
              Expanded(
                child: _buildTransparentBox('透明度 0.3', ColorManager.transparent(alpha: 0.3)),
              ),
              8.0.boxW,
              Expanded(
                child: _buildTransparentBox('透明度 0.5', ColorManager.transparent(alpha: 0.5)),
              ),
              8.0.boxW,
              Expanded(
                child: _buildTransparentBox('透明度 0.8', ColorManager.transparent(alpha: 0.8)),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildTransparentBox(String label, Color color) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // 创建棋盘格背景显示透明效果
        gradient: LinearGradient(
          colors: [Colors.white, ColorManager.grayEE],
          stops: [0.5, 0.5],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
