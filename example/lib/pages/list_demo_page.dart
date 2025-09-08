import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

class ListDemoPage extends StatefulWidget {
  @override
  _ListDemoPageState createState() => _ListDemoPageState();
}

class _ListDemoPageState extends State<ListDemoPage> {
  List<String>? nullList;
  List<String> emptyList = [];
  List<String> normalList = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
  List<int> numberList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  String inputItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表扩展'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('列表状态检查'),
            _buildListStatusDemo(),
            20.0.boxH,
            
            _buildSectionTitle('列表操作'),
            _buildListOperationsDemo(),
            20.0.boxH,
            
            _buildSectionTitle('安全访问'),
            _buildSafeAccessDemo(),
            20.0.boxH,
            
            _buildSectionTitle('随机元素'),
            _buildRandomElementDemo(),
            20.0.boxH,
            
            _buildSectionTitle('列表修改'),
            _buildListModificationDemo(),
            20.0.boxH,
            
            _buildSectionTitle('实时操作测试'),
            _buildInteractiveDemo(),
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

  Widget _buildListStatusDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('不同状态的列表检查:'),
          16.0.boxH,
          
          _buildStatusRow('null列表', 'null', nullList.isNull, nullList.isEmptyOrNull),
          _buildStatusRow('空列表', '[]', emptyList.isNull, emptyList.isEmptyOrNull),
          _buildStatusRow('正常列表', '[Apple, Banana, ...]', normalList.isNull, normalList.isEmptyOrNull),
          
          16.0.boxH,
          Text('列表长度信息:'),
          8.0.boxH,
          _buildInfoRow('null列表长度', nullList?.length.toString() ?? 'null'),
          _buildInfoRow('空列表长度', emptyList.length.toString()),
          _buildInfoRow('正常列表长度', normalList.length.toString()),
          _buildInfoRow('数字列表长度', numberList.length.toString()),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildStatusRow(String label, String description, bool isNull, bool isEmptyOrNull) {
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
            '$label ($description)',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          8.0.boxH,
          Row(
            children: [
              _buildStatusChip('isNull', isNull),
              8.0.boxW,
              _buildStatusChip('isEmptyOrNull', isEmptyOrNull),
              8.0.boxW,
              _buildStatusChip('isNotEmptyOrNull', !isEmptyOrNull),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, bool value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: value ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: value ? Colors.green : Colors.red,
          width: 1,
        ),
      ),
      child: Text(
        '$label: ${value ? "是" : "否"}',
        style: TextStyle(
          fontSize: 12,
          color: value ? Colors.green.shade700 : Colors.red.shade700,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            '$label:',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: ColorManager.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ).paddingBottom(4);
  }

  Widget _buildListOperationsDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('列表内容展示:'),
          16.0.boxH,
          
          _buildListDisplay('水果列表', normalList),
          _buildListDisplay('数字列表', numberList.map((e) => e.toString()).toList()),
          _buildListDisplay('空列表', emptyList),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildListDisplay(String title, List<String> list) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title (${list.length} 项):',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: ColorManager.blue,
            ),
          ),
          8.0.boxH,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorManager.grayF6,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorManager.grayCC),
            ),
            child: list.isEmpty
                ? Text(
                    '列表为空',
                    style: TextStyle(
                      color: ColorManager.gray99,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                : Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: list.map((item) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: ColorManager.theme.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: ColorManager.theme.withOpacity(0.3)),
                      ),
                      child: Text(
                        item,
                        style: TextStyle(
                          color: ColorManager.theme,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )).toList(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafeAccessDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('安全访问演示:'),
          16.0.boxH,
          
          // 安全获取元素
          Text('stItem 安全获取元素:', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          ...List.generate(normalList.length + 2, (index) {
            final item = normalList.stItem(index);
            return _buildAccessRow('索引 $index', item ?? 'null');
          }),
          
          16.0.boxH,
          Text('边界测试:', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          _buildAccessRow('索引 -1', normalList.stItem(-1) ?? 'null'),
          _buildAccessRow('索引 999', normalList.stItem(999) ?? 'null'),
          _buildAccessRow('空列表索引 0', emptyList.stItem(0) ?? 'null'),
          _buildAccessRow('null列表索引 0', nullList.stItem(0) ?? 'null'),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildAccessRow(String label, String result) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ColorManager.grayF6,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
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
                fontWeight: FontWeight.bold,
                color: result == 'null' ? Colors.red : ColorManager.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRandomElementDemo() {
    String? randomFruit;
    int? randomNumber;
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('随机元素获取:'),
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
                if (randomFruit != null) ...[
                  Text('随机水果:'),
                  8.0.boxH,
                  Text(
                    randomFruit!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.theme,
                    ),
                  ),
                  16.0.boxH,
                ],
                
                if (randomNumber != null) ...[
                  Text('随机数字:'),
                  8.0.boxH,
                  Text(
                    randomNumber.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.green,
                    ),
                  ),
                  16.0.boxH,
                ],
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
                      randomFruit = normalList.random;
                    });
                  },
                  child: Text('随机水果'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      randomNumber = numberList.random;
                    });
                  },
                  child: Text('随机数字'),
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
                    setState(() {
                      randomFruit = emptyList.random;
                    });
                    _showResult('空列表随机', randomFruit ?? 'null');
                  },
                  child: Text('空列表随机'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      randomFruit = nullList.random;
                    });
                    _showResult('null列表随机', randomFruit ?? 'null');
                  },
                  child: Text('null列表随机'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildListModificationDemo() {
    List<String> testList = List.from(normalList);
    
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('列表修改演示 (当前测试列表):'),
          16.0.boxH,
          
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorManager.grayF6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              testList.join(', '),
              style: TextStyle(
                fontFamily: 'monospace',
                color: ColorManager.gray33,
              ),
            ),
          ),
          16.0.boxH,
          
          Text('stInsert 插入演示:', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          _buildModificationRow('在索引2插入"Coconut"', () {
            final success = testList.stInsert(2, 'Coconut');
            return success ? '成功插入' : '插入失败';
          }),
          _buildModificationRow('在索引999插入"Invalid"', () {
            final success = testList.stInsert(999, 'Invalid');
            return success ? '成功插入' : '插入失败（索引越界）';
          }),
          
          16.0.boxH,
          Text('stRemove 删除演示:', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          _buildModificationRow('删除索引1的元素', () {
            if (testList.length > 1) {
              final item = testList.stItem(1);
              testList.stRemove(1);
              return '删除了: $item';
            }
            return '列表太短，无法删除';
          }),
          _buildModificationRow('删除索引999的元素', () {
            testList.stRemove(999);
            return '尝试删除越界索引（安全忽略）';
          }),
          
          16.0.boxH,
          Text('插入到特定位置:', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          _buildModificationRow('插入到开头', () {
            testList.stInsertStart('First');
            return '插入到开头: First';
          }),
          _buildModificationRow('插入到结尾', () {
            testList.stInsertEnd('Last');
            return '插入到结尾: Last';
          }),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildModificationRow(String action, String Function() operation) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(action),
          ),
          ElevatedButton(
            onPressed: () {
              final result = operation();
              _showResult(action, result);
            },
            child: Text('执行'),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('实时操作测试:'),
          16.0.boxH,
          
          Text('当前水果列表:', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorManager.grayF6,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              normalList.join(', '),
              style: TextStyle(color: ColorManager.gray33),
            ),
          ),
          16.0.boxH,
          
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    inputItem = value;
                  },
                  decoration: InputDecoration(
                    labelText: '输入新项目',
                    border: OutlineInputBorder(),
                    hintText: '例如: Grape',
                  ),
                ),
              ),
              8.0.boxW,
              ElevatedButton(
                onPressed: () {
                  if (inputItem.isNotEmpty) {
                    setState(() {
                      normalList.add(inputItem);
                    });
                    _showResult('添加', '已添加: $inputItem');
                  }
                },
                child: Text('添加'),
              ),
            ],
          ),
          16.0.boxH,
          
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: normalList.isNotEmpty ? () {
                    setState(() {
                      final removed = normalList.removeAt(0);
                      _showResult('删除首项', '已删除: $removed');
                    });
                  } : null,
                  child: Text('删除首项'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: normalList.isNotEmpty ? () {
                    setState(() {
                      final removed = normalList.removeLast();
                      _showResult('删除末项', '已删除: $removed');
                    });
                  } : null,
                  child: Text('删除末项'),
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
                    setState(() {
                      normalList.clear();
                    });
                    _showResult('清空', '列表已清空');
                  },
                  child: Text('清空列表'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      normalList = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
                    });
                    _showResult('重置', '列表已重置');
                  },
                  child: Text('重置列表'),
                ),
              ),
            ],
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
