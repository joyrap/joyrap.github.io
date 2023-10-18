---
title: 学习HTML-HTML语义
date: 2023-10-11
layout: post
categories: ["Web Development","Programming"]
tags: ["html"]
draft: true
---

凭借 100 多个 HTML 元素以及创建自定义元素的能力，您可以通过多种方式来标记您的内容；但有些方法——尤其是语义上的——比其他方法更好。

语义意味着“与意义相关”。编写语义 HTML 意味着使用 HTML 元素根据每个元素的含义（而不是其外观）来构建内容。

本系列尚未涵盖许多 HTML 元素，但即使不了解 HTML，以下两个代码片段也展示了语义标记如何提供内容上下文。两者都使用字数统计而不是 ipsum lorem 来节省一些滚动时间 - 发挥你的想象力将“三十个字”扩展为 30 个字：

第一个代码片段使用 `<div>` 和 `<span>` ，这两个元素没有语义值。

```
<div>
  <span>Three words</span>
  <div>
    <a>one word</a>
    <a>one word</a>
    <a>one word</a>
    <a>one word</a>
  </div>
</div>
<div>
  <div>
    <div>five words</div>
  </div>
  <div>
    <div>three words</div>
    <div>forty-six words</div>
    <div>forty-four words</div>
  </div>
  <div>
    <div>seven words</h2>
    <div>sixty-eight words</div>
    <div>forty-four words</div>
  </div>
</div>
<div>
   <span>five words</span>
</div>
```
你知道这些词意味着什么吗？也许并不完全知道。

让我们用语义元素重写这段代码：

```
<header>
  <h1>Three words</h1>
  <nav>
    <a>one word</a>
    <a>one word</a>
    <a>one word</a>
    <a>one word</a>
  </nav>
</header>
<main>
  <header>
    <h1>five words</h1>
  </header>
  <section>
    <h2>three words</h2>
    <p>forty-six words</p>
    <p>forty-four words</p>
  </section>
  <section>
    <h2>seven words</h2>
    <p>sixty-eight words</p>
    <p>forty-four words</p>
  </section>
</main>
<footer>
  <p>five words</p>
</footer>
```

哪个代码块传达了含义？仅使用 `<div>`和 `<span>` 的非语义元素，您确实无法分辨第一个代码块中的内容代表什么。第二个代码示例包含语义元素，为非编码人员提供了足够的上下文来破译其目的和含义，而无需遇到 HTML 标记。它确实为开发人员提供了足够的上下文来理解页面的轮廓，即使他们不理解内容，例如外语内容。

在第二个代码块中，即使不理解内容，我们也可以理解架构，因为语义元素提供了含义和结构。您可以看出第一个标头是网站的横幅， `<h1>` 可能是网站名称。页脚是网站页脚：这五个词可能是版权声明或商业地址。

语义标记不仅仅是让开发人员更容易阅读标记；它主要是为了让自动化工具更容易解读标记。开发人员工具演示了语义元素如何提供机器可读的结构。

### 无障碍对象模型(AOM)

当浏览器解析接收到的内容时，它会构建文档对象模型 (DOM) 和 CSS 对象模型 (CSSOM)。然后它还构建了一个可访问性树。辅助设备（例如屏幕阅读器）使用 AOM 来解析和解释内容。 DOM 是文档中所有节点的树。 AOM 就像 DOM 的语义版本。

查看 Chrome 开发人员工具，您会注意到使用语义元素与不使用语义元素时的可访问性对象模型之间存在显着差异。

很明显，语义元素的使用有助于可访问性，而使用非语义元素会降低可访问性。默认情况下，HTML 通常是可访问的。作为开发人员，我们的工作是保护 HTML 的默认可访问性并确保我们最大限度地提高可访问性。您可以在开发者工具中检查 AOM。

#### role 属性

role 属性描述元素在文档上下文中的角色。 role 属性是一个全局属性，这意味着它对所有元素都有效，由 ARIA 规范而不是 WHATWG HTML 规范定义，本系列中的几乎所有其他内容都是在 WHATWG HTML 规范中定义的。

每个语义元素都有一个隐含的角色，有些取决于上下文。正如我们在 Firefox 辅助功能开发工具屏幕截图中看到的，顶层 `<header>` 、 `<main>` 、 `<footer>` 和 `<nav>` 都是地标，而嵌套在 `<main>` 中的 `<header>` 是一个段。 Chrome 屏幕截图列出了这些元素的 ARIA 角色： `<main>`是 main 、 `<nav>` 是 navigation 和 `<footer>` ，因为它是文档的页脚，是 contentinfo 。当 `<header>`是文档的标题时，默认角色是 banner ，它将该部分定义为全局站点标题。当 `<header>` 或 `<footer>` 嵌套在分段元素内时，它不是标志性角色。两个开发工具的屏幕截图都显示了这一点。

元素角色名称对于构建 AOM 非常重要。元素或“角色”的语义对于辅助技术非常重要，在某些情况下对于搜索引擎也很重要。辅助技术用户依靠语义来浏览和理解内容的含义。该元素的角色使用户能够快速访问他们寻找的内容，并且可能更重要的是，该角色会通知屏幕阅读器用户在交互元素获得焦点后如何与其进行交互。

交互元素，例如按钮、链接、范围和复选框，都具有隐式角色，都会自动添加到键盘选项卡序列中，并且都具有默认的预期用户操作支持。隐式角色或显式角色值通知用户期望特定于元素的默认用户交互。

使用 role 属性，您可以为任何元素赋予角色，包括与标记所暗示的角色不同的角色。例如， `<button>` 具有 button 的隐式角色。使用 role="button" ，您可以将任何元素在语义上转换为按钮： `<p role="button">Click Me</p>`

虽然将 role="button" 添加到元素会通知屏幕阅读器该元素是一个按钮，但它不会更改元素的外观或功能。 button 元素提供了如此多的功能，而您无需做任何工作。 button 元素会自动添加到文档的选项卡排序序列中，这意味着默认情况下它可以通过键盘获得焦点。 Enter 和 Space 键均可激活该按钮。按钮还具有 HTMLButtonElement 接口提供的所有方法和属性。如果您的按钮不使用语义按钮，则必须重新编程所有这些功能，使用 `<button>` 会容易得多。

返回非语义代码块的 AOM 屏幕截图。您会注意到非语义元素没有隐式角色。我们可以通过为每个元素分配一个角色来使非语义版本语义化：

```
<div role="banner">
  <span role="heading" aria-level="1">Three words</span>
  <div role="navigation">
    <a>one word</a>
    <a>one word</a>
    <a>one word</a>
    <a>one word</a>
  </div>
</div>
```
虽然 role 属性可用于向任何元素添加语义，但您应该使用具有所需隐式角色的元素，不要滥用。

### 语义元素

问问自己，“哪个元素最能代表这部分标记的功能？”通常会导致您选择最适合该工作的元素。您选择的元素以及您使用的标签应该适合您正在显示的内容，因为标签具有语义含义。

HTML 应该用于构建内容，而不是定义内容的外观。外观是CSS的领域。虽然某些元素被定义为以某种方式显示，但不要根据用户代理样式表使该元素默认显示的方式来使用该元素。相反，根据元素的语义和功能来选择每个元素。以逻辑、语义和有意义的方式编码 HTML 有助于确保 CSS 按预期应用。

在编码时选择正确的元素意味着您无需重构或注释 HTML。如果您考虑使用正确的元素，您通常会选择正确的元素。当您理解每个元素的语义并了解为什么选择正确的元素很重要时，您通常不需要太多额外的努力就能做出正确的选择。

### 原文

- [HTML语义](https://web.dev/learn/html/semantic-html?hl=en)
- [Accessibility Object Model](https://wicg.github.io/aom/spec/)
- [Playing with the Accessibility Object Model](https://tink.uk/playing-with-the-accessibility-object-model-aom/)
- [HTML spec](https://html.spec.whatwg.org/dev/)
- [什么是ARIA](https://en.wikipedia.org/wiki/WAI-ARIA)
- [MWD ARIA](https://developer.mozilla.org/zh-CN/docs/Web/Accessibility/ARIA)
