import 'package:flutter/material.dart';
import 'package:flutter_extension/flutter_extension.dart';

class MapDemoPage extends StatefulWidget {
  @override
  _MapDemoPageState createState() => _MapDemoPageState();
}

class _MapDemoPageState extends State<MapDemoPage> {
  Map<String, dynamic> userMap = {
    'name': 'John Doe',
    'age': 25,
    'email': 'john@example.com',
    'isActive': true,
    'score': 95.5,
  };

  Map<String, String> cityMap = {
    'beijing': '北京',
    'shanghai': '上海',
    'guangzhou': '广州',
    'shenzhen': '深圳',
  };

  Map<int, String> statusMap = {
    1: '待处理',
    2: '进行中',
    3: '已完成',
    4: '已取消',
  };

  String searchKey = '';
  String newKey = '';
  String newValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map扩展'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Map基础操作'),
            _buildBasicMapDemo(),
            20.0.boxH,
            
            _buildSectionTitle('安全访问 value()'),
            _buildSafeAccessDemo(),
            20.0.boxH,
            
            _buildSectionTitle('Map修改 set()'),
            _buildMapModificationDemo(),
            20.0.boxH,
            
            _buildSectionTitle('Map添加 add()'),
            _buildMapAddDemo(),
            20.0.boxH,
            
            _buildSectionTitle('实时操作测试'),
            _buildInteractiveDemo(),
            20.0.boxH,
            
            _buildSectionTitle('不同类型的Map'),
            _buildDifferentTypeMaps(),
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

  Widget _buildBasicMapDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('当前用户信息 Map:'),
          16.0.boxH,
          _buildMapDisplay(userMap),
          16.0.boxH,
          
          Text('Map 基础信息:'),
          8.0.boxH,
          _buildInfoRow('键的数量', userMap.keys.length.toString()),
          _buildInfoRow('值的数量', userMap.values.length.toString()),
          _buildInfoRow('是否为空', userMap.isEmpty.toString()),
          _buildInfoRow('是否不为空', userMap.isNotEmpty.toString()),
          _buildInfoRow('所有键', userMap.keys.join(', ')),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildMapDisplay(Map map) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.grayF6,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorManager.grayCC),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: map.entries.map((entry) {
          return Container(
            margin: EdgeInsets.only(bottom: 6),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '${entry.key}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ColorManager.blue,
                    ),
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(color: ColorManager.gray99),
                ),
                8.0.boxW,
                Expanded(
                  flex: 3,
                  child: Text(
                    '${entry.value} (${entry.value.runtimeType})',
                    style: TextStyle(
                      color: ColorManager.gray33,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
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
            style: TextStyle(
              color: ColorManager.gray66,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ],
    ).paddingBottom(6);
  }

  Widget _buildSafeAccessDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('value() 安全访问演示:'),
          16.0.boxH,
          
          TextField(
            onChanged: (value) {
              setState(() {
                searchKey = value;
              });
            },
            decoration: InputDecoration(
              labelText: '输入要查找的键',
              border: OutlineInputBorder(),
              hintText: '例如: name, age, email',
            ),
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
                Text('查找结果:'),
                8.0.boxH,
                if (searchKey.isNotEmpty) ...[
                  _buildSearchResult('用户Map', userMap.value(searchKey)),
                  _buildSearchResult('城市Map', cityMap.value(searchKey)),
                  _buildSearchResult('状态Map (尝试转int)', statusMap.value(int.tryParse(searchKey))),
                ] else
                  Text(
                    '请输入要查找的键',
                    style: TextStyle(
                      color: ColorManager.gray99,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
          ),
          16.0.boxH,
          
          Text('预设查找示例:'),
          8.0.boxH,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['name', 'age', 'nonexistent', 'email'].map((key) {
              return ElevatedButton(
                onPressed: () {
                  setState(() {
                    searchKey = key;
                  });
                },
                child: Text(key),
              );
            }).toList(),
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildSearchResult(String mapName, dynamic result) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: result != null ? ColorManager.green.withOpacity(0.1) : ColorManager.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: result != null ? ColorManager.green.withOpacity(0.3) : ColorManager.red.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(mapName),
          ),
          Icon(
            result != null ? Icons.check_circle : Icons.cancel,
            color: result != null ? Colors.green : Colors.red,
            size: 16,
          ),
          8.0.boxW,
          Expanded(
            child: Text(
              result?.toString() ?? 'null',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: result != null ? ColorManager.green : Colors.red,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapModificationDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('set() 方法演示:'),
          16.0.boxH,
          
          Text('set() 方法特点:', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorManager.theme.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• key 为 null 时，不执行任何操作'),
                Text('• value 为 null 时，删除该键值对'),
                Text('• value 不为 null 时，设置或更新键值对'),
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
                      userMap.set(key: 'status', obj: '在线');
                    });
                    _showResult('set操作', '添加了 status: 在线');
                  },
                  child: Text('添加状态'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userMap.set(key: 'age', obj: 26);
                    });
                    _showResult('set操作', '更新了 age: 26');
                  },
                  child: Text('更新年龄'),
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
                      userMap.set(key: 'email', obj: null); // 删除
                    });
                    _showResult('set操作', '删除了 email 键');
                  },
                  child: Text('删除邮箱'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userMap.set(key: null, obj: 'test'); // 无效操作
                    });
                    _showResult('set操作', 'key为null，操作被忽略');
                  },
                  child: Text('无效操作'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildMapAddDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('add() 方法演示:'),
          16.0.boxH,
          
          Text('add() 方法特点:', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ColorManager.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• 如果键已存在，更新其值'),
                Text('• 如果键不存在，添加新的键值对'),
                Text('• key 为 null 时，不执行任何操作'),
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
                      userMap.add('hobby', ['读书', '游泳', '编程']);
                    });
                    _showResult('add操作', '添加了爱好列表');
                  },
                  child: Text('添加爱好'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userMap.add('name', 'Jane Doe');
                    });
                    _showResult('add操作', '更新了姓名');
                  },
                  child: Text('更新姓名'),
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
                      userMap.add('createTime', DateTime.now().toString());
                    });
                    _showResult('add操作', '添加了创建时间');
                  },
                  child: Text('添加时间'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userMap.add('score', userMap.value('score') + 5);
                    });
                    _showResult('add操作', '分数增加了5分');
                  },
                  child: Text('增加分数'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildInteractiveDemo() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('自定义Map操作:'),
          16.0.boxH,
          
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    newKey = value;
                  },
                  decoration: InputDecoration(
                    labelText: '键 (Key)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    newValue = value;
                  },
                  decoration: InputDecoration(
                    labelText: '值 (Value)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          16.0.boxH,
          
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: newKey.isNotEmpty && newValue.isNotEmpty ? () {
                    setState(() {
                      userMap.set(key: newKey, obj: newValue);
                    });
                    _showResult('自定义操作', '使用set添加: $newKey = $newValue');
                  } : null,
                  child: Text('使用 set() 添加'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: newKey.isNotEmpty && newValue.isNotEmpty ? () {
                    setState(() {
                      userMap.add(newKey, newValue);
                    });
                    _showResult('自定义操作', '使用add添加: $newKey = $newValue');
                  } : null,
                  child: Text('使用 add() 添加'),
                ),
              ),
            ],
          ),
          8.0.boxH,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: newKey.isNotEmpty ? () {
                    setState(() {
                      userMap.set(key: newKey, obj: null); // 删除
                    });
                    _showResult('自定义操作', '删除了键: $newKey');
                  } : null,
                  child: Text('删除键'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userMap = {
                        'name': 'John Doe',
                        'age': 25,
                        'email': 'john@example.com',
                        'isActive': true,
                        'score': 95.5,
                      };
                    });
                    _showResult('重置', '用户Map已重置');
                  },
                  child: Text('重置Map'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }

  Widget _buildDifferentTypeMaps() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('不同类型的Map演示:'),
          16.0.boxH,
          
          Text('城市Map (String → String):', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          _buildMapDisplay(cityMap),
          16.0.boxH,
          
          Text('状态Map (int → String):', style: TextStyle(fontWeight: FontWeight.w500)),
          8.0.boxH,
          _buildMapDisplay(statusMap),
          16.0.boxH,
          
          Text('扩展方法测试:'),
          8.0.boxH,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final city = cityMap.value('beijing');
                    _showResult('城市查找', 'beijing → ${city ?? "未找到"}');
                  },
                  child: Text('查找北京'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final status = statusMap.value(2);
                    _showResult('状态查找', '2 → ${status ?? "未找到"}');
                  },
                  child: Text('查找状态2'),
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
                      cityMap.add('hangzhou', '杭州');
                    });
                    _showResult('城市添加', '添加了杭州');
                  },
                  child: Text('添加杭州'),
                ),
              ),
              8.0.boxW,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      statusMap.add(5, '已归档');
                    });
                    _showResult('状态添加', '添加了状态5');
                  },
                  child: Text('添加状态5'),
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
