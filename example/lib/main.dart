import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';
import 'pages/color_demo_page.dart';
import 'pages/date_demo_page.dart';
import 'pages/string_demo_page.dart';
import 'pages/number_demo_page.dart';
import 'pages/list_demo_page.dart';
import 'pages/widget_demo_page.dart';
import 'pages/map_demo_page.dart';

void main() {
  // 初始化颜色主题
  ColorManager.init(0x25C489);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter扩展库示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.theme,
          foregroundColor: Colors.white,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<DemoItem> demoItems = [
    DemoItem(
      title: '颜色管理扩展',
      subtitle: '主题色、十六进制颜色、随机颜色等',
      icon: Icons.palette,
      page: ColorDemoPage(),
    ),
    DemoItem(
      title: '日期时间扩展',
      subtitle: '日期格式化、时间计算、倒计时等',
      icon: Icons.access_time,
      page: DateDemoPage(),
    ),
    DemoItem(
      title: '字符串扩展',
      subtitle: '字符串操作、加密、验证等',
      icon: Icons.text_fields,
      page: StringDemoPage(),
    ),
    DemoItem(
      title: '数字扩展',
      subtitle: 'Int/Double千分位、随机数、范围限制等',
      icon: Icons.calculate,
      page: NumberDemoPage(),
    ),
    DemoItem(
      title: '列表扩展',
      subtitle: '列表安全操作、随机元素获取等',
      icon: Icons.list,
      page: ListDemoPage(),
    ),
    DemoItem(
      title: 'Widget扩展',
      subtitle: 'Padding、Margin、点击事件、样式等',
      icon: Icons.widgets,
      page: WidgetDemoPage(),
    ),
    DemoItem(
      title: 'Map扩展',
      subtitle: 'Map的安全访问和操作',
      icon: Icons.map,
      page: MapDemoPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter扩展库示例'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: demoItems.length,
        itemBuilder: (context, index) {
          final item = demoItems[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(
                item.icon,
                color: ColorManager.theme,
                size: 32,
              ),
              title: Text(
                item.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(item.subtitle),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.page),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DemoItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget page;

  DemoItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.page,
  });
}
