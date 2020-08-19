import 'package:dio/dio.dart';

/// 所以的test文件都要以_test.dart结尾。这样在执行flutter test 命令的时候才能够被扫描到
///http://www.cndartlang.com/874.html
///https://pub.dev/packages/test#tagging-tests

//@Skip('currently failing (see issue 1234)-----------------')  // 将skip标签 放在这里当运行 flutter run发现这个文件有这个标签会跳过这个文件的测试
@TestOn("mac-os") // 这个设置的意思是下面这些test是要在MAC的系统下才能运行
//上面的标签一定要在import 之前，否则无效
import 'package:test/test.dart';
import 'PinCode.dart';

void main() {
  //setUpAll 方法是这个UT 在跑其它所有的test之前 初始化用的，只执行一次
  setUpAll(() async {
    print("Set Up All");
  });
  //setup 是每执行一个test 都会调用这个方法
  setUp(() async {
    print("setUp");
  });
  tearDownAll(() async {});
  tearDown(() async {});

  test("String.split() splits the string on the delimiter", () {
    
    print("test1");
    var string = "foo,bar,baz";
    expect(string.split(","), equals(["foo", "bar", "baz"]));
  }, skip: "Not Use for this----");
  // 关于tags 标签的使用，需要在test文件夹下面创建dart_test.yaml文件其中的标签的名称需要与test 文件中的tags 要mapping的
  // flutter test -t "dd" 在命令行中指定运行tag 为dd的test ，并应用yaml中的配置
  test("---------String.trim() removes surrounding whitespace", () {
    setUpAll(() async {
       print("Function Set Up All");
    });
    setUp(() async{
      print("test Function set up");
    });
    print("test2");
    var string = "  foo ";
    expect(string.trim(), equals("foo"));
  }, tags: "dd");

  test(".split() splits the string on the delimiter allof", () {
    
    print("test3");
    expect("foo,bar,baz",
        allOf([contains("foo"), isNot(startsWith("bar")), endsWith("baz")]));
    // all of 是必须要全都通过了才ok
  });

  test(".split() splits the string on the delimiter anyof", () {
    print("test4");
    expect("foo,bar,baz",
        anyOf([contains("foo1"), isNot(startsWith("bar")), endsWith("bar")]));
    // any 这种只要有一个是成功的就算通过了
  });
  test('.parse() fails on invalid input', () {
    print("test5");
    //expect(() => int.parse('X'), throwsFormatException);
    expect(() => int.parse('X'), throwsNoSuchMethodError);
    //这个是判断是否match 异常，如果match的话就通过，如果不match 就跑出异常。
  });
  test('.parse() fails on invalid input oh no', () {
    print("test6");
    expect(() => int.parse('X'), throwsA(equals('oh no')));
    //这种是会跑出异常。
  });

  group('int', () {
    setUpAll(() async {
       print("group Set Up All");
    });
    setUp(() async{
      print("group set up");
    });
    test('.remainder() returns the remainder of division', () {
      print("test7");
      expect(11.remainder(3), equals(2));
    }, tags: "tagsTest");

    test('.toRadixString() returns a hex string', () {
      print("test8");
      expect(11.toRadixString(16), equals('b'));
    });
  });
  //这里是设置这个test case 只有在chrome 的环境下才能运行
  test(".TestOn 测试", () {
    print("test9");
    expect("foo,bar,baz",
        anyOf([contains("foo1"), isNot(startsWith("bar")), endsWith("bar")]));
  }, testOn: "chrome");
  //下面这个的意思就是说当onplantform 满足下面的一个条件的话就按照下面的规则去运行
  test(".TestOn 测试", () {
    print("test10");
    expect("foo,bar,baz",
        anyOf([contains("foo1"), isNot(startsWith("bar")), endsWith("bar")]));
  }, onPlatform: {
    'mac-os': Timeout.factor(2),
    'browser': [
      Skip('TODO: add browser support'),
      // This will be slow on browsers once it works on them.
      Timeout.factor(2)
    ]
  });
  test(".异步测试", () async {
    print("test11");

    Response response = await Dio().get(
        "https://iris.lines.coscoshipping.com/mobile/restlink/sales/direct/getPinCode/Y1dsMWJHbz0=");
    PinCode newsBean = PinCode.fromJson(response.data);
    expect("Y1dsMWJHbz0=", newsBean.data.domainId);
  },timeout:Timeout.parse("10s"));

  test("new Future.value() returns the value", () {
    print("test12");

    expect(
        Dio().get(
            "https://iris.lines.coscoshipping.com/mobile/restlink/sales/direct/getPinCode/Y1dsMWJHbz0="),
        completion(Dio().get(
            "https://iris.lines.coscoshipping.com/mobile/restlink/sales/direct/getPinCode/Y1dsMWJHbz0=")));
  },timeout:Timeout.parse("10s"));
  ///expectAsync()可以封装其他的函数，并且回调函数最多允许6个参数，并且不支持命名可选参数。expectAsync()主要有2个作用：
  ///一是断言封装的函数执行确定的次数，如果执行的次数小于count，会一直等待，如果执行的次数小于count，则测试为fail。
  ///二是断言封装的函数执行的最大次数，如果超过上限，则测试为fail。如果max为0（默认值），则执行的次数为count；如果max为-1，则执行的次数允许大于count。 
  test("expectAsync study" ,(){
    print("test13");
    // var list = [1,2,3];
    // list.map((number) => expectAsync1((number) {
    //         print("expectAsync1 test run");
    //         expect(number, equals('b'));
    // }, count: 3,reason:"show reason"));
    var stream = new Stream.fromIterable([1, 2, 3]);

    stream.listen(expectAsync1((number) {
      print("expectAsync1 less");
      expect(number, inInclusiveRange(1, 3));
    }, count: 3));
  }); 

}
