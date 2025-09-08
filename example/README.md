# Flutter Extension 示例项目

这是一个展示 Flutter Extension 插件所有功能的完整示例项目。

## 项目概述

此示例项目全面演示了 Flutter Extension 插件提供的各种扩展功能，包括：

- **颜色管理扩展** - 主题色、十六进制颜色转换、随机颜色等
- **日期时间扩展** - 日期格式化、时间计算、倒计时等
- **字符串扩展** - 字符串操作、加密、验证等
- **数字扩展** - Int/Double 千分位、随机数、范围限制等
- **列表扩展** - 列表安全操作、随机元素获取等
- **Widget扩展** - Padding、Margin、点击事件、样式等
- **Map扩展** - Map 的安全访问和操作

## 运行要求

- Flutter SDK >= 1.17.0
- Dart SDK >= 2.19.0

## 快速开始

1. **克隆项目**
   ```bash
   git clone <your-repo-url>
   cd extension/example
   ```

2. **安装依赖**
   ```bash
   flutter pub get
   ```

3. **运行项目**
   ```bash
   flutter run
   ```

## 功能演示

### 🎨 颜色管理扩展

```dart
// 预定义颜色
ColorManager.theme    // 主题色
ColorManager.red      // 红色
ColorManager.green    // 绿色

// 十六进制颜色
ColorManager.hex(0xFF5722)           // 创建颜色
ColorManager.hexStr('#FF5722')       // 字符串转颜色

// 随机颜色
ColorManager.random                  // 随机颜色生成

// 透明度颜色
ColorManager.transparent(alpha: 0.5) // 半透明黑色
```

### 📅 日期时间扩展

```dart
DateTime now = DateTime.now();

// 格式化
now.format(format: 'yyyy-MM-dd')    // 2024-01-01
now.format(format: 'HH:mm:ss')      // 14:30:25

// 判断
now.isToday                         // 是否今天
now.isYesterday                     // 是否昨天

// 计算
now.firstDayOfMonth                 // 本月第一天
now.lastDayOfMonth                  // 本月最后一天
now.previousMonth                   // 上个月
now.nextMonth                       // 下个月

// 时间转换
DateOption.numToStringTime(3661)    // "01:01:01"
```

### 🔤 字符串扩展

```dart
String? text = "Hello Flutter";

// 状态检查
text.isNull                         // 是否为null
text.isEmptyOrNull                  // 是否为null或空
text.isNotEmptyOrNull               // 是否不为null且不为空

// 字符串操作
text.addStart("Hi! ")               // 添加前缀
text.addEnd(" World")               // 添加后缀
text.deleteSub("Flutter")           // 删除子字符串
text.replaceSub("Hello", "Hi")      // 替换子字符串

// 加密
text.md5()                          // MD5加密
text.sha1()                         // SHA1加密
text.base64()                       // Base64编码

// 千分位
"12345".thousands                   // "12,345"
```

### 🔢 数字扩展

```dart
int number = 12345;
double decimal = 12345.67;

// 千分位
number.thousands                    // "12,345"
decimal.thousands                   // "12,345.67"

// 随机数
100.random                          // 0-99的随机数

// 范围限制
150.range(100, 0)                   // 限制在0-100，返回100
```

### 📋 列表扩展

```dart
List<String>? list = ['A', 'B', 'C'];

// 状态检查
list.isNull                         // 是否为null
list.isEmptyOrNull                  // 是否为null或空
list.isNotEmptyOrNull               // 是否不为null且不为空

// 安全访问
list.stItem(0)                      // 安全获取元素，越界返回null
list.random                         // 随机获取元素

// 安全修改
list.stInsert(1, 'X')               // 安全插入
list.stRemove(0)                    // 安全删除
list.stInsertStart('First')         // 插入到开头
list.stInsertEnd('Last')            // 插入到末尾
```

### 🎨 Widget扩展

```dart
Widget widget = Text('Hello');

// Padding
widget.paddingAll(16)               // 四周16px内边距
widget.paddingSH(20)                // 水平20px内边距
widget.paddingSV(12)                // 垂直12px内边距
widget.paddingTop(8)                // 顶部8px内边距

// Margin
widget.marginAll(16)                // 四周16px外边距

// 尺寸
widget.sizeW(100)                   // 固定宽度100
widget.sizeH(50)                    // 固定高度50

// 点击事件
widget.onTap(() => print('Tap'))    // 添加点击事件
widget.inkWell(() => print('Tap'))  // 水波纹点击

// 样式
widget.color(Colors.red)            // 背景色
widget.radius(8)                    // 圆角
widget.border(1, color: Colors.blue) // 边框

// 布局
[widget1, widget2].row()            // 水平布局
[widget1, widget2].column()         // 垂直布局
widget.expand(flex: 2)              // Expanded包装

// 位置
widget.position(left: 10, top: 20)  // 绝对定位
widget.offstage(true)               // 隐藏/显示
```

### 🗂️ Map扩展

```dart
Map<String, dynamic> map = {'name': 'John', 'age': 25};

// 安全访问
map.value('name')                   // 安全获取值，不存在返回null
map.value('nonexistent')            // 返回null而不抛异常

// 设置值
map.set(key: 'email', obj: 'john@example.com');  // 设置值
map.set(key: 'age', obj: null);     // 删除键（obj为null时）

// 添加或更新
map.add('status', 'active');        // 添加新键或更新现有键
```

## 项目结构

```
example/
├── lib/
│   ├── main.dart                   # 应用入口和主页面
│   └── pages/                      # 演示页面
│       ├── color_demo_page.dart    # 颜色扩展演示
│       ├── date_demo_page.dart     # 日期扩展演示
│       ├── string_demo_page.dart   # 字符串扩展演示
│       ├── number_demo_page.dart   # 数字扩展演示
│       ├── list_demo_page.dart     # 列表扩展演示
│       ├── widget_demo_page.dart   # Widget扩展演示
│       └── map_demo_page.dart      # Map扩展演示
├── pubspec.yaml                    # 项目配置
└── README.md                       # 项目说明
```

## 特色功能

### 🔧 实用的扩展方法
- 所有扩展方法都考虑了空安全
- 提供了丰富的默认值和错误处理
- 支持链式调用，提高代码可读性

### 🎯 全面的演示
- 每个扩展功能都有详细的使用示例
- 包含边界情况和错误处理的演示
- 提供实时交互测试功能

### 📱 现代化UI
- 采用Material Design设计规范
- 响应式布局，适配不同屏幕尺寸
- 直观的演示界面和清晰的代码展示

## 学习建议

1. **从主页开始** - 浏览所有功能模块的概览
2. **逐个探索** - 点击每个模块深入了解具体功能
3. **动手实践** - 在演示页面中尝试不同的输入和操作
4. **查看源码** - 参考示例代码了解最佳实践
5. **应用到项目** - 将学到的扩展方法应用到实际项目中

## 相关链接

- [Flutter Extension 插件源码](../lib/)
- [Flutter 官方文档](https://flutter.dev/docs)
- [Dart 扩展方法文档](https://dart.dev/guides/language/extension-methods)

## 问题反馈

如果您在使用过程中遇到问题或有改进建议，欢迎提交 Issue 或 Pull Request。

## 许可证

MIT License - 详见 [LICENSE](../LICENSE) 文件
