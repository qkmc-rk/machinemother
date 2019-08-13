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

### 6月17日阮
- 完成支付的回调接口
- 帮助客户完成小程序的认证和微信支付认证
- 支付接口与回调接口没有测试，需要进一步测试
- 5秒才进行重复回调，我的业务处理时间应该比这快吧，要是5秒都完不成，那就很惨了

### 6月18日阮
- 微信支付 企业付款到零钱 出现了一些问题，有硬性条件，待后期寻找更优方案
- 新增表 mm_withdraw，提现记录表，但提现功能暂时遇到问题，只实现了Entity和Repository
- FIX BUG 权限验证 匿名 用equals而不是 ==
- order的Entity中需要addrId，收货地址啊，我晕了...怎么会把这个忘记了啊

### 6月20日
- 加个内容你能看到吗？？？？
### 6月21日
- 完成订单下单

### 6月22日
- 增加所有controller跨域支持
### 6月23日
- 测试jenkins webhook
- 测试jenkins webhook2
- 测试jenkins webhook3
- 测试jenkins webhook

### 6月24日
- 对所有除创建时间和修改时间的时间字段加上注解@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
- 对所有需要添加@RequestBody的地方添加@requestBody

### 6月26日
- weixin.notify_url=https://www.ruankun.xyz/machinemother/order/prepay/notify
- 修改register接口，invitorid修改为requestParam
- FIX 后台token错误时返回没有验证就会出现http 500错误
- FIX userInfoController所有接口异常，并去除用户相关操作的敏感信息

### 7月 6日
- 修复下订单时多个item只有一个item算了价格的问题
- 修复修改订单接口传入参数不是@requestBody的...emmm...问题？？？
    > 第二次修复
- 修复 更改后算钱的数字不一致
- 修复 地址删除后订单出错，这里采用了字段删除法，就是字段删除法is visible

### 7月7日
- 修改order成了你喜欢的样子，喜欢吗？

### 7月10日
- 修改删除订单出错的问题
- 修复删除产品时的错误
- 修复管理员无法获取comment的错误

### 7月11日
- 修复 /home/recommend
- 修复 /home/adv 数据库原因
- 将POST /home/banner/{id} 修复
- 重新修复comment的错误

### 7月18日
- 修复单次使用积分最多只能使用100积分
- 修改订单secret的长度为大写字母加数字，12位

### 7月19日
- 增加接口，FinancialController  分享成功的回调

### 7月20日
- 优化数据库
- 修复使用积分出错的问题

### 7月23日
- 增加绑定手机号接口
- 找到查询产品慢的原因

### 7月27日
- 增加post方式上传图片

### 7月28日
- 修改qrcode通过https获取
- 修改qrcode template通过https获取
### 7月29日
- 新增decoupon和cdkey的定时扫描任务
- 修改由cdkey兑换的优惠券的默认有效期及时间范围
- 新增获取order时的过期检测动作及order支付限时操作，规定时间内(30minutes)未付款则自动取消order

### 8月3日
- 在商品详情中增加销量

### 8月4日
- 过滤黑名单用户

### 8月5日
- 增加黑名单用户无法登陆功能
- 将备份数据库的shell脚本放在了script目录下（由于项目构建脚本与项目本身无关，因此不纳入项目范围，构建脚本详情请参照jenkins）
- 付款成功系统自动通知管理员，需配置管理员订单通知邮箱

### 8月7日
- 增加手动备份数据库接口
- 改回备份脚本位置/Users/ruan/mysqldump.sh
### 8月8日
- fix管理员获取的order中没有items信息
- 订单邮件通知中增加用户信息
- 被删除订单不在返回给管理员，只在数据库

### 8月11日
- 将orderSecret改为10位数字
- 下订单时添加订单备注（非必须字段）
- 修改小程序二维码获取的策略

### 8月12日
- order detail添加 tip

### 8月13日
- 添加下订单短信通知管理员和用户