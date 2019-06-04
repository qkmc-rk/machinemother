# machinemother
机器妈

## 数据库设计规范
- 数据库名称与app名一致
- 表名有其具体含义，前缀mm_表示machinemother
- 每张表以及每个字段都有comment
- 所有id字段为bigint 无符号数 自增
- 每个varchar字段都有固定长度，非默认255，提高检索效率
- 小数和数字使用decimal表示，float与double存在潜在的精度损失问题
- 表之间不采用强制外键关联
- 字段用英文单词表示，太长的地方有缩写，可以参考注释理解
- 每个表应包含三个必有字段：id  gmt_create创建时间(default CURRENT_TIMESTAMP)  gmt_modified修改时间(default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
- 布尔字段为is_xxx，使用tinyint unsigned，只取1或者0
- 所有数字字段均为unsigned，不取负数
- 数据库名、表名、字段名一律采用小写字母，不得采用大写，windows和linux下存在着不同的大小写敏感问题(现在的mysql版本还不太清楚)

<<<<<<< HEAD
## 6月4日记录
- 完成小城登录功能
- 完成小程序注册功能,注册包含登录,注册成功则返回token，同时表示登录了
- util中添加md5加密工具，加密密钥在application.properties中设置
- 常量util/Constant下添加了登录注册相关的常量
- 添加AddrRepository
=======
## 增加了swagger/swagger-ui配置
>>>>>>> 496b6d7b4081488b95e6058ea61608e01cba84d4
