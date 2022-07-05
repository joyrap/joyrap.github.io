---
title: 图表即代码
date: 2021-11-22
layout: post
categories: ["documentation"]
draft: false
---

### 为何要用文本的方式记录

最近工作中开始重度使用[PlantUML](https://plantuml.com)，于是就总结一下软件开发中使用到的画图软件，以及如何在文档中嵌入图表。

软件开发时用到画图软件林林总总，差异化较大，但我们使用的大部分画图工具，都以独特的二进制文件存储，缺点不利于团队协作和分享，导致跟随代码的相关思维图不能更好地被管理，甚至无法与代码保持及时更新迭代，所以软件工程师们更希望通过像代码一样来管理图形化思维。

文本具有以下优点：

- 容易阅读（文本的优势）
- 版本管理（借助版本管理软件git）
- 易于编辑（任何文本编辑器）

### PlantUML

PlantUML就是为以上这些优点存在的，它允许你通过一个简单的描述性语言（类似伪代码）来画UML图，最后通过[graphviz](https://graphviz.org)生成图片格式（PNG，SVG）。当然PlantUML不仅仅支持UML图，还支持很多非UML图，几乎涵盖了软件开发所有标准图形，具体可以看[官网](https://plantuml.com)介绍。

![Excalidraw](/images/2021-11-22-plantuml-c4/plantuml.png)

PlantUML扩展了很多语法来定义元素的的形状和属性，以及元素间的位置关系，整体布局（从上至下，或从左至右）顺序。刚开始使用PlantUML你肯定会感到不适，它不像图形化界面拖拽软件那样简单，但是作为软件开发工程师来说，学习PlantUML语法并不是难事，因为它已经做了简单化。

### 插件与平台支持

目前在两大主流编辑器[VSCode](https://code.visualstudio.com/)和[IDEA](https://www.jetbrains.com/idea/)都有对应的插件（依赖[graphviz](https://graphviz.org)），个人非常推荐VSCode。

由于PlantUML的普及，各大SaaS软件平台都支持将PlantUML代码嵌入到文档中（例如Confluence），直接生成图片，真正做到图形与文档同步。

### C4

在工作中，很多软件工程师由于经验的不同，在表达非UML范畴的图形时，堆砌了很多线条和框图，并没有章法，鉴于这种乱象，Simon Brown 提出了
[C4模型](https://c4model.com)，他定义了标准化的软件架构图表达方式，将软件架构图由远及近，由粗到细，分为了4个层级：

- 上下文关系
- 容器
- 组件
- 代码

在[UML](https://en.wikipedia.org/wiki/Unified_Modeling_Language)基础上提出了更高层的抽象来描述软件架构。

原话是:

```
It's a way to create maps of your code, at various levels of detail, 
in the same way you would use something 
like Google Maps to zoom in and out of an area you are interested in.
```

这种方法就像是地图软件上使用缩放功能一样来观察软件系统。

C4同时提供了一套基于[PlantUML的模型定义](https://github.com/plantuml-stdlib/C4-PlantUML)，效果图如下：

![Alt text](https://camo.githubusercontent.com/fd09f234c8035394c23a201f31eef5057a6ea042806517b448e36e23473b74a2/68747470733a2f2f7777772e706c616e74756d6c2e636f6d2f706c616e74756d6c2f706e672f684c50525a2d39363474747468775858545f4d316e344d56446c6949515148626d43644559576c31703670554b44616b4a366c52744c5074366d50352d552d6644585733437a3536496275474e5054705a676b686f6c76693748664e765a4275376f485178535775343078736d6371317172477565484c41546b4b76675849614b304865695a3864765130744e65514a7555686e454c6d5f7061514a66743575742d67746d366165424f374b324b667632457834315a78697130594339517466484c58647377745270354f643042574a41663562496a30567a466b33714b5f68614c4f456354467132775f6e5a6749626f78596a53754e7a554a306d6b457a64684263436354616164434e772d676e774b34584b5f6c627772674c496e3070514d745a4a7174476f6f44347743635f6f6735486957593377436c2d734e654a425133765270767a4d61795450734575346d70474439566141683331686a7339436c64437939334c36676d6c6c44746d4f515164445f566a6d34617833734d687a6f766e5f486c46395643642d45336a774d2d792d566c6d713764786f454e514231547337386a6b774941494b486c7853786249344976384c3654673349646f6d657655514f42585369696d51734c5f48747065595476317146715178664e475972327377316e5f79446e4a516b4f4f59534339395764454c38484d4f36536e58656d717941615436614f43374c442d356f5930774d345476343270384d417451494d6354706962714f4e4a2d726e66325247517a305253625933637855737053656166344d5461306171494e6f6a614d77705832686e5f4f614138766a39465f437a516a57354f375f57573065443752746245796e6742577536794b6d78306566345a47707151424a4c7a6e58727338326b46354a767a37745a4f63414e594f52324e44456576447544494d6d38444b63532d7953567457596f36426c365173314a39536e3676396c474c63764462687259576e656431543641676962365979554d37714a67486130514c7963734c4a676b4775726938545f423063504c4c3832706b3146614b4f754555357345597a395644414b51765a3855624b5a67615f64334d4474644e5854796f484174366a31514a385851434b5231625253646e645f72595256494e6b4130314973656334526b4d44757451413363457176415f587a445568594e77526d444e50515346515f4338304776636d7062484e3261396e4d2d524c5f6f7669677261314242636c34614366414954477367766c4178384d66437875473278666c6f684b514a356d664f4a6c73434e5a7375717072586e63636870426f6c73654768756533356e44417352735f6c4b6f4f624c5f646c692d5637356a6f6237386a51714370314a7366646d2d70506f644e6c367a5938654c394b6e354f684a4c366d5658497839356248374f4f734a64346c4361686135624a424e5830515552654d7867786c6b705265453433564b334e624f56434451625174675755767862425a59336f63394c5967522d6d5042616e527665666c5239616c4e534e72516848534931727434794f702d4367526b2d574a6c49684d563432706c4d704f776575396544533441675a3953547148314d327853424e5f616a43775a38632d6b694e3255344869365f3072655f5337385a6b76634d517a30624f4d66584f74485542516f7a344f7569454573394a5a705a586e3533645a346c67644e4a503137334d6732556a724f4f5a5032525668704d5339724e4d6b7746585a775168584f4354374b374c2d61744e54644b674e6444795267514a637668725257505f6c57444330625f334d545a566c546c6a37506138334d754c79554e4a5671723052692d5646304e7058745078624772797a79515a50554670784b782d436d676f72702d31473030)

### PlantUML之外

#### Diagrams

相较于[Diagrams](https://app.diagrams.net/)，国内开发者用得最多的是[ProcessOn](https://processon.com)，后者主要是商业化收费，在线协作存储，前者[代码开源](https://github.com/jgraph/drawio)，提供本地桌面版本(主要开发语言是JavaScript)，
这类工具都提供拖拽的方式来绘制图形，支持导出图片，另外Diagrams存储的文件虽然是XML格式，但是也只有它自己的程序才能解析。

效果如下：
![Diagrams](https://www.diagrams.net/assets/svg/home-dia1.svg)

#### Excalidraw

像Diagrams这些工具，并不是没有竞争对手，[Excalidraw](https://excalidraw.com/)就是其中一个，
PlantUML与C4模型构建了图形化的标准，但有时候我们又希望带点随性，更灵活地表达头脑风暴，[Excalidraw](https://excalidraw.com/)这个工具提供了手绘风格样式，同时也支持外部导入样式。
Excalidraw也是[代码开源](https://github.com/excalidraw/excalidraw),主要采用TypeScript语言开发，本质上和Diagrams的区别在于自由的模版风格。

效果如下：

![Excalidraw](/images/2021-11-22-plantuml-c4/excalidraw.png "图片来自网络")

#### Tldraw

[tldraw](https://www.tldraw.com/)似乎是另外一个Excalidraw？待观察。

#### Asciiflow

另外一种场景就是，有时候我们想在代码中放一些简单的流程图，例如：

```json

+----------+           +----------+
|          |           |          |
|    A     |           |     B    |
|          |           |          |
+----+-----+           +-----+----+
     |                       |
     |                       |
     |                       |
     |                       |
     |                       |
     |     +----------+      |
     |     |          |      |
     +---->|     C    |<-----+
           |          |
           +----------+

```

这类包含在代码注释中的图形出现在很多开源项目中(Java JDK源码中也在使用)。
手动输入这些符号肯定不科学，[Asciiflow](https://asciiflow.com/#/)这个工具专门解决这类问题。

#### Google Drawings

[Google Drawings](https://docs.google.com/drawings)算是微软PowerPoint的替代品。

### 最后

回到[C4模型](https://c4model.com)在讲Level 4: Code的时候提到一个概念，对表达代码级别的图形来说，其生命周期相对来说比较短，也就是说这类图你画完后，随着需求以及代码的变更会慢慢过期。

所以并不是所有架构图都值得维护其有效性，往往越具体的架构图越容易过期，
可以选择先用PlantUML之外的工具来画，再将具有长期价值的架构想法转化成PlantUML代码。

--- 相关连接 ---

- [PlantUML](https://plantuml.com)
- [C4 model](https://en.wikipedia.org/wiki/C4_model)
- [C4](http://c4model.com)
- [PlantUML插件库](https://github.com/plantuml-stdlib/C4-PlantUML)
- [PlantUML美化](https://github.com/xuanye/plantuml-style-c4)
- [graphviz](https://graphviz.org)
- [Excalidraw](https://excalidraw.com)
- [Asciiflow](https://asciiflow.com/)
- [AsciiDoctor Diagram](https://docs.asciidoctor.org/diagram-extension/latest/)
- [WebSequenceDiagrams](https://www.websequencediagrams.com/)
