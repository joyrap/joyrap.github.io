---
layout: post
title:  "Java multidimensional arrays"
date:   2017-01-15 20:24:47
categories: java
---

Java 多维数组
-------------------------------------

http://docs.oracle.com/javase/specs/jls/se7/html/jls-10.html

## 一切看起来挺不错的

说多维数组之前，说说简单的数组定义:

{% highlight java %}
int[] a;
{% endhighlight %}

或则

{% highlight java %}
int a[];
{% endhighlight %}

当然也可以一次性定义多个变量

{% highlight java %}
int a[], b[],c[];
{% endhighlight %}

再简单不过了。

继续看看下面的呢

{% highlight java %}
int[][] a[][][];
{% endhighlight %}

这是个几维数组?
恕我愚钝，尽管搞了这没多年java，还是第一次遇到这样的定义。
其实这是一个5维数组，因为[Java language specification](http://docs.oracle.com/javase/specs/jls/se7/html/jls-10.html) 有明确的定义.

```
type arrayName[][[]...];
```
或

```
type[][[]...] arrayName;
```
