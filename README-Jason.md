# 6.21
- 将item entity中的orderid修改为ordernumber，因为发现仅修改三处就改了，更好理解。econ*.java 中是相关的内容感觉还是从repository中直接调用比较好，有些
- service封装了之后可能不纯粹。

### order相关流程
1. 判断是否有使用积分或者优惠券，(两者取其一)
2. 将所有没有orderNumber的该用户的item取出计算总金额，并设置生成的orderNumber,在向props取值时若不存在props对象，则抛出异常
3. 若优惠额度小于0，则置位0，在order 表插入后执行orderSecret表的插入，最后保存item数据；
4. 以上任意出现异常，则进行事务回滚操作；

# 7.28
- 开放admin获取订单order数据
- user/all接口仅使用page参数
