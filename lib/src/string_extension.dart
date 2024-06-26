import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:convert/convert.dart' as convert;
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/foundation.dart';
import 'package:flutter_extension/src/ad_extension.dart';

/*
* 字符串常规操作
* */
extension StringOption on String? {
  /*
  * 是否为null
  * */
  bool get isNull => this == null;

  /*
  * 是否为null或者空
  * */
  bool get isEmptyOrNull {
    if (isNull) return true;
    if (this!.isEmpty) return true;
    return false;
  }

  /*
  * 是否不为null或者空
  * */
  bool get isNotEmptyOrNull => !isEmptyOrNull;

  /*
  * 拆分枚举
  * */
  String get enumRowValue {
    if (isEmptyOrNull) return "";
    var array = this!.split(".");
    if (array.length == 2) {
      return array[1];
    }
    return "";
  }

  /*
  * 加千分号
  * */
  String? get thousands {
    if (isEmptyOrNull) return "";
    List<String> numSub = this!.split(".");
    try {
      int upValue = int.parse(numSub.first);
      String value = upValue.thousands;
      for (var i = 1; i < numSub.length; ++i) {
        var bean = numSub[i];
        if (i == 1) {
          value += ".";
        }
        value += bean;
      }
      return value;
    } catch (e) {
      Future.error(e);
    }
    return this;
  }

  /*
  *  添加字符串到末尾位置network_state_listener.dart
  * */
  String addEnd(String sub) {
    if (isEmptyOrNull) return sub.isEmptyOrNull ? "" : sub;
    return this! + sub;
  }

  /*
  * 添加字符串到起始位置
  * */
  String addStart(String sub) {
    if (isEmptyOrNull) return sub.isEmptyOrNull ? "" : sub;
    return sub + this!;
  }

  /*
  * 删除一个范围的字符串
  * - Parameter start: 起始位置
  * - Parameter end: 结束位置，默认是到字符串的末尾位置
  * */
  String? deleteRange(int start, {int? end}) {
    if (isEmptyOrNull) return "";
    if (this!.length <= start) return this;
    end ??= this!.length - 1;
    if (this!.length <= end) return this;
    return this!.replaceRange(start, end, "");
  }

  /*
  * 删除子字符串
  * - Parameter sub: 子字符串
  * - Parameter isAll: 是否删除查找到的所有子字符串
  * */
  String? deleteSub(String sub, {bool isAll = false}) {
    if (isEmptyOrNull) return "";
    if (sub.isEmptyOrNull) return this;
    if (isAll) {
      return this!.replaceAll(sub, "");
    }
    return this!.replaceFirst(sub, "");
  }

  /*
  * 替换子字符串
  * - Parameter from: 需要替换的子字符串
  * - Parameter replace: 替换的子字符串
  * - Parameter isAll: 是否替换查找到的所有子字符串
  * */
  String? replaceSub(String from, String replace, {bool isAll = false}) {
    if (from.isEmptyOrNull) return this;
    if (replace.isEmptyOrNull) return this;
    if (isAll) return this!.replaceAll(from, replace);
    return this!.replaceFirst(from, replace);
  }

  /*
  * 子字符串是否存在
  * */
  bool isContains(String sub) {
    if (isEmptyOrNull) return false;
    if (sub.isEmptyOrNull) return false;
    return this!.contains(sub);
  }

  /*
  * 是否以子字符串开头
  * */
  bool isStart(String sub) {
    if (isEmptyOrNull) return false;
    if (sub.isEmptyOrNull) return false;
    return this!.startsWith(sub);
  }

  /*
  * 是否以子字符串结尾
  * */
  bool isEnd(String sub) {
    if (isEmptyOrNull) return false;
    if (sub.isEmptyOrNull) return false;
    return this!.endsWith(sub);
  }

  /*
  * 获取一个范围的子字符串
  * - Parameter start: 起始位置
  * - Parameter end: 截止位置 默认是到字符串的末尾位置
  * */
  String sub(int start, {int? end}) {
    if (isEmptyOrNull) return "";
    end ??= this!.length - 1;
    return this!.substring(start, end);
  }

  /*
  * 删除前后空格
  * */
  String trim(String content) {
    if (isEmptyOrNull) return "";
    return content.trim();
  }

  /*
  * 随机获取一个字符串
  * - Parameter count: 位数
  * */
  String random({int count = 6}) {
    String alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String left = '';
    for (var i = 0; i < count; i++) {
      left = left + alphabet[Random().nextInt(alphabet.length - 1)];
    }
    return left;
  }

  /*
  * 字符串转换为枚举类型
  * - Parameter values: 枚举值
  * */
  T? toEnum<T>(List<T> values) {
    return values.firstWhereOrNull(
      (element) => element.toString().toLowerCase() == '$this'.toLowerCase(),
    );
  }
}

/*
* 字符串加密
* */
extension StringEncryption on String {
  String md5() {
    if (isEmptyOrNull) return "";
    var bytes = const Utf8Encoder().convert(this);
    var value = crypto.md5.convert(bytes);
    return convert.hex.encode(value.bytes);
  }

  String base64() {
    if (isEmptyOrNull) return "";
    var bytes = const Utf8Encoder().convert(this);
    return base64Encode(bytes);
  }

  String sha1() {
    if (isEmptyOrNull) return "";
    var data = const Utf8Encoder().convert(this);
    var digest = crypto.sha1.convert(data);
    return convert.hex.encode(digest.bytes);
  }

  String rsa() {
    return "";
  }

  String aes() {
    return "";
  }

  String des() {
    return "";
  }
}

extension DebugTest on String {
  void log() {
    if (kDebugMode) {
      print("${DateTime.now().string(format: "HH:mm:ss")}: $this");
    }
  }
}
