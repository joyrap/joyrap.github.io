---
layout: post
title:  "应用场景如何正确利用redis原子操作"
date:   2017-06-18 23:24:47
categories: redis
---

在很多应用场景中会使用到redis的原子加减操作：

{% highlight shell %} 
INCR KEY
DECR KEY
{% endhighlight %}

### 应用场景

举例一个应用场景，电商中的商品库存，当优惠下单成功时候，库存
数量减1，直到库存数量扣减到0，表示商品无货，但如果用户取消了订单
则需要将商品库存数量加1。

如果通过redis的原子加减来控制库存数量，则上面的业务的正常流程为：

- 1.SET STOCK 100
- 2.DECR STOCK 
- 3.INCR STOCK

第一步,初始化商品库存为100，第二步用户购买一个商品则DECR STOCK,
当DECR 返回值小于等于0时，则表示无库存。

那么真实的情况是，当第二步多个客户端（大于100）并发调用DECR STOCK,STOCK的值可能
是小于-1的任何一个负数，如果这时候用户取消订单，INCR STOCK已无法正确回退库存。

### 解决方案

- 1.SET STOCK (Long.MAX_VALUE - 100)
- 2.INCR STOCK 
- 3.DECR STOCK

第一步,初始化商品库存为Long的最大值减去100，第二步用户购买一个商品，则INCR STOCK
当INCR超过Long最大值，redis会抛出ERR increment or decrement would overflow, ** 最重要的是不修改缓存中现有的值 ** ，提示用户无库存
，这时候就算有退库存（DECR STOCK）也不会影响STOCK的数据正确性。

### 问题挖掘

但该方案还是存在缺陷，就是取消订单回退库存，因为库存回退操作没有唯一凭证，不具备幂等性。

针对跨进程业务回退问题，更好的方案是生成库存数量对应的令牌，用户购买商品，就是领取一个令牌，当令牌领完时，表示无货，
取消订单，回退令牌。

