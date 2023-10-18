---
title: 学习HTML-属性
date: 2023-10-13
layout: post
categories: ["Web Development","Programming"]
tags: ["html"]
draft: true
---

属性使 HTML 如此强大。属性是出现在开始标记中的以空格分隔的名称和名称/值对，提供有关元素的信息和功能。

![learn](https://web.dev/static/learn/html/attributes/image/the-opening-tag-attribut-d49075bfc3ce2_960.png)

属性定义元素的行为、链接和功能。有些属性是全局的，这意味着它们可以出现在任何元素的开始标记中。其他属性适用于多个元素，但不是全部，而其他属性是特定于元素的，仅与单个元素相关。在 HTML 中，除了布尔属性和某种程度上的枚举属性之外，所有属性都需要一个值。

如果属性值包含空格或特殊字符，则必须用引号将该值引起来。因此，为了提高易读性，始终建议使用引号。

虽然 HTML 不区分大小写，但某些属性值却区分大小写。 HTML 规范中的值不区分大小写。定义的字符串值（例如类和 ID 名称）区分大小写。如果属性值在 HTML 中区分大小写，则在 CSS 和 JavaScript 中用作属性选择器的一部分时也区分大小写；否则，就不是。


### 布尔属性

如果存在布尔属性，则它始终为 true。布尔属性包括 autofocus 、 inert 、 checked 、 disabled 、 required 、 reversed 、 allowfullscreen 、 default, 、 loop 、 autoplay 、 controls 、 muted 、 readonly 、 multiple, 和 selected 。如果存在这些属性中的一个（或多个），则该元素被禁用、必需、只读等。如果不存在，则该元素不存在。

布尔值可以省略，设置为空字符串，或者是属性的名称；但该值不必实际设置为字符串 true 。所有值（包括 true 、 false 和 😀 ）虽然无效，但都将解析为 true。

这三个标签是等效的：

```
<input required>
<input required="">
<input required="required">
```

如果属性值为 false，则省略该属性。如果该属性为 true，则包含该属性但不提供值。例如， required="required" 不是 HTML 中的有效值；但由于 required 是布尔值，无效值解析为 true。但由于无效的枚举属性不一定会解析为与缺失值相同的值，因此养成省略值的习惯比记住哪些属性是布尔值与枚举属性并可能提供无效值更容易。

在 true 和 false 之间切换时，请使用 JavaScript 完全添加和删除属性，而不是切换值。

```
const myMedia = document.getElementById("mediaFile");
myMedia.removeAttribute("muted");
myMedia.setAttribute("muted");
```
请注意，在 XML 语言（如 SVG）中，所有属性都需要包含一个值，包括布尔属性。

枚举属性有时会与布尔属性混淆。它们是具有一组有限的预定义有效值的 HTML 属性。与布尔属性一样，如果属性存在但值缺失，则它们具有默认值。例如，如果您包含 `<style contenteditable>` ，则默认为 `<style contenteditable="true">` 。

不过，与布尔属性不同的是，省略该属性并不意味着它是 false；而是意味着它是 false。存在缺失值的属性不一定为真；无效值的默认值不一定与空字符串相同。继续该示例，如果缺少或无效， contenteditable 默认为 inherit ，并且可以显式设置为 false 。

默认值取决于属性。与布尔值不同，属性如果存在则不会自动为“true”。如果包含 `<style contenteditable="false">` ，则该元素不可编辑。如果该值无效，例如 `<style contenteditable="😀">` ，或者令人惊讶的是 `<style contenteditable="contenteditable">` ，则该值无效并默认为 inherit 。

在大多数情况下，对于枚举属性，缺失值和无效值是相同的。例如，如果 `<input>` 上的 type 属性缺失、存在但没有值或具有无效值，则默认为 text 。虽然这种行为很常见，但这并不是规则。因此，了解哪些属性是布尔属性还是枚举属性非常重要；如果可能，请省略值，以免弄错，然后根据需要查找值。

### 全局属性

全局属性是可以在任何 HTML 元素上设置的属性，包括 `<head>` 中的元素。有超过 30 个全局属性。虽然从理论上讲，这些都可以添加到任何 HTML 元素中，但某些全局属性在某些元素上设置时不起作用；例如，在 `<meta>` 上设置 hidden 作为元内容不会显示。

### id

局属性 id 用于定义元素的唯一标识符。它有多种用途，包括： - 链接片段标识符的目标。 - 识别脚本元素。 - 将表单元素与其标签相关联。 - 提供辅助技术的标签或描述。 - 在 CSS 中使用（高特异性或作为属性选择器）定位样式。

id 值是一个不带空格的字符串。如果它包含空格，文档不会中断，但您必须在 HTML、CSS 和 JS 中使用转义字符来定位 id 。所有其他字符均有效。 id 值可以是 😀 或 .class ，但这不是一个好主意。为了让您当前和未来的编程更加轻松，请将 id 的第一个字符设为字母，并仅使用 ASCII 字母、数字、 _ 和 - .最好制定一个 id 命名约定，然后坚持使用它，因为 id 值区分大小写。

id 对于文档来说应该是唯一的。如果多次使用 id ，您的页面布局可能不会中断，但您的 JavaScript、链接和元素交互可能不会按预期运行。

### 链接片段标识符

导航栏包括四个链接。我们稍后将介绍 link 元素，但现在要认识到链接并不限于基于 HTTP 的 URL；它们可以是当前文档（或其他文档）中页面部分的片段标识符。

在机器学习研讨会网站上，页面标题中的导航栏包含四个链接：

```
<nav>
  <a href="#reg">Register</a>
  <a href="#about">About</a>
  <a href="#teachers">Instructors</a>
  <a href="#feedback">Testimonials</a>
</nav>
```

href 属性提供超链接，激活链接会将用户引导至该超链接。当 URL 包含哈希标记 ( # ) 和后跟字符串时，该字符串就是片段标识符。如果该字符串与网页中某个元素的 id 匹配，则该片段就是该元素的锚点或书签。浏览器将滚动到定义锚点的位置。

这四个链接指向我们页面的四个部分，由它们的 id 属性标识。当用户单击导航栏中的四个链接中的任何一个时，由片段标识符链接到的元素（包含匹配 id 减去 # 的元素）会滚动到视图中。

机器学习研讨会的 <main> 内容有四个带有id的部分。当网站访问者单击 <nav> 中的链接之一时，带有该片段标识符的部分就会滚动到视图中。标记类似于：

```
<section id="reg">
  <h2>Machine Learning Workshop Tickets</h2>
</section>

<section id="about">
  <h2>What you'll learn</h2>
</section>

<section id="teachers">
  <h2>Your Instructors</h2>
  <h3>Hal 9000 <span>&amp;</span> EVE</h3>
</section>

<section id="feedback">
  <h2>What it's like to learn good and do other stuff good too</h2>
</section>
```
比较 `<nav>` 链接中的片段标识符，您会注意到每个都与 `<main>` 中的 `<section>` 的 id 匹配。浏览器为我们提供了一个免费的“页面顶部”链接。设置 href="#top" 、不区分大小写或简单地 href="#" 会将用户滚动到页面顶部。

在 CSS 中，您可以使用 id 选择器（例如 #feedback ）来定位每个部分，或者为了不太具体，使用区分大小写的属性选择器 [id="feedback"] 。

### 脚本

在 MLW.com 上，有一个仅供鼠标用户使用的复活节彩蛋。单击灯开关可打开和关闭页面。

电灯开关图像的标记为： html `<img src="svg/switch2.svg" id="switch" alt="light switch" class="light" />` id 属性可用作 getElementById() 方法的参数，并且带有 # 和 querySelectorAll() 方法参数的一部分。

```
const switchViaID = document.getElementById("switch");
const switchViaSelector = document.querySelector("#switch");
```
我们的一个 JavaScript 函数利用了这种通过 id 属性定位元素的能力：

```
<script>
  /* switch is a reserved word in js, so we us onoff instead */
  const onoff = document.getElementById('switch');
  onoff.addEventListener('click', function(){
    document.body.classList.toggle('black');
  });
</script>
```

### `<label>`

HTML `<label>` 元素具有 for 属性，该属性将与其关联的表单控件的 id 作为其值。通过在每个表单控件上包含 id 并将每个标签与标签的 for 属性配对来创建显式标签，可确保每个表单控件都有关联的标签。

```
<label for="minutes">Send me a reminder</label> 
<input type="number" name="min" id="minutes"> 
<label for="minutes">before the workshop resumes</label>.
```
虽然每个标签可以恰好与一个表单控件关联，但一个表单控件可以具有多个关联标签。

如果表单控件嵌套在 `<label>` 开始和结束标记之间，则不需要 for 和 id 属性：这称为“隐式”标签。标签让所有用户知道每个表单控件的用途。

```
<label>
  Send me a reminder <input type="number" name="min"> before the workshop resumes
</label>.
```
for 和 id 之间的关联使辅助技术的用户可以使用信息。此外，单击标签上的任意位置会将焦点集中到关联的元素上，从而扩展了控件的单击区域。这不仅对那些因灵活性问题而导致鼠标操作不太准确的人有帮助，而且对他们也有帮助。它还可以帮助每个手指比单选按钮更宽的移动设备用户。

```
<fieldset>
  <legend>Question 5: Who is an aspiring load balancer?</legend>
  <ul>
    <li>
      <input type="radio" name="q5" value="blendan" id="q5blendan">
      <label for="q5blendan">Blendan Smooth</label>
    </li>
    <li>
      <input type="radio" name="q5" value="hoover" id="q5hoover">
      <label for="q5hoover">Hoover Sukhdeep</label>
    </li>
  </ul>
</fieldset>
```
在此代码示例中，假测验的假第五个问题是单选多项选择题。每个表单控件都有一个显式标签，每个标签都有一个唯一的 id 。为了确保我们不会意外重复 id，id 值是问题编号和值的组合。

当包含单选按钮时，由于标签描述了单选按钮的值，我们将所有同名按钮包含在 `<fieldset>` 中，其中 `<legend>` 是标签或问题，用于整套。

### 其他无障碍用途

id 在可访问性和可用性方面的使用不仅限于标签。在文本介绍中，通过引用 `<h2>` 的 id 作为 `<section>` 的值，将 `<section>` 转换为区域地标' s aria-labelledby 提供可访问的名称：

```
<section id="about" aria-labelledby="about_heading">
<h2 id="about_heading">What you'll learn</h2>
```
有超过 50 个 aria-* 状态和属性可用于确保可访问性。 aria-labelledby 、 aria-describedby 、 aria-details 和 aria-owns 将空格分隔的 id 参考列表作为其值。 aria-activedescendant 标识当前聚焦的后代元素，将单个 id 引用作为其值：具有焦点的单个元素的引用（一次只能聚焦一个元素） 。

_**注意：使用 aria-labelledby ，您可以创建从表单控件到多个标签的反向关联，包括未嵌套在 `<label>` 中的文本，无论文本标签是否多个表单控件。如果控件同时具有 `<label>` 和 aria-labelledby ，则 aria-labelledby 优先；除非 aria-labelledby 包含标签 ID，否则用户不会听到 `<label>` 文本。**_

### class

class 属性提供了另一种使用 CSS（和 JavaScript）定位元素的方法，但在 HTML 中没有其他用途（尽管框架和组件库可能会使用它们）。 class 属性将元素的区分大小写的类的空格分隔列表作为其值。

_**注意：可以使用 CSS 选择器和 DOM 方法根据元素名称、属性、属性值、DOM 树中的位置等来选择元素。语义 HTML 提供了有用的钩子，通常不需要添加类名。包含类名和使用 document.getElementsByClassName() 与使用更强大的 document.querySelectorAll() 基于属性和页面结构的定位元素之间的独特区别在于，前者返回活动节点列表，后者是静态的。**_

构建完善的语义结构可以根据元素的位置和功能来定位元素。完善的结构允许使用后代元素选择器、关系选择器和属性选择器。当您在本节中了解属性时，请考虑如何设置具有相同属性或属性值的元素的样式。这并不是说您不应该使用 class 属性，而是大多数开发人员没有意识到他们通常不需要这样做。

到目前为止，MLW 尚未使用任何课程。可以在没有单一类名的情况下启动网站吗？我们拭目以待。

### style

style 属性允许应用内联样式，这些样式应用于设置该属性的单个元素。 style 属性采用 CSS 属性值对作为其值，该值的语法与 CSS 样式块的内容相同：属性后跟一个冒号，就像在 CSS 中一样，每个属性都以分号结尾声明，位于值之后。

这些样式仅应用于设置了该属性的元素，如果没有被嵌套元素上或 `<style>` 块或样式表中的其他样式声明覆盖，后代将继承继承的属性值。由于该值包含仅应用于该元素的单个样式块的内容的等效内容，因此它不能用于生成的内容、创建关键帧动画或应用任何其他 at 规则。

虽然 style 确实是一个全局属性，但不建议使用它。相反，在一个或多个单独的文件中定义样式。也就是说， style 属性可以在开发过程中派上用场，以实现快速样式设置，例如用于测试目的。然后采用“解决方案”样式并将其粘贴到链接的 CSS 文件中。

### tabindex

可以将 tabindex 属性添加到任何元素以使其能够接收焦点。 tabindex 值定义是否将其添加到 Tab 键顺序，并且可以选择添加到非默认 Tab 键顺序。

tabindex 属性的值是一个整数。负值（惯例是使用 -1 ）使元素能够接收焦点（例如通过 JavaScript），但不会将该元素添加到 Tab 键序列中。 tabindex 值 0 使元素可通过 Tab 键聚焦和访问，并按源代码顺序将其添加到页面的默认 Tab 键顺序。 1 或更大的值会将元素置于优先焦点序列中，不建议这样做。

在此页面上，有一个使用  `<share-action>` 自定义元素充当 `<button>` 的共享功能。包含0的 tabindex 是为了将自定义元素添加到键盘默认 Tab 键顺序中：

```
<share-action authors="@estellevw" data-action="click" data-category="web.dev" data-icon="share" data-label="share, twitter" role="button" tabindex="0">
  <svg aria-label="share" role="img" xmlns="http://www.w3.org/2000/svg">
    <use href="#shareIcon" />
  </svg>
  <span>Share</span>
</share-action>
```
button 的 role 通知屏幕阅读器用户该元素的行为应类似于按钮。 JavaScript 用于确保遵守按钮功能承诺；包括处理单击和按键事件以及处理 Enter 和 Space 键按键。

表单控件、链接、按钮和内容可编辑元素能够获得焦点；当键盘用户按下 Tab 键时，焦点将移动到下一个可聚焦元素，就像它们已设置 tabindex="0" 一样。默认情况下，其他元素不可聚焦。向这些元素添加 tabindex 属性使它们能够获得焦点，否则它们不会获得焦点。

如果文档包含 tabindex 为 1 或更大的元素，则它们将包含在单独的制表符序列中。正如您在代码笔中注意到的那样，制表符以单独的顺序开始，按照从最低值到最高值的顺序，然后按源代码顺序浏览常规序列。

```
<p>Click in any input, then hit the tab key.</p>
<ol>
  <li><input tabindex="3" value="3"></li>
  <li><input tabindex="6" value="6"></li>
  <li><input tabindex="2" value="2"></li>
  <li><input tabindex="0" value="0"></li>
  <li><input tabindex="0" value="0"></li>
  <li><input tabindex="-1" value="-1"></li>
  <li><input tabindex="0" value="0"></li>
  <li><input tabindex="8" value="8"></li>
  <li><input tabindex="1" value="1"></li>
  <li><input tabindex="5" value="5"></li>
  <li><input tabindex="7" value="7"></li>
  <li><input tabindex="4" value="4"></li>
</ol>
```

改变 Tab 键顺序可能会造成非常糟糕的用户体验。这使得依赖辅助技术（键盘和屏幕阅读器等）来浏览内容变得困难。作为开发人员来说，管理和维护也很困难。专注很重要；有一个完整的模块讨论焦点和焦点顺序。

### role

role 属性是 ARIA 规范的一部分，而不是 WHATWG HMTL 规范的一部分。 role 属性可用于为内容提供语义含义，使屏幕阅读器能够向站点用户通知对象的预期用户交互。

有一些常见的 UI 小部件，例如组合框、菜单栏、选项卡列表和树形网格，没有本机 HTML 等效项。例如，在创建选项卡式设计模式时，可以使用 tab 、 tablist 和 tabpanel 角色。能够实际看到用户界面的人已经通过经验学会了如何导航小部件并通过单击相关选项卡使不同的面板可见。当使用一组按钮显示不同的面板时，将 tab 角色与 `<button role="tab">` 一起加入，可以让屏幕阅读器用户知道当前具有焦点的 `<button>` 可以切换相关面板进入视图，而不是实现典型的类似按钮的功能。

role 属性不会更改浏览器行为或更改键盘或指针设备交互 - 将 role="button" 添加到 <span> 不会将其变成 `<button>` 属性可以在非语义元素已改造为语义元素的角色时通知屏幕阅读器用户。

### contenteditable

contenteditable 属性设置为 true 的元素是可编辑的、可聚焦的，并且会添加到 Tab 键顺序，就像设置了 tabindex="0" 一样。 Contenteditable 是支持值 true 和 false 的枚举属性，如果该属性不存在或已存在，则默认值为 inherit 无效值。

这三个开始标签是等效的：

```
<style contenteditable>
<style contenteditable="">
<style contenteditable="true">
```

如果包含 `<style contenteditable="false">` ，则该元素不可编辑（除非它默认可编辑，例如 `<textarea>` ）。如果该值无效，例如 `<style contenteditable="😀">` 或 `<style contenteditable="contenteditable">` ，则该值默认为 inherit 。

要在状态之间切换，请查询 HTMLElement.isContentEditable 只读属性的值。

```
const editor = document.getElementById("myElement");
if(editor.contentEditable) {
  editor.setAttribute("contenteditable", "false");
} else {
  editor.setAttribute("contenteditable", "");
}
```
或者，可以通过将 editor.contentEditable 设置为 true 、 false 或 inherit 来指定此属性。

全局属性可以应用于所有元素，甚至是 `<style>` 元素。您可以使用属性和一些 CSS 来制作实时 CSS 编辑器。

```
<style contenteditable>
style {
  color: inherit;
  display:block;
  border: 1px solid;
  font: inherit;
  font-family: monospace;
  padding:1em;
  border-radius: 1em;
  white-space: pre;
}
</style>
```
尝试将 style 的 color 更改为 inherit 以外的内容。然后尝试将 style 更改为 p 选择器。不要删除显示属性，否则样式块将消失。

### 自定义属性

我们只触及了 HTML 全局属性的表面。还有更多属性仅适用于一个或一组有限的元素。即使有数百个已定义的属性，您也可能需要规范中未包含的属性。 HTML 已满足您的要求。

您可以通过添加 data- 前缀来创建所需的任何自定义属性。您可以将属性命名为以 data- 开头的任何名称，后跟不以 xml 开头且不包含冒号的任何小写字符系列 ( : ).

虽然 HTML 是宽容的，如果您创建不以 data 开头的不受支持的属性，或者即使您的自定义属性以 xml 开头或包含 : ，创建以 data- 开头的有效自定义属性有很多好处。通过自定义数据属性，您知道您不会意外地使用现有的属性名称。自定义数据属性是面向未来的。

虽然浏览器不会为任何特定的 data- 前缀属性实现默认行为，但有一个内置的数据集 API 可以迭代您的自定义属性。自定义属性是通过 JavaScript 传达特定于应用程序的信息的绝佳方式。以 data-name 形式向元素添加自定义属性，并在相关元素上使用 dataset[name] 通过 DOM 访问这些属性。

```
<blockquote data-machine-learning="workshop"
  data-first-name="Blendan" data-last-name="Smooth"
  data-formerly="Margarita Maker" data-aspiring="Load Balancer"
  data-year-graduated="2022">
  HAL and EVE could teach a fan to blow hot air.
</blockquote>
```
您可以使用完整的属性名称来使用 getAttribute() ，也可以利用更简单的 dataset 属性。

```
el.dataset[machineLearning]; // workshop
e.dataset.machineLearning; // workshop
```
dataset 属性返回每个元素的 data- 属性的 DOMStringMap 对象。 `<blockquote>` 上有几个自定义属性。 dataset 属性意味着您无需知道这些自定义属性是什么即可访问它们的名称和值：

```
for (let key in el.dataset) {
  customObject[key] = el.dataset[key];
}
```
本文中的属性是全局的，这意味着它们可以应用于任何 HTML 元素（尽管它们并不都对这些元素产生影响）。接下来，我们将看看介绍图像中我们没有提到的两个属性 - target 和 href - 以及其他几个特定于元素的属性，因为我们会更深入地研究查看链接。




### 原文

- [Attributes](https://web.dev/learn/html/attributes?hl=en)
- [ARIA（Accessible Rich Internet Applications）规范](https://w3c.github.io/aria/#introroles)

