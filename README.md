# GeekBand-I150013
## iOS 家务共享 APP开发
## IOS客户端目录结构。
	
	├─HousewareShare_IOS
	│   ├── Vendor：用到的一些第三方类库(手动导入的)
	│   ├── Managers：管理器类
	│   ├── Controllers：控制器，对应app中的各个页面
	│   │   ├── Login：登录相关页面
	│   │   └── XXX：其它相关页面
	│   ├── Views：视图类
	│   │   └── xxx：其他相关视图
	│   ├── Models：数据类
	│   ├── Images.xcasssets：app中用到的所有的图片都在这里
	│   └── Util：一些常用控件和Category
	└── Pods：CocoaPods管理第三方库自动生成的项目
	
	
## 代码规范
- 前缀采用:GBHS 即:GeekBand HousewareShare

## 第三方库采用CocoaPods进行管理。(持续添加)
- 'AFNetworking'
- 'Mantle'
- 'SDWebImage'
- 'MBProgressHUD'
- 'FMDB'
- 'TTTAttributedLabel'
- 'TMCache'