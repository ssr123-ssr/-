# Assembly-Language
本次作业主要考验多模块和宏调用的实现，因此我改造了一下第三次作业，用多模块和宏调用再次实现了第三次作业。
我分成了main.asm主模板和disp.asm、getinfo.asm两个子模版。其中getinfo实现了对month、day、year的赋值，
disp实现了将month、day、year中存放的16进制数据以10进制打印出来。同时，在main.asm中实现了一个关于输出的
宏调用，可以使输出语句变得更为简单。
遇到的问题：
    1.在构建子模块的时候，我有尝试将输入语句放到子模版中，但每次都报错ATTEMPT TO ACCESS DATA OUTSIDE SEGMENT BOUNDS的link错误。
    于是就没再次尝试，便把该语句放到了主模板中，作为子程序存在。
    2.我尝试在macro中增加平loop循环语句，但无法实现循环功能，准确来说只有第一次的循环功能可以实现，后来的都不行。
运行截图：
![image](https://user-images.githubusercontent.com/83651172/200764233-f488869a-f905-44a1-9dec-a80f9428efb9.png)
