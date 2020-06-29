import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TextField(
                maxLines: null,                          //最大行数 当为null自动换行，展示多行。 为指定行的时候
                maxLength:TextField.noMaxLength,         //意思是只在右下角展现输入字符数
                enableInteractiveSelection: false,       //长按是否出现 剪切，复制， 粘贴 菜单。 false 不会出现
                textCapitalization: TextCapitalization.sentences, // 首字母是否大写。
                decoration: InputDecoration(
                    hintText: 'maxLines'
                ),               
              ),

            ]),
          ),
        ));
  }
}
