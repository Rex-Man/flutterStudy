//https://www.cnblogs.com/joe235/p/11711653.html
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
///const TextField({
///    Key key,
///    this.controller,                    // 控制正在编辑文本
///    this.focusNode,                     // 获取键盘焦点
///    this.decoration = const InputDecoration(),              // 边框装饰
///    TextInputType keyboardType,         // 键盘类型
///    this.textInputAction,               // 键盘的操作按钮类型
///    this.textCapitalization = TextCapitalization.none,      // 配置大小写键盘
///    this.style,                         // 输入文本样式
///    this.textAlign = TextAlign.start,   // 对齐方式
///    this.textDirection,                 // 文本方向
///    this.autofocus = false,             // 是否自动对焦
///    this.obscureText = false,           // 是否隐藏内容，例如密码格式
///    this.autocorrect = true,            // 是否自动校正
///    this.maxLines = 1,                  // 最大行数
///    this.maxLength,                     // 允许输入的最大长度
///    this.maxLengthEnforced = true,      // 是否允许超过输入最大长度
///    this.onChanged,                     // 文本内容变更时回调
///    this.onEditingComplete,             // 提交内容时回调
///    this.onSubmitted,                   // 用户提示完成时回调
///    this.inputFormatters,               // 验证及格式
///    this.enabled,                       // 是否不可点击
///    this.cursorWidth = 2.0,             // 光标宽度
///    this.cursorRadius,                  // 光标圆角弧度
///    this.cursorColor,                   // 光标颜色
///    this.keyboardAppearance,            // 键盘亮度
///    this.scrollPadding = const EdgeInsets.all(20.0),        // 滚动到视图中时，填充边距
///    this.enableInteractiveSelection,    // 长按是否展示【剪切/复制/粘贴菜单LengthLimitingTextInputFormatter】
///    this.onTap,                         // 点击时回调
///})
///InputDecoration({
///    this.icon,    //位于装饰器外部和输入框前面的图片
///    this.labelText,  //用于描述输入框，例如这个输入框是用来输入用户名还是密码的，当输入框获取焦点时默认会浮动到上方，
///    this.labelStyle,  // 控制labelText的样式,接收一个TextStyle类型的值
///    this.helperText, //辅助文本，位于输入框下方，如果errorText不为空的话，则helperText不会显示
///    this.helperStyle, //helperText的样式
///    this.hintText,  //提示文本，位于输入框内部
///    this.hintStyle, //hintText的样式
///    this.hintMaxLines, //提示信息最大行数
///    this.errorText,  //错误信息提示
///    this.errorStyle, //errorText的样式
///    this.errorMaxLines,   //errorText最大行数
///    this.hasFloatingPlaceholder = true,  //labelText是否浮动，默认为true，修改为false则labelText在输入框获取焦点时不会浮动且不显示
///    this.isDense,   //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
///    this.contentPadding, //内间距
///    this.prefixIcon,  //位于输入框内部起始位置的图标。
///    this.prefix,   //预先填充的Widget,跟prefixText同时只能出现一个
///    this.prefixText,  //预填充的文本，例如手机号前面预先加上区号等
///    this.prefixStyle,  //prefixText的样式
///    this.suffixIcon, //位于输入框后面的图片,例如一般输入框后面会有个眼睛，控制输入内容是否明文
///    this.suffix,  //位于输入框尾部的控件，同样的不能和suffixText同时使用
///    this.suffixText,//位于尾部的填充文字
///    this.suffixStyle,  //suffixText的样式
///    this.counter,//位于输入框右下方的小控件，不能和counterText同时使用
///    this.counterText,//位于右下方显示的文本，常用于显示输入的字符数量
///    this.counterStyle, //counterText的样式
///    this.filled,  //如果为true，则输入使用fillColor指定的颜色填充
///    this.fillColor,  //相当于输入框的背景颜色
///    this.errorBorder,   //errorText不为空，输入框没有焦点时要显示的边框
///    this.focusedBorder,  //输入框有焦点时的边框,如果errorText不为空的话，该属性无效
///    this.focusedErrorBorder,  //errorText不为空时，输入框有焦点时的边框
///    this.disabledBorder,  //输入框禁用时显示的边框，如果errorText不为空的话，该属性无效
///    this.enabledBorder,  //输入框可用时显示的边框，如果errorText不为空的话，该属性无效
///    this.border, //正常情况下的border
///    this.enabled = true,  //输入框是否可用
///    this.semanticCounterText,
///    this.alignLabelWithHint,
///  })

class FormControllerStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormControllerStudyState();
}

class _FormControllerStudyState extends State<FormControllerStudy> {
  //FocusNode
  FocusNode _focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusNodeListener);
  }

  Future<Null> _focusNodeListener() async {
    if (_focusNode.hasFocus) {
      print('获取焦点');
    } else {
      print('失去焦点');
    }
  }
  //FocusNode
  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,                         // 当 TextField 获取焦点弹出输入框时，输入框可能会将页面中元素顶上去，为避免此情况，可将 Scaffold 中 resizeToAvoidBottomPadding: false 即可 ,就是输入键盘出现时，会遮挡住输入表单，表单不会因为键盘的出现而上移动。
        appBar: AppBar(title: Text('表单学习')),
        body: SingleChildScrollView(                               // 因为不加这个会出现Flutter bottom overflowed 一场
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              TextField(),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: '请输入信息',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: '请输入信息', border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true, // 设置密码框
                decoration: InputDecoration(
                                            border: OutlineInputBorder()
                                           ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                                            icon: Icon(Icons.attachment),
                                            prefixIcon: Icon(Icons.people),
                                            suffixIcon: Icon(Icons.person),
                                            labelText: "姓名",
                                            border: OutlineInputBorder(),
                                            errorText:"Error !!"
                                           ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: '圆角边',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
                )
              ),
              SizedBox(height: 20),
              TextField(
                cursorColor: Colors.purple.withOpacity(0.4),  //光标颜色
                cursorWidth: 10.0,                            //光标宽度
                cursorRadius: Radius.circular(4.0),           //光标圆角
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(                         //文字的样式
                   color :Colors.purple,
                   fontSize:18.0
                ),
                textAlign: TextAlign.center,              //textAlign 为文字起始位置，
                textDirection: TextDirection.rtl,         //textDirection 文字内容方向。
                decoration: InputDecoration(
                    hintText: 'Direction Align style'
                ),
              ),
              SizedBox(height: 20),
              TextField(
                maxLength: 10,                           //右下角会标注最大长度和已经输入多长
                maxLengthEnforced: true,                 // 为true 达到最大字符长度后不可编辑，为false 可继续编辑

                decoration: InputDecoration(
                    hintText: 'maxlength'
                ),               
              ),
              SizedBox(height: 20),
              /**
                * TextCapitalization.words：输入的每个单词的首字母大写（用空格隔开的单词）
                *  TextCapitalization.characters：输入的内容全部都大写
                *  TextCapitalization.sentences：输入的内容首字母大写
                *  TextCapitalization.none：默认情况，什么都不设置
              */
              TextField(
                maxLines: null,                          //最大行数 当为null自动换行，展示多行。 为指定行的时候
                maxLength:TextField.noMaxLength,         //意思是只在右下角展现输入字符数
                enableInteractiveSelection: false,       //长按是否出现 剪切，复制， 粘贴 菜单。 false 不会出现
                textCapitalization: TextCapitalization.sentences, // 首字母是否大写。
                decoration: InputDecoration(
                    hintText: 'maxLines'
                ),               
              ),
              SizedBox(height: 20),
              /**
               * a. 数字键盘
               *           --1-- datetime 键盘上可随时访问 : 和 /；
               *           --2-- phone 键盘上可随时访问 # 和 *；
               *           --3-- number 键盘上可随时访问 + - * /
               */
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'keyboardType number'
                ),  
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    hintText: 'keyboardType datetime'
                ),  
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'keyboardType phone'
                ),  
              ),
              SizedBox(height: 20),
              /**
               * b. 字母键盘
               *    --1-- emailAddress 键盘上可随时访问 @ 和 .；      
               *    --2-- url 键盘上可随时访问 / 和 .；
               *    --3-- multiline 适用于多行文本换行；
               *    --4-- text 默认字母键盘；
               */
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'keyboardType emailAddress '
                ),  
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                    hintText: 'keyboardType url '
                ),  
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'keyboardType multiline '
                ),  
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'keyboardType text '
                ),  
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    hintText: 'keyboardType visiblePassword '
                ),  
              ),
              SizedBox(height: 20),
              /**
               * TextInputAction.done：完成按钮
               * TextInputAction.go：根据用户输入进行下一步按钮
               * TextInputAction.newline：换行按钮
               * TextInputAction.next：下一步按钮
               * TextInputAction.previous：上一步按钮
               * TextInputAction.search：搜索按钮
               * TextInputAction.send：发送按钮
               */
              TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    hintText: 'TextInputAction search '
                ),  
              ),
              SizedBox(height: 20),
              TextField(
                autofocus:true,                            //autofocus 是否自动获取焦点，进入页面优先获取焦点，并弹出键盘，若页面中有多个 TextField 设置 autofocus 为 true 则优先获取第一个焦点
                decoration: InputDecoration(
                    hintText: 'autofocus'
                ),  
              ),
              SizedBox(height: 20),
              TextField(
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: 'focusNode'
                ),
              ),
              SizedBox(height: 20),
              TextField(
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(12),                      //限制最长字符
                  WhitelistingTextInputFormatter.digitsOnly,                 //仅允许输入白名单中字符；如 digitsOnly 仅支持数字 [0-9]；
                  BlacklistingTextInputFormatter.singleLineFormatter         //防止输入黑名单中字符；如 singleLineFormatter 强制输入单行；分析源码 RegExp("[/\]") 可以设置正则表达式；
                ],
                decoration: InputDecoration(
                    hintText: 'inputFormatters'
                ),
              ),
              SizedBox(height: 20),
              TextField(
                    controller: _textEditingController,
                    onChanged: (String content) {
                        Fluttertoast.showToast(
                              msg: "On change function $content",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                        );   //onChanged 文本内容变更时回调，可实时监听 TextField 输入内容；
                    },
                     onEditingComplete: () {                           //这个也只是当输入完成后在小键盘里面点击完成才会调用的方法。
                        Fluttertoast.showToast(                        ///在提交内容时回调，通常是点击回车按键时回调； 不可与 onSubmit  同时使用，区别在于 onSubmit 是带返回值的回调
                              msg: "onEditingComplete",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                        );   //onChanged 文本内容变
                      },
                    onTap: () {
                        Fluttertoast.showToast(
                              msg: "On Tap Function",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                        );
                    },
                    decoration: InputDecoration(
                        hintText: 'controller onTap onChanged'
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      print(_textEditingController.text);
                      _textEditingController.clear();
                    },
                    child: Text('清除'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                  onSubmitted:(message){                           //这个也是点击完成后执行的操作，唯一的区别是点击小键盘的完成后会返回输入的值。
                        Fluttertoast.showToast(
                              msg: "on submit $message",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.lightBlue,
                              textColor: Colors.white,
                              fontSize: 16.0
                        );
                  },
                  decoration: InputDecoration(
                    hintText: 'on submit'
                ),
              ),
            ]),
          ),
        ));
  }
}
