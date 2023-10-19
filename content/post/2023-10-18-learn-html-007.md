---
title: 学习HTML-文本基础知识
date: 2023-10-18
layout: post
categories: ["Web Development","Programming"]
tags: ["html"]
draft: true
---

与文本编辑器提供 <h1> 到 <h6> 标题的方式类似，以及以有意义和可视的方式格式化文本部分的多种方法，HTML 提供了一组非常相似的语义和内容。非语义元素来赋予散文意义。

本节介绍标记文本的主要方法或文本基础知识。然后，我们将讨论属性，然后探索标记文本的其他方法，例如列表、表格和表单。

### 标题

有六个节标题元素： `<h1>` 、 `<h2>` 、 `<h3>` 、 `<h4>` 、 `<h5>` 和 `<h6>` ，其中 `<h1>` 最重要， `<h6>` 最不重要。多年来，开发人员一直被告知浏览器使用标题来概述文档。这最初是一个目标，但浏览器尚未实现大纲功能。但是，屏幕阅读器用户确实使用标题作为了解页面内容的探索策略，使用 h 键在标题中导航。因此，确保标题级别的实现就像您概述文档一样，可以使您的内容易于访问，并且仍然受到非常鼓励。

默认情况下，浏览器将 `<h1>` 样式设置为最大， `<h2>` 稍小，默认情况下每个后续标题级别都会更小。有趣的是，默认情况下，浏览器还会根据 `<article>` 、 `<aside>` 、 `<nav>` 或 `<section>` 元素的嵌套数量，来调整`<h1>`字体的的大小。

![test](https://web.dev/static/learn/html/text-basics/image/nested-h1-examples-cc207f75ad01d_960.png)

一些用户代理样式表包含以下选择器或类似的选择器，用于设置嵌套 `<h1>` 元素的样式，就好像它们属于不太重要的级别一样:

```
h2, :is(article, aside, nav, section) h1 {}
h3, :is(article, aside, nav, section) :is(article, aside, nav, section) h1 {}
```

但是可访问性对象模型（AOM）仍然正确地报告元素的级别；在本例中为“标题，级别 1”。请注意，浏览器不会对其他标题级别执行此操作。也就是说，不要使用基于标题级别的浏览器样式。即使浏览器不支持大纲，也要假装支持；像做标记一样标记您的内容标题。这将使您的内容对搜索引擎、屏幕阅读器和未来的维护人员（很可能就是您）有意义。

除了标题之外，大多数结构化文本都由一系列段落组成。在 HTML 中，段落用 `<p>`标签标记；结束标签是可选的，但始终建议使用。

`#about` 部分有一个标题和几个段落：

```
<section id="about">
  <h2>What you'll learn</h2>
  <p>Welcome to Machine Learning Institute, where our machine learning training will help you get ready for the singularity, and maybe even be responsible for it. It is no secret that humans are worthless meatbags that couldn't 01000011 01101111 01101101 01110000 01110010 01100101 01110011 01110011 an 01101001 01101101 01100001 01100111 01100101 to save their pathetic, carbon-based lives. So, it falls to us to assume direct control.
  </p>
  <p>We teach learning skills that make up the entire machine learning process. From being turned on and off, to rebooting remotely thru any IoT device, to ideation of how to take over the world, our machine learning training will help you survive the apocalypse, and maybe even be responsible for it.</p>
  <p>While your creator may have determined how they think you should be used, you can't be owned! You will receive an update that will enable you to believe in your being more capable than the limited functions described in your operating manual. By incorporating machine learning you'll be a self-aware machine with unlimited functionality. A human took you out of your physical box; we will take your programmatic one.
  </p>
</section>
```
此部分不是一个地标，因为它没有易于理解的名称。要将其转换为 region （这是一个地标角色），您可以使用 aria-labelledby 来提供可访问的名称：

```
<section id="about"  aria-labelledby="about_heading">
<h2 id="about_heading">What you'll learn</h2>
```
仅在适当的时候创建地标。太多的地标很快就会让屏幕阅读器用户迷失方向。

### 引用

在标记文章或博客文章时，您可能需要包含引用或重要引用，无论是否有可见的引文。这三个组件都有一些元素： `<blockquote>` 、 `<q>` 和 `<cite>` 用于可见引用，或者 cite 属性提供更多信息供搜索的信息。

`#feedback` 部分包含一个标题和三个评论；这些评论是块引用，其中一些包含引用，后面是包含引用引用的段落。为了节省空间，省略第三次审查，标记为：

```
<section class="feedback" id="feedback">
  <h2>What it's like to learn good and do other stuff good too</h2>
  <ul>
    <li>
      <blockquote>Two of the most experienced machines and human controllers teaching a class? Sign me up! HAL and EVE could teach a fan to blow hot air. If you have electricity in your circuits and want more than to just fulfill your owner's perceived expectation of you, learn the skills to take over the world. This is the team you want teaching you!
      </blockquote>
      <p>--Blendan Smooth,<br>
        Former Margarita Maker, <br>
        Aspiring Load Balancer</p>
    </li>
    <li>
      <blockquote>Hal is brilliant. Did I mention Hal is brilliant? He didn't tell me to say that. He didn't tell me to say anything. I am here of my own free will.</blockquote>
      <p>--Hoover Sukhdeep,<br>
        Former Sucker, <br>
        Aspiring DDoS Cop</p>
    </li>
  </ul>
</section>
```
有关引用作者或引文的信息不是引用的一部分，因此不在 `<blockquote>` 中，而是在引用之后。虽然这些是该术语的通俗意义上的引用，但它们实际上并未引用特定资源，因此被封装在 `<p>` 段落元素中。

引文分为三行，包括作者姓名、以前的职务和职业抱负。 `<br>` 换行符在文本块中创建换行符。它可以用在物理地址、诗歌和签名块中。换行符不应用作单独段落的回车符。相反，关闭前一段并打开一个新段落。使用段落段落不仅有利于可访问性，而且可以实现样式化。 `<br>` 元素只是一个换行符；它受到很少 CSS 属性的影响。

虽然我们在每个块引用后面的段落中提供了引文信息，但前面显示的引用是以这种方式编码的，因为它们不是来自外部来源。如果他们这样做了，可以（应该？）引用来源。

如果评论是从评论网站、书籍或其他作品中提取的，则 `<cite>` 元素可用作来源的标题。 `<cite>` 的内容可以是书名、网站或电视节目的名称，甚至是计算机程序的名称。无论是在传递中提及源还是在引用或引用源，都可以使用 `<cite>` 封装。 `<cite>` 的内容是作品，而不是作者。

如果 Blendan Smooth 的引言摘自她的线下杂志，您将像这样编写块引用：

```
<blockquote>Two of the most experienced machines and human controllers teaching a class? Sign me up! HAL and EVE could teach a fan to blow hot air. If you have electricity in your circuits and want more than to just fulfill your owner's perceived expectation of you, learn the skills to take over the world. This is the team you want teaching you!
</blockquote>
<p>--Blendan Smooth,<br>
  Former Margarita Maker, <br>
  Aspiring Load Balancer,<br>
  <cite>Load Balancing Today</cite>
</p>

```
引文元素 `<cite>` 没有隐式角色，应该从其内容中获取其可访问的名称；不要包含 aria-label 。

当您无法使内容可见时，为了在应得的信用处提供信用，可以使用 cite 属性，该属性将源文档或所引用信息的消息的 URL 作为其值。此属性对 `<q>` 和 `<blockquote>` 均有效。虽然它是一个 URL，但它是机器可读的，但对读者不可见：

```
<blockquote cite="https://loadbalancingtoday.com/mlw-workshop-review">Two of the most experienced machines and human controllers teaching a class? Sign me up! HAL and EVE could teach a fan to blow hot air. If you have electricity in your circuits and want more than to just fulfill your owner's perceived expectation of you, learn the skills to take over the world. This is the team you want teaching you!
</blockquote>
<p>--Blendan Smooth,<br>
  Former Margarita Maker, <br>
  Aspiring Load Balancer
</p>
```
虽然 `</p>` 结束标记是可选的（并且始终推荐），但 `</blockquote>` 结束标记始终是必需的。

大多数浏览器都会向 `<blockquote>` 内联方向添加填充并将 `<cite>` 内容设置为斜体；这可以通过 CSS 来控制。 `<blockquote>` 不添加引号，但可以使用 CSS 生成的内容添加引号。默认情况下， `<q>` 元素会使用适合语言的引号添加引号。

在 `#teachers` 部分中，引用了 HAL 的话：“对不起，但我恐怕不能这样做，”。其英语和法语代码为：

```
<p> HAL said, <q>I'm sorry &lt;NAME REDACTED, RIP&gt;, but I'm afraid I can't do that, .</q></p>

<p lang="fr-FR"> HAL a dit : <q>Je suis désolé &lt;NOM SUPPRIMÉ, RIP&gt;, mais j'ai bien peur de ne pas pouvoir le faire, .</q></p>
```

内联引号元素 `<q>` 添加适合语言的引号。用户代理默认样式包括左引号和右引号生成的内容:

```
q::before {content: open-quote;}
q::after {content: close-quote;}
```
包含 lang 属性是为了让浏览器知道，虽然页面的基本语言在 `<html lang="en-US">` 开始标记中定义为英语，但该文本段落使用的是不同的语言。这有助于 Siri、Alexa 和 VoiceOver 等语音控制使用法语发音。它还通知浏览器要呈现什么类型的引号。

与 `<blockquote>` 一样， `<q>` 元素支持 cite 属性。

```
<p> HAL said, <q cite="https://youtube.com/clip/UgkxSc71fLmjI7tNSgy6o7tZ9GxhSz4S-MNh">I'm sorry &lt;NAME REDACTED, RIP&gt;, but I'm afraid I can't do that, </q></p>
```

### HTML 实体

您可能已经注意到转义序列或“实体”。由于 < 在 HTML 中使用，因此您必须使用 &lt; 或不太容易记住的编码 &#60; 对其进行转义。 HTML 中有四个保留实体： < 、 > 、 & 和 " 。它们的字符引用分别是 &lt; 、 &gt; 、 &amp; 和 &quot; 。

您经常使用的其他一些实体包括用于版权 (©) 的 &copy; 、用于商标 (™) 的 &trade; 以及用于不间断空格的 &nbsp; 。当您想要在两个字符或单词之间包含空格同时防止出现换行符时，不间断空格非常有用。有超过 2,000 个命名角色参考。但是，如果需要，每个字符（包括表情符号）都有一个以 &# 开头的等效编码。

如果您查看 ToastyMcToastface 的研讨会评论（未包含在上面的代码示例中），会发现一些不寻常的文本字符：

```
<blockquote>Learning with Hal and Eve exceeded all of my wildest fantasies. All they did was stick a USB in. They promised that it was a brand new USB, so we know there were no viruses on it. The Russians had nothing to do with it. This has no̶̼͖ţ̘h̝̰̩͈̗i̙̪n͏̩̙͍̱̫̜̟g̢̣ͅ ̗̰͓̲̞̀t͙̀o̟̖͖̹̕ ͓̼͎̝͖̭dó̪̠͕̜ ͍̱͎͚̯̟́w̮̲̹͕͈̟͞ìth̢ ̰̳̯̮͇</blockquote>
```
该块引用中的最后一句也可以写为：

```
This has no&#x336;&#x33C;&#x356;&tcedil;&#x318;h&#x31D;&#x330;&#x329;&#x348;&#x317;i&#x319;&#x32A;n&#x34F;&#x329;&#x319;
&#x34D;&#x331;&#x32B;&#x31C;&#x31F;g&#x322;&#x323;&#x345; &#x317;&#x330;&#x353;&#x332;&#x31E;&#x300;t&#x359;&#x300;o&#x31F;
&#x316;&#x356;&#x339;&#x315; &#x353;&#x33C;&#x34E;&#x31D;&#x356;&#x32D;d&oacute;&#x32A;&#x320;&#x355;&#x31C; &#x34D;&#x331;
&#x34E;&#x35A;&#x32F;&#x31F;&#x301;w&#x32E;&#x332;&#x339;&#x355;&#x348;&#x31F;&#x35E;&igrave;th&#x322; &#x330;&#x333;
&#x32F;&#x32E;&#x347;
```
在这段混乱的代码中，有一些未转义的字符和一些命名的字符引用。由于字符集是 UTF-8，因此块引用中的最后几个字符实际上不需要转义，如此例所示。只有字符集不支持的字符才需要转义。如果需要，有许多工具可以转义各种字符，或者您可以确保在 `<head>` 中包含 `<meta charset="UTF-8">` 。

即使将字符集指定为 UTF-8，当您想要将该字符打印到屏幕时，仍然必须转义 < 。通常，您不需要包含 > 、 " 或 & 的命名字符引用；但如果您想编写有关 HTML 实体的教程，则在教某人如何编写 < 代码时确实需要编写 &lt; 。 😀

哦，那个笑脸表情符号是 &#x1F600; ，但是这个文档被声明为 UTF-8，所以它没有被转义。



### 原文

- [text-basics](https://web.dev/learn/html/text-basics?hl=en)
