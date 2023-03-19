# 小米商城app

一款用Flutter编写的小米商城app

>项目不断更新中，部分功能使用的在线接口api，部分使用的本地存储

##Show
###iOS

###Android


##Done
### 版本更新记录

#### v1.0.0：2023-03-19
*  首页
*  分类
*  服务
*  购物车
*  我的
*  商品列表页
*  搜索
*  商品详情页
*  商品首页展示->查看详情->添加到购物车->在购物车修改等主线完成，后续功能牵涉后台，待定

### 目录结构

>项目基于`Get-Cli`脚手架搭建，是整个项目的核心框架，涉及项目搭建，路由，状态管理，组件使用等功能

|   一级目录  |  二级目录   |   文件名  |   描述    |
---|:--:|:--:|:---:|
|  assets     |               |    |  素材目录 | 
|  assets     |  images   |    |  图片素材库 | 
|               |    fonts    |    |   字体库(包含阿里巴巴图标字体素材)| 
|   app       |               |    |  app目录 | 
|               |   components   |   |  抽取全局通用组件目录 | 
|                |    models         |    |  模型类目录 | 
|                |    modules        |                      | 页面组件目录 | 
|                |           |   tabs                    | tabs管理页 | 
|                |           |   login                  | 登录 | 
|                |           |   home                  | 首页 | 
|                |           |   category              |  分类| 
|                |           |   service                | 服务 | 
|                |           |   cart                    | 购物车 | 
|                |           |   me                     | 我的 | 
|                |           |   goodsList           | 商品列表 | 
|                |           |   goodsContent     | 商品详情 | 
|                |           |   search               | 搜索 | 
|                |           |   setting               |  设置| 
|                |           |   customerService  | 客服 | 
|                |           |   officialService     | 官方服务 | 
|               |       routes        |                                         |  路由配置目录   | 
|               |       services      |                                        | 服务及工具类目录 | 
|               |                        |  app_cartService.dart          | 购物车功能服务类，基于app_sharedPreferences.dart的封装 | 
|               |                        |  app_colors .dart                | 项目常用颜色管理类 | 
|               |                        |  app_fontIcons.dart             | 基于阿里巴巴图标字体素材功能类 | 
|               |                        |  app_keepAliveWrapper.dart  | 页面保活类 | 
|               |                        |  app_network.dart                  | 网络类，基于dio的封装 | 
|               |                        |  app_screenAdapter.dart        | 项目适配类，基于flutter_screenutil的封装 | 
|               |                        |  app_searchService.dart         | 搜索功能服务类，基于app_sharedPreferences.dart的封装 | 
|               |                        |  app_sharedPreferences.dart  | 基于shared_preferences的封装 | 
| main.dart  |        |   |  项目入口文件 | 



### 使用插件
```
  dio: ^5.0.2
  get: ^4.6.5
  flutter_screenutil: ^5.7.0
  shared_preferences: ^2.0.18
  flutter_swiper_view: ^1.1.8
  flutter_staggered_grid_view: ^0.6.2
  flutter_html: ^3.0.0-alpha.5
  pull_to_refresh: ^2.0.0
  roundcheckbox: ^2.0.5
```

##ToDo

- [x] 商品列表过滤功能要更新
- [x] 商品详情页html内容在android手机上有空白间隔
- [x] 购物车删除功能
- [x] 我的对应的子功能
- [x] 其他功能






