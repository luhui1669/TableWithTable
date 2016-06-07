# TableWithTable

这个小玩意主要实现了左右两个tableView联动的功能，现在有两种样式：1、直接刷新；2、点击后滚动。未来还会不断更新，丰富功能^.^。
This Demo's main function : there are two tableViews on the left and right,they have relation.

2016/6/8 完成了Demo1.他是点击左侧，右侧tableView直接刷新对应数据的形式。对左右两个tableView的数据传入接口和设置frame接口进行了封装。
  '''
    //leftDataArray为正常数组即可
    vc.leftDataArray = self.Demo1LeftDataArray;
    //rightDataArray是元素为数组的数组
    vc.rightDataArray = self.Demo1RightDataArray;
    
    //可对左右两个tableView的frame进行设置，默认值为：leftView宽度为屏幕的1/3，rightView宽度为屏幕的2/3，高度都为全屏
    //vc.leftFrame = CGRectMake(0, 0, 100, 300);
    //vc.rightFrame = CGRectMake(120, 0, 100, 250);
  '''

这不是任务，不是作业，这是梦想。
=========

