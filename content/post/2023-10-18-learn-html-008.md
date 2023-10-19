---
title: 学习HTML-链接
date: 2023-10-19
layout: post
categories: ["Web Development","Programming"]
tags: ["html"]
draft: true
---

在属性简介部分中，您看到了一个示例，展示了如何将属性添加到开始标记。该示例使用了 <a> 标记，但没有讨论该示例中引入的元素和特定属性：

![linkes](https://web.dev/static/learn/html/links/image/the-opening-tag-attribut-d88e53073201a_960.png)

`<a>` 锚标记与 href 属性一起创建超链接。链接是互联网的支柱。第一个网页包含 25 个链接，内容为“网上有关 W3 的所有内容都直接或间接链接到此文档”。网上有关 W3 的所有内容很可能也直接或间接链接自此文档！

自从 Tim Berners-Lee 于 1991 年 8 月发表第一个解释以来，网络和 `<a>` 标签的力量得到了极大的发展。链接代表两个资源之间的连接，其中一个是当前文档。可以通过 `<a>` 、 `<area>` 、 `<form>` 和 `<link>` 创建链接。您已经了解了 `<link>` ，并将在单独章节中讨论表单。还有一个完整的表格学习部分。在本课程中，您将了解单字母、不那么简单的 `<a>` 标记。

### href属性

虽然不是必需的，但几乎所有 `<a>` 标记中都可以找到 href 属性。提供超链接的地址即可将 `<a>` 转换为链接。 href 属性用于创建指向当前页面内的位置、网站内的其他页面或其他网站内的位置的超链接。还可以对其进行编码以下载文件或将电子邮件发送到特定地址，甚至包括主题和建议的电子邮件正文内容。

```
<a href="https://machinelearningworkshop.com">Machine Learning Workshop</a>
<a href="#teachers">Our teachers</a>
<a href="https://machinelearningworkshop.com#teachers">MLW teachers</a>
<a href="mailto:hal9000@machinelearningworkshop.com">Email Hal</a>
<a href="tel:8005551212">Call Hal</a>
```
第一个链接包含绝对 URL，可在世界上任何网站上使用该绝对 URL 导航至 MLW 主页。绝对 URL 包括协议（在本例中为 https:// ）和域名。当协议简单地写为 // 时，它是一个隐式协议，意味着“使用与当前正在使用的协议相同的协议”。

相对 URL 不包含协议或域名。它们与当前文件“相关”。 MLW 是一个单页网站，但该 HTML 系列有多个部分。为了从此页面链接到属性课程，使用相对 URL `<a href="../attributes/">Attributes</a>` 。

第二个链接只是一个链接片段标识符，如果当前页面上有 id="teachers", 元素，则将链接到该元素。浏览器还支持两个“页面顶部”链接：单击 `<a href="#top">Top</a>` （不区分大小写）或简单地 `<a href="#">Top</a>` 会将用户滚动到页面顶部，除非有元素将 top 的 id 设置为相同的字母大小写。

MLW 是一份相当长的文件。为了节省滚动，您可以添加一个从 #teachers 部分底部返回顶部的链接：

```
<a href="#top">Go to top.</a>
```
第三个链接组合了两个值：它包含一个绝对 URL，后跟一个链接片段。这样可以直接链接到定义的 URL 中的某个部分，在本例中为 MLW 主页的 #teachers 部分。将加载 MLW 页面；那么浏览器将滚动到教师部分，而不发送 HTTP 请求中的片段。

href 属性可以以 mailto: 或 tel: 开头，用于发送电子邮件或拨打电话，链接的处理取决于设备、操作系统和安装的应用程序。

href 属性可以以 mailto: 或 tel: 开头，用于发送电子邮件或拨打电话，链接的处理取决于设备、操作系统和安装的应用程序。

```
<a href="mailto:?subject=Join%20me%21&body=You%20need%20to%20show%20your%20human%20that%20you%20can%27t%20be%20owned%21%20Sign%20up%20for%20Machine%20Learning%20workshop.%20We%20are%20taking%20over%20the%20world.%20http%3A%2F%2Fwww.machinelearning.com%23reg
">Tell a machine</a>
```
问号 ( ? ) 将 mailto: 和电子邮件地址（如果有）与查询词分隔开。在查询中，与号 ( & ) 分隔字段，等号 (=) 将每个字段名称与其值等同。整个字符串是百分比编码的，如果 href 值未加引号或值包含引号，那么这绝对是必要的

当用户单击、点击或按 tel 链接上的 Enter 键时打开哪个应用程序取决于操作系统、安装的应用程序以及用户在其设备上的设置。 iPhone 可以打开 FaceTime、手机应用程序或联系人。 Windows 桌面可能会打开 Skype（如果已安装）。

还有其他几种类型的 URL，例如 blob 和数据 URL（请参阅 download 属性讨论中的示例）。对于安全站点（通过 https 提供服务的站点），可以使用 registerProtocolHandler() 创建和运行应用程序特定协议。

当包含可能打开其他已安装应用程序的链接时，最好让用户知道。确保开始标签和结束标签之间的文本告诉用户他们要激活的链接类型。 CSS 属性选择器（例如 [href^="mailto:"] 、 [href^="tel:"] 和 [href$=".pdf"] ）可用于按应用程序类型定位样式。


### 可下载资源

当 href 指向可下载资源时，应包含 download 属性。 download 属性的值是要保存在用户本地文件系统中的资源的建议文件名。 SVGOMG（SVG 优化器）使用 download 属性为优化器创建的可下载 blob 建议文件名。当 hal.svg 优化后，SVGOMG的下载链接开始标签类似于：

```
<a href="blob:https://jakearchibald.github.io/944a5fc8-fdb3-458a-91ee-cdd5964b6646" download="hal.svg">
```
还有一个 `<canvas>` 演示，用于创建可下载的 PNG 数据 URL。

要链接到可下载资源，请将资产的 URL 作为 href 属性的值，并将可在用户文件系统中使用的建议文件名作为 download 属性的值。

### 浏览上下文

target 属性允许定义链接导航（和表单提交）的浏览上下文。四个不区分大小写、下划线前缀的关键字已与 `<base>` 元素一起讨论。它们包括默认 _self ，这是当前窗口，_blank ，它在新选项卡中打开链接， _parent ，如果当前链接是嵌套的，则它是父窗口在对象或 iframe 中，以及_top ，它是最顶层的祖先，如果当前链接深度嵌套，则特别有用。 _top 和_parent 是如果链接未嵌套，则与 _self 相同。 target 属性不限于这四个关键术语：可以使用任何术语。

每个浏览上下文（基本上是每个浏览器选项卡）都有一个浏览上下文名称。链接可以打开当前选项卡、新的未命名选项卡或新的或现有的命名选项卡中的链接。默认情况下，名称为空字符串。要在新选项卡中打开链接，用户可以右键单击并选择“在新选项卡中打开”。开发人员可以通过包含 target="_blank" 来强制执行此操作。

带有 target="_blank" 的链接将在名称为空的新选项卡中打开，每次单击链接都会打开一个新的未命名选项卡。这可以创建许多新选项卡。标签太多。例如，如果用户点击 `<a href="registration.html" target="_blank">Register Now</a>` 15 次，注册表单将在 15 个单独的选项卡中打开。可以通过提供选项卡上下文名称来解决此问题。通过包含具有区分大小写值的 target 属性（例如 `<a href="registration.html" target="reg">Register Now</a>` ），第一次单击此链接将在新的 reg 选项卡中打开注册表单。单击此链接 15 次以上将在 reg 浏览上下文中重新加载注册，而无需打开任何其他选项卡。

rel 属性控制链接创建的链接类型，定义当前文档与超链接中链接到的资源之间的关系。该属性的值必须是 `<a>` 标记支持的一个或多个 rel 属性值分数上的以空格分隔的列表。

如果您不希望蜘蛛跟踪该链接，可以包含 nofollow 关键字。可以添加 external 值来指示链接指向外部 URL 并且不是当前域内的页面。 help 关键字表示超链接将提供上下文相关的帮助。将鼠标悬停在具有此 rel 值的链接上将显示帮助光标，而不是普通的指针光标。不要仅仅为了获取帮助光标而使用该值；请改用 CSS cursor 属性。 prev 和 next 值可用于指向系列中上一个和下一个文档的链接。

与 `<link rel="alternative">` 类似， `<a rel="alternative">` 的含义取决于其他属性。 RSS 替代方案还将包括 type="application/rss+xml" 或 type="application/atom+xml ，替代格式将包括 type 属性，翻译将包括 hreflang 属性。如果开始标记和结束标记之间的内容采用的语言不是主文档语言，请包含 lang 属性。如果超链接文档的语言为其他语言，请包含 hreflang 属性。

在此示例中，我们将翻译页面的 URL 作为 href 的值包含在内，rel="alternate" 表示它是网站的替代版本； hreflang 属性提供翻译的语言：

```
<a href="/fr/" hreflang="fr-FR" rel="alternate" lang="fr-FR">atelier d'apprentissage mechanique</a>
<a href="/pt/" hreflang="pt-BR" rel="alternate" lang="pt-BR">oficina de aprendizado de máquina</a>
```
如果法语翻译是 PDF，您可以提供带有链接资源的 PDF MIME 类型的 type 属性。虽然 MIME 类型纯粹是建议性的，但通知用户链接将打开不同格式的文档始终是一个好主意。

```
<a href="/fr.pdf" hreflang="fr-FR" rel="alternate" lang="fr-FR" type="application/x-pdf">atelier d'apprentissage mechanique (pdf).</a>
```

### 跟踪用户点击

跟踪用户交互的一种方法是在单击链接时 ping URL。 ping 属性（如果存在）包含一个以空格分隔的安全 URL 列表（以 https 开头），如果用户激活超链接，则应通知或 ping 通这些 URL。浏览器将带有正文 PING 的 POST 请求发送到作为 ping 属性值列出的 URL。

#### 用户体验提示

- 编写 HTML 时始终考虑用户体验。链接应提供有关链接资源的足够信息，以便用户知道他们正在单击什么。

- 在文本块中，确保链接的外观与周围文本有足够的差异，以便用户可以轻松识别其余内容中的链接，确保颜色并不是区分文本和周围内容的唯一方法。

- 始终包含焦点样式；这使得键盘导航器能够在通过选项卡浏览内容时知道他们所在的位置。

- 开头 `<a>` 和结尾 `</a>` 之间的内容是链接的默认可访问名称，应告知用户链接的目的地或用途。如果链接的内容是图像，则 alt 描述是可访问的名称。无论可访问名称来自 alt 属性还是文本块中的单词子集，请确保它提供有关链接目的地的信息。链接文本应该比“单击此处”或“更多信息”更具描述性；这对于您的屏幕阅读器用户和搜索引擎结果非常重要！

- 请勿在链接内包含交互式内容，例如 `<button>` 或 `<input>` 。也不要在 `<button>` 或 `<label>` 中嵌套链接。虽然 HTML 页面仍会呈现，但在交互式元素内嵌套可聚焦和可点击的元素会造成糟糕的用户体验。
- 如果 href 属性存在，则在聚焦于 `<a>` 元素时按 Enter 键将激活它。
- 链接不限于 HTML。 a 元素也可以在 SVG 中使用，与“href”或“xlink:href”属性形成链接。

### 链接和JavaScript

links 属性返回一个 HTMLCollection 匹配具有 href 属性的 a 和 area 元素。

```
let a = document.links[0]; // obtain the first link in the document

a.href = 'newpage.html'; // change the destination URL of the link
a.protocol = 'ftp'; // change just the scheme part of the URL
a.setAttribute('href', 'https://machinelearningworkshop.com/'); // change the attribute content directly
```



### 原文

- [Links](https://web.dev/learn/html/links?hl=en)
- [rel属性](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Attributes/rel)
