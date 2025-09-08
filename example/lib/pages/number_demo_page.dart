import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

class NumberDemoPage extends StatefulWidget {
  @override
  _NumberDemoPageState createState() => _NumberDemoPageState();
}

class _NumberDemoPageState extends State<NumberDemoPage> {
  int intValue = 12345;
  double doubleValue = 12345.678;
  int rangeValue = 50;
  int maxRange = 100;
  int minRange = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数字扩展'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Int 扩展功能'),
            _buildIntExtensions(),
            20.0.boxH,
            
            _buildSectionTitle('Double 扩展功能'),
            _buildDoubleExtensions(),
            20.0.boxH,
            
            _buildSectionTitle('千分位分隔符'),
            _buildThousandsDemo(),
            20.0.boxH,
            
            _buildSectionTitle('随机数生成'),
            _buildRandomDemo(),
            20.0.boxH,
            
            _buildSectionTitle('数字范围限制'),
            _buildRangeDemo(),
            20.0.boxH,
            
            _buildSectionTitle('数字转换'),
            _buildConversionDemo(),
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

  Widget _buildIntExtensions() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Int 扩展方法演示:'),
          16.0.boxH,
          
          // 输入框
          TextField(
            onChanged: (value) {
              setState(() {
                intValue = int.tryParse(value) ?? 0;
              });
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: '输入整数',
              border: OutlineInputBorder(),
              hintText: '例如: 12345',
            ),
            controller: TextEditingController(text: intValue.toString()),
          ),
          16.0.boxH,
          
          // 显示结果
          _buildResultCard('原始值', intValue.toString()),
          _buildResultCard('千分位格式', intValue.thousands),
          _buildResultCard('随机数 (0-$intValue)', intValue > 0 ? intValue.random.toString() : '0'),
          _buildResultCard('范围限制 (0-100)', intValue.range(100, 0).toString()),
          
          16.0.boxH,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      intValue = intValue > 0 ? intValue.random : 0;
                    });
                  },
                  child: Text('生成随机数'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      intValue = 1234567;
                    });
                  },
                  child: Text('设为大数'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildDoubleExtensions() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Double 扩展方法演示:'),
          16.0.boxH,
          
          // 输入框
          TextField(
            onChanged: (value) {
              setState(() {
                doubleValue = double.tryParse(value) ?? 0.0;
              });
            },
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: '输入浮点数',
              border: OutlineInputBorder(),
              hintText: '例如: 12345.678',
            ),
            controller: TextEditingController(text: doubleValue.toString()),
          ),
          16.0.boxH,
          
          // 显示结果
          _buildResultCard('原始值', doubleValue.toString()),
          _buildResultCard('字符串转换', doubleValue.string()),
          _buildResultCard('千分位格式', doubleValue.thousands),
          
          16.0.boxH,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      doubleValue = 9876543.21;
                    });
                  },
                  child: Text('设为示例值'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      doubleValue = double.parse((doubleValue * 2).toStringAsFixed(2));
                    });
                  },
                  child: Text('乘以2'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildResultCard(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.grayF6,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: ColorManager.blue,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 16,
                color: ColorManager.gray33,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThousandsDemo() {
    final testNumbers = [
      1234,
      12345,
      123456,
      1234567,
      12345678,
      123456789,
    ];

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('千分位分隔符示例:'),
          16.0.boxH,
          ...testNumbers.map((number) => _buildThousandsRow(number)),
          16.0.boxH,
          Text('Double 千分位示例:'),
          8.0.boxH,
          _buildThousandsRow(1234.56, isDouble: true),
          _buildThousandsRow(12345.678, isDouble: true),
          _buildThousandsRow(123456.7890, isDouble: true),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildThousandsRow(dynamic number, {bool isDouble = false}) {
    String original = number.toString();
    String formatted = isDouble 
        ? (number as double).thousands 
        : (number as int).thousands;
    
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: ColorManager.grayF6,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              original,
              style: TextStyle(
                fontFamily: 'monospace',
                color: ColorManager.gray66,
              ),
            ),
          ),
          Icon(Icons.arrow_forward, size: 16, color: ColorManager.gray99),
          8.0.boxW,
          Expanded(
            child: Text(
              formatted,
              style: TextStyle(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                color: ColorManager.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRandomDemo() {
    List<int> randomResults = [];
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('随机数生成演示:'),
          16.0.boxH,
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorManager.theme.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorManager.theme.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Text('生成 0 到 ${intValue} 之间的随机数'),
                16.0.boxH,
                if (randomResults.isNotEmpty) ...[
                  Text('最近生成的随机数:'),
                  8.0.boxH,
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: randomResults.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              randomResults[index].toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.theme,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
          16.0.boxH,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: intValue > 0 ? () {
                    setState(() {
                      randomResults.add(intValue.random);
                      if (randomResults.length > 10) {
                        randomResults.removeAt(0);
                      }
                    });
                  } : null,
                  child: Text('生成随机数'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      randomResults.clear();
                    });
                  },
                  child: Text('清空结果'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildRangeDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('数字范围限制演示:'),
          16.0.boxH,
          
          // 范围输入
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      minRange = int.tryParse(value) ?? 0;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '最小值',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: minRange.toString()),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      maxRange = int.tryParse(value) ?? 100;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '最大值',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: maxRange.toString()),
                ),
              ),
            ],
          ),
          16.0.boxH,
          
          // 测试值输入
          TextField(
            onChanged: (value) {
              setState(() {
                rangeValue = int.tryParse(value) ?? 50;
              });
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: '测试值',
              border: OutlineInputBorder(),
              hintText: '输入要限制范围的数字',
            ),
            controller: TextEditingController(text: rangeValue.toString()),
          ),
          16.0.boxH,
          
          // 结果显示
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorManager.grayF6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('范围限制结果:'),
                8.0.boxH,
                Text(
                  '原始值: $rangeValue',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '范围: $minRange - $maxRange',
                  style: TextStyle(fontSize: 16, color: ColorManager.gray66),
                ),
                Text(
                  '限制后: ${rangeValue.range(maxRange, minRange)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.green,
                  ),
                ),
              ],
            ),
          ),
          16.0.boxH,
          
          // 测试按钮
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rangeValue = minRange - 10; // 超出下限
                    });
                  },
                  child: Text('测试下限'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rangeValue = maxRange + 10; // 超出上限
                    });
                  },
                  child: Text('测试上限'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rangeValue = (minRange + maxRange) ~/ 2; // 中间值
                    });
                  },
                  child: Text('中间值'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildConversionDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('数字转换示例:'),
          16.0.boxH,
          
          _buildConversionExample('整数转字符串', intValue, intValue.toString()),
          _buildConversionExample('浮点数转字符串', doubleValue, doubleValue.string()),
          _buildConversionExample('整数转千分位', intValue, intValue.thousands),
          _buildConversionExample('浮点数转千分位', doubleValue, doubleValue.thousands),
          
          16.0.boxH,
          Text('特殊情况测试:'),
          8.0.boxH,
          _buildConversionExample('负数千分位', -12345, (-12345).thousands),
          _buildConversionExample('小数千分位', 123.45, 123.45.thousands),
          _buildConversionExample('零的千分位', 0, 0.thousands),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildConversionExample(String label, dynamic input, String output) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.grayF6,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorManager.blue,
            ),
          ),
          4.0.boxH,
          Row(
            children: [
              Expanded(
                child: Text(
                  '输入: $input',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
              ),
              Icon(Icons.arrow_forward, size: 16),
              Expanded(
                child: Text(
                  '输出: $output',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                    color: ColorManager.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
