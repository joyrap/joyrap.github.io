---
title: Mixin in Java
date: 2024-01-08
layout: post
categories: ["Programming"]
tags: ["Java"]
draft: false
---

## 什么是Mix-in

维基百科的解释是：

> In object-oriented programming languages, a mixin is a class that contains methods for use by other classes without having to be the parent class of those other classes. How those other classes gain access to the mixin's methods depends on the language. Mixins are sometimes described as being "included" rather than "inherited".

简而言之就是：通过组合而不是继承的方式获得其他类所提供的功能。

## Java中是如何做到的

面向对象编程语言可以通过继承来达到功能复用目的，但继承也会有不少陷阱，或者说有时候他们并不满足设计上的需求。

例如我们想让类具备另外多个已经存在于其他类中的功能，那么通过继承就无法实现，因为Java不允许多重继承。而且子类会全部继承父类的开放功能，也不是我们期望的，在[Effective Java](https://www.amazon.com/Effective-Java-Joshua-Bloch/dp/0134685997)中也推荐优先选择复合而不是继承。

从关系类型上来说，我们也不希望为了获得某个功能，让类之间成为[*IS-A*](https://en.wikipedia.org/wiki/Is-a)的关系。

这时候我们自然想到的就是接口，接口作为开放的协议约定，所有类都可以实现接口，同时类可以实现多个接口。为了让类可以实现接口同时又能获得默认实现，Java在接口中设计了`default`默认实现方法，这样子类可以在不需要自己实现的情况下获得接口中默认提供的功能（这里的`default`方法还解决了新增接口方法导致实现类变更的问题）。

例如下面这种情况：
``` java

class A{
 ...
}

interface B{
   ...
   default void show(){};
   ...
}

class C extend A implements B{
    ...
}
```

我们可以说C继承了A，同时具备了B功能，这就是Mixin的场景。

不过这里有个例外的情况：

``` java

interface A{
 ...
 default void show(){};
 ...
}

interface B{
  ...
 default void show(){};
  ...
}

class C  implements A,B{
    ...
    void show(){};//必须重写void show();
}
```

这里的C必须自己实现show()方法，因为接口A和B的show()方法重复，逻辑上无法区分。

## 参考

- [Mixin](https://en.wikipedia.org/wiki/Mixin)
- [an-example-of-a-mixin-in-java](https://stackoverflow.com/questions/17987704/an-example-of-a-mixin-in-java)
