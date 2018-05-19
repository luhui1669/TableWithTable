# TableWithTable

这个小玩意主要实现了左右两个tableView联动的功能，现在有两种样式：1、直接刷新；2、点击后滚动。未来还会不断更新，丰富功能^.^。
This Demo's main function : there are two tableViews on the left and right,they have relation.

##2016/6/19 完成Demo3.右侧联动View为collectionView。有三种模式：
####1.默认模式，collectionView的item为两列;
####2.简单设置模式：只需要设置colOfItem参数即可，实现自定义item的列数;
####3.详细设置模式：实现自定义itemSize、minimumLineSpacing、minimumInteritemSpacing、edgeInsets参数，实现各类个性化需求。
######同时，支持通过xib自定义cell。现有默认item形式为“上图片＋下标题”。
######Demo1，Demo2支持的传入数据接口Demo3同样拥有，同时增加传入图片名数组的接口，为item添加所需图片。





2016/6/9 完成Demo2.实现点击左侧，右侧滑动更新；滑动右侧，左侧同步刷新的样式。对左右两个tableView的数据传入接口和设置frame接口进行了封装。

2016/6/8 完成了Demo1.他是点击左侧，右侧tableView直接刷新对应数据的形式。对左右两个tableView的数据传入接口和设置frame接口进行了封装。








    //leftDataArray为正常数组即可
	vc.leftDataArray = self.Demo1LeftDataArray;
	//rightDataArray是元素为数组的数组
	vc.rightDataArray = self.Demo1RightDataArray;
    
    //可对左右两个tableView的frame进行设置，默认值为：leftView宽度为屏幕的1/3，rightView宽度为屏幕的2/3（Demo2分别为1/4和3/4），高度都为全屏
    //vc.leftFrame = CGRectMake(0, 0, 100, 300);
    //vc.rightFrame = CGRectMake(120, 0, 100, 250);

=========

