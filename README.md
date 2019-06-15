# 机器妈

> 机器妈小程序后台服务，9大服务模块，牛p

### 6月7日阮
- 初步完成API设计，参照doc文件夹，且微信支付与体现还未设计通透
- 数据库增加comment和reply表的设计

### 6月8日阮
- 调整分享二维码api，后台提供二维码和模板，小程序canvas合成。


### 6月10日阮
- 增加一个注解“小坏蛋”,这个注解没有任何意义,就为了好玩
- 完成了HomeController的内容,意味着主页相关里面特有的接口已经写完了
- 发现一种新的代码重构方式：类里相同代码抽象成共有方法，类间抽象为类
- 革命刚刚开始,同志不要停止下来.

### 6月11日阮
- 完成评论回复的内容一大半,包含repo entity service controller
- 很多新写的代码没有测试，等这一部分完成，每一个模块都需要测试一下 
- 修改使用HttpServletRequest获取header的地方使用@RequstHeader
- 修改个别细节


### 6月12日阮
- 删除数据库表comment中的多余字段user_id  item_id
- 完成comment reply的api
- 完成API的说明书写

### 6月13日阮
- 完成所有entity的书写
- 完成所有repository的书写
- 测试完成：数据库与entity对应的默认字段

### 6月14日阮
- 稍微完善产品API的文档
- 调整了一下reply entity的内容
- 在responseEntity中引入timestamp
> 小BUG：Authentication(pass=false)不传入token会抛出异常
- 明日将金融服务的提现和支付两个想办法搞定

### 6月15日阮
- 交作业交作业交作业，重要的事情说三遍
- 修改order表：增加四个字段，判断是否使用优惠券，积分等
- 修改item表，把字段producttypeid改为productpropsid
- 新增WePayUtil，小程序支付需要使用的工具类
- 新增WxResponsCode文件，好像没啥大作用
- 修改配置文件，增加小程序支付所需要的配置信息
- 增加微信小程序支付接口接入，但回调还没有实现
- 更新sql文件 main/resources/sql/