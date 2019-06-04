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
