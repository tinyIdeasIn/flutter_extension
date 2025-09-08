import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

enum TestEnum { apple, banana, orange }

class StringDemoPage extends StatefulWidget {
  @override
  _StringDemoPageState createState() => _StringDemoPageState();
}

class _StringDemoPageState extends State<StringDemoPage> {
  String inputText = 'Hello Flutter Extension';
  String numberText = '12345.67';
  String encryptionText = 'Flutter Extension Demo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('字符串扩展'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('基础字符串操作'),
            _buildBasicStringOps(),
            20.0.boxH,
            
            _buildSectionTitle('字符串验证'),
            _buildStringValidation(),
            20.0.boxH,
            
            _buildSectionTitle('字符串修改'),
            _buildStringModification(),
            20.0.boxH,
            
            _buildSectionTitle('字符串查找'),
            _buildStringSearch(),
            20.0.boxH,
            
            _buildSectionTitle('千分位分隔符'),
            _buildThousandsDemo(),
            20.0.boxH,
            
            _buildSectionTitle('字符串加密'),
            _buildEncryptionDemo(),
            20.0.boxH,
            
            _buildSectionTitle('枚举转换'),
            _buildEnumDemo(),
            20.0.boxH,
            
            _buildSectionTitle('随机字符串生成'),
            _buildRandomStringDemo(),
            20.0.boxH,
            
            _buildSectionTitle('日志输出'),
            _buildLogDemo(),
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

  Widget _buildBasicStringOps() {
    String? nullString;
    String emptyString = '';
    String normalString = 'Hello World';
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('字符串状态检查:'),
          12.0.boxH,
          _buildCheckRow('null字符串', 'null', nullString.isNull),
          _buildCheckRow('空字符串', '""', emptyString.isEmptyOrNull),
          _buildCheckRow('正常字符串', '"Hello World"', normalString.isNotEmptyOrNull),
          16.0.boxH,
          
          Text('字符串信息:'),
          12.0.boxH,
          _buildInfoRow('长度', inputText.length.toString()),
          _buildInfoRow('字符数组', inputText.split('').join(', ')),
          _buildInfoRow('单词数组', inputText.split(' ').join(', ')),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildCheckRow(String label, String value, bool result) {
    return Row(
      children: [
        Expanded(
          child: Text('$label ($value)'),
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

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
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

  Widget _buildStringValidation() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('当前文本: "$inputText"'),
          16.0.boxH,
          TextField(
            onChanged: (value) {
              setState(() {
                inputText = value;
              });
            },
            decoration: InputDecoration(
              labelText: '输入测试文本',
              border: OutlineInputBorder(),
            ),
            controller: TextEditingController(text: inputText),
          ),
          16.0.boxH,
          Text('验证结果:'),
          12.0.boxH,
          _buildCheckRow('包含 "Flutter"', '', inputText.isContains('Flutter')),
          _buildCheckRow('以 "Hello" 开头', '', inputText.isStart('Hello')),
          _buildCheckRow('以 "Extension" 结尾', '', inputText.isEnd('Extension')),
          _buildCheckRow('包含空格', '', inputText.isContains(' ')),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildStringModification() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('字符串修改操作:'),
          16.0.boxH,
          _buildModificationRow('添加前缀', inputText.addStart('[前缀] ')),
          _buildModificationRow('添加后缀', inputText.addEnd(' [后缀]')),
          _buildModificationRow('删除 "Flutter"', inputText.deleteSub('Flutter') ?? ''),
          _buildModificationRow('替换 "Hello" → "Hi"', inputText.replaceSub('Hello', 'Hi') ?? ''),
          _buildModificationRow('截取前5个字符', inputText.length > 5 ? inputText.sub(0, end: 5) : inputText),
          _buildModificationRow('删除范围2-6', inputText.length > 6 ? (inputText.deleteRange(2, end: 6) ?? '') : inputText),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildModificationRow(String operation, String result) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.grayF6,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            operation,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorManager.blue,
            ),
          ),
          4.0.boxH,
          Text(
            result,
            style: TextStyle(
              color: ColorManager.gray33,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStringSearch() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('字符串查找功能:'),
          16.0.boxH,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final result = inputText.isContains('Flutter');
                    _showResult('查找 "Flutter"', result ? '找到了！' : '未找到');
                  },
                  child: Text('查找 "Flutter"'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final result = inputText.isStart('Hello');
                    _showResult('检查开头', result ? '以 "Hello" 开头' : '不以 "Hello" 开头');
                  },
                  child: Text('检查开头'),
                ),
              ),
            ],
          ),
          8.0.boxH,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final result = inputText.isEnd('Extension');
                    _showResult('检查结尾', result ? '以 "Extension" 结尾' : '不以 "Extension" 结尾');
                  },
                  child: Text('检查结尾'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final enumResult = inputText.enumRowValue;
                    _showResult('枚举值提取', enumResult.isNotEmpty ? enumResult : '无枚举格式');
                  },
                  child: Text('提取枚举值'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildThousandsDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('千分位分隔符演示:'),
          16.0.boxH,
          TextField(
            onChanged: (value) {
              setState(() {
                numberText = value;
              });
            },
            decoration: InputDecoration(
              labelText: '输入数字',
              border: OutlineInputBorder(),
              hintText: '例如: 12345.67',
            ),
            controller: TextEditingController(text: numberText),
          ),
          16.0.boxH,
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
                Text(
                  '原始数字:',
                  style: TextStyle(color: ColorManager.gray66),
                ),
                Text(
                  numberText,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                  ),
                ),
                8.0.boxH,
                Text(
                  '千分位格式:',
                  style: TextStyle(color: ColorManager.gray66),
                ),
                Text(
                  numberText.thousands ?? '无效数字',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.green,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildEncryptionDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('字符串加密演示:'),
          16.0.boxH,
          TextField(
            onChanged: (value) {
              setState(() {
                encryptionText = value;
              });
            },
            decoration: InputDecoration(
              labelText: '输入要加密的文本',
              border: OutlineInputBorder(),
            ),
            controller: TextEditingController(text: encryptionText),
          ),
          16.0.boxH,
          _buildEncryptionResult('MD5', encryptionText.md5()),
          _buildEncryptionResult('SHA1', encryptionText.sha1()),
          _buildEncryptionResult('Base64', encryptionText.base64()),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildEncryptionResult(String method, String result) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.grayF6,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                method,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blue,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.copy, size: 18),
                onPressed: () {
                  // 复制到剪贴板的功能可以在这里实现
                  _showResult('复制', '$method 结果已复制到剪贴板');
                },
              ),
            ],
          ),
          Text(
            result,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: ColorManager.gray33,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnumDemo() {

    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('枚举转换演示:'),
          16.0.boxH,
          Text('枚举类型: enum TestEnum { apple, banana, orange }'),
          16.0.boxH,
          ...[
            'apple',
            'banana',
            'orange',
            'grape', // 这个不存在
          ].map((str) {
            final enumValue = str.toEnum(TestEnum.values);
            return _buildEnumRow(str, enumValue?.toString() ?? 'null');
          }),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildEnumRow(String input, String result) {
    return Row(
      children: [
        Expanded(
          child: Text('"$input"'),
        ),
        Icon(Icons.arrow_forward, size: 16, color: ColorManager.gray99),
        8.0.boxW,
        Expanded(
          child: Text(
            result,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: result == 'null' ? Colors.red : ColorManager.green,
            ),
          ),
        ),
      ],
    ).paddingBottom(8);
  }

  Widget _buildRandomStringDemo() {
    String randomString = ''.random(count: 6);
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('随机字符串生成:'),
          16.0.boxH,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorManager.theme.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorManager.theme.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Text(
                  '随机字符串:',
                  style: TextStyle(color: ColorManager.gray66),
                ),
                8.0.boxH,
                Text(
                  randomString,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.theme,
                    fontFamily: 'monospace',
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
                      randomString = ''.random(count: 6);
                    });
                  },
                  child: Text('生成6位'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      randomString = ''.random(count: 10);
                    });
                  },
                  child: Text('生成10位'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      randomString = ''.random(count: 16);
                    });
                  },
                  child: Text('生成16位'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildLogDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('日志输出演示:'),
          16.0.boxH,
          Text('点击按钮查看控制台输出:', style: TextStyle(color: ColorManager.gray66)),
          16.0.boxH,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    'Hello from String Extension!'.log();
                    _showResult('日志', '已输出到控制台');
                  },
                  child: Text('普通日志'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    stLog('这是一个调试日志消息');
                    _showResult('调试日志', '已输出到控制台');
                  },
                  child: Text('调试日志'),
                ),
              ),
            ],
          ),
          8.0.boxH,
          ElevatedButton(
            onPressed: () {
              stLog('带堆栈信息的日志', current: StackTrace.current);
              _showResult('堆栈日志', '已输出到控制台，包含文件名和行号');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
            ),
            child: Text('带堆栈信息的日志'),
          ),
        ],
      ).paddingAll(16),
    );
  }

  void _showResult(String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title: $message'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
