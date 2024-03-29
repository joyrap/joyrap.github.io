---
layout: post
title: A Philosophy Of Software Design-读书笔记
date: 2022-01-08
categories: ["Software Design"]
draft: false
---

> [《软件设计的哲学》](https://book.douban.com/subject/30218046/)这本书最早出版于2018年，2021年出了[2nd Edition](https://web.stanford.edu/~ouster/cgi-bin/book.php)，目前国内还没有中文版，这本书是[作者](https://twitter.com/johnousterhout)
> 在斯坦福大学开设的[CS190](https://web.stanford.edu/~ouster/cgi-bin/cs190-winter21/index.php)课程大纲。
> 我专门搜索了一下国内软件专业的大学，基本上都没有关于软件设计的课程。
>
> 市面很多关于软件设计的书籍，大部分都是基于某些特定编程语言或者技术，还没有一本全面讲解软件设计本身的书。
>
> 软件设计本来是一种创造性活动，主观性极强，本书作者的基调还是鼓励利用一切手段来考虑系统的设计性，有些做法比较激进。
> 
> 这里尝试将其中精彩部分做点翻译，结合自己的理解便于学习。

## 2. The Nature of Complexity <复杂性的本质>

这本书是关于如何设计软件系统并最小化复杂性，首先你得了解你的敌人，明确什么是“复杂性”？你如何描述一个系统复杂性？是什么让系统变得复杂？
本章将在一个更高维度阐述这些问题。

识别复杂性是重要的设计技能，它让你在处理问题之前明确问题所在，让你在众多选择中作出好的选择。

### 2.1 Complexity defined <复杂性的定义>

**任何使软件系统难于理解和修改的东西，即是复杂性**。复杂性以不同方式存在，比如它可能是一段难于理解的代码，它可能是需要付出巨大努力才能实现一个很小的优化，
它可能是错综复杂的关联中难于修复的BUG。

复杂性是一个开发人员在某个时间点上试图完成某个特定目标的过程，它不一定是整个系统功能。人们直觉上认为具有大量功能的大型软件系统是”复杂“的，但是这样的系统如果容易实现
，那么对于本书的定义来说，他就不算复杂。当然几乎所有的大型软件系统实际上都是复杂到难于实现，他们或多或少都会出现我定义的复杂性，也不是说没有复杂功能的简单系统就不可能出现复杂。

复杂性是由大多数常见的活动决定的，如果一个系统只有很少一部分是复杂的，但它们不影响整个系统复杂性。

我们可以用一个简单的数学公式来描述系统复杂性：

$$ C=\sum\_{p}c\_{p}t\_{p} $$


（p为系统的组件数量，c为组件的复杂性，t为完成组件投入的时间）

系统的整体复杂性由组成部分乘以开发人员在其投入的工作时间，将复杂性隔离在不容易被发现的地方不亚于完全消除复杂性。

复杂性相对于作者而言对读者更显而易见，当事者总会觉得他们写的代码似乎很简单，但其他人却觉得复杂。如果你遇到这种情况，试着询问其他
开发人员，为什么你写的代码在他们看来这样复杂，从交流中找到你与他们之间不同的想法。作为开发者你的工作不只是写你认为容易的代码，
同时也要让其他人容易理解。

### 2.2 Symptoms of complexity <复杂性的特征>
1. Change amplification<变更放大>
  
  有时候看上去是做一个小的改变，但是需要修改多处代码（功能散落在多处）。好设计的目标是降低每个设计中受影响的代码量。

2. Cognitive load<认知负载>
  
  高认知负载意味着开发人员需要花更多的时间去理解需求，这会导致产生BUG的风险，因为他们很容易遗漏一些重要的信息。

  > 作者用C语言分配内存函数举了一个例子，方法调用方需要自己关心内存释放。

  系统设计师有时候用代码行数来衡量复杂性，代码行数与复杂度并无关系，**有时候用更多的代码去实现，也许才是更简单的方式，因为它降低了认知负载。**

3. Unknown unknowns<未知且不确定>
   
   没人能够在一个不清楚来龙去脉的系统中完成开发任务，系统中太多不确定性关联，你无法定义自己应该了解到何种程度。

### 2.3 Causes of complexity <复杂性的原因>

复杂性由**依赖**和**含糊不清**导致。

依赖是软件的基础部分并不能完全消除，实际上依赖贯穿整个软件设计过程，但是软件设计的一个重要的目标是降低依赖，使依赖尽可能地简单。

很多时候，一个需要大量文档的系统通常是晦涩难懂的，说明它的设计不清晰，好的设计结果往往只需要少量文档。

### 2.5 Complexity is incremental <复杂性的增长>

复杂性在系统中是一个变量，它随着功能一起增长，当它积累到一定程度的时候，将会失去控制很难被消除，所以对于复杂性的增长要“零容忍”。

## 3. Working Code isn't Enough <能够工作的代码是不够的>

### 3.1 Tactical programming<战术编程>
**不要怎么快实现就怎么来！**，不然项目最后会变成[屎山](/post/2016-08-08-how-to-make-projects-failed/)，
战术编程在未来的代价和成本很高。

### 3.2 Stategic programming<战略规划>

战略规划是一种投资心态，不要过早做决定，以交付最好设计为目标。

### 3.3 How to invest?

把开发时间的10-20%时间投入到具有长期价值的事情上。

### 3.4 Startups and investment

为了加快交付，创业公司更容易陷入战术编程模式。长期的技术债会拖慢产品的发布，除非雇佣非常优秀的开发人员。

## 4. Modules Should be deep

### 4.1 Modular design<模块化设计>

将系统拆解成多个模块，理想情况下，模块之间应该完全独立。这样，可以将复杂性屏蔽在模块内部。

但这是理想情况很难做到，因为模块之间存在依赖或调用关系。

管理依赖的方式：将模块拆分为 _*接口*_ 和 _*实现*_

好的模块在 _接口_ 实现上要尽量简单，这样的好处是模块在不修改接口的情况下，几乎不会给其他系统带来影响。

### 4.2 What is interface?

接口由两部分组成：一部分是由编程语言语法决定，例如接口方法的参数，以及返回值的类型，方法可能抛出的异常。

另外一部分则是编程语言无能为力的，这部分内容可能描述的是接口更高层次的行为，（比如你希望接口实现支持线程安全，在语法上无法控制实现，只能通过注释。），例如在调用接口某个方法前必须调用另外一个方法，这个部分内容会增加系统的复杂性，这就是第2章所说的**Unknown unknowns<未知且不确定>**，清晰且明确的接口定义有助于消除Unknown unknowns。

### 4.3 Abstractions

抽象与模块设计密切相关，**抽象是对实体的简化视角，它省略了不重要的细节。**

通过抽象来管理复杂度，不仅仅存在编程中，在我们的生活中也很普遍。

### 4.4 Deep modules

![Deep and shallow module](/images/2022-01-08/deep_shallow.jpeg)

> 作者用了Deep和Shallow两个概念来描述模块接口与功能的设计，非常形象，我理解应该是：接口设计趋向于在解决领域问题内越抽象越好，这里的Deep应该就是指抽象的程度。

在同等复杂度的情况下，Deep模块的接口简单，具备复杂的功能实现，Shallow模块（类似于领域驱动设计中的**贫血模型**）则相反。

> 原文夸奖了一下Unix IO模块的接口设计，接口简单明了，内部实现细节对调用者来说完全不用关心。

Deep模块设计另外一个很好的例子，就是Java的垃圾收集器，它有强大的功能，但对于研发人员来说完全是不可见的，所以垃圾收集器的变更不会影响到应用层开发人员。

Unix IO和垃圾收集器易于使用，同时提供了良好的抽象，除此之外他们还将重要的实现复杂度做了很好的隐藏。

### 4.5 Shallow modules
### 4.6 Classitis<过度拆分>

很不幸，Deep设计方式在今天并不被推崇。传统的编程智慧是“类应该设计得足够小”，而不是Deep。
学生们被教导，将大类拆分成多个小类，或者建议他们“当方法代码行数达到多少行后，就应该拆分成多个子方法”，结果是整个系统充满了大量Shallow类和方法。

### 4.7 Examples: Java and Unix/IO

## 5. Information Hiding(and leakage)

### 5.1 information hiding

达到Deep模块设计的最重要的手段就是信息隐藏。基本思想是每个模块都应该封装一些代表设计决策的知识。

### 5.2 information leakage<信息泄露>
### 5.3 Temporal decomposition<时间拆分>

一个典型的信息泄露的设计风格，我称为”时间拆分“，系统结构对应操作时间顺序。

想象一个应用对文件读，修改，最后被写入，如果利用时间拆分方法，应用会被拆分为三个类，一个是读文件，一个执行修改，另外一个写入新版本。

读与写过程都必须知道文件格式，结果导致了信息泄露（文件格式相关的信息在读和写的代码中都存在），解决办法是将读与写逻辑放在一个类中。

容易掉进时间拆分陷阱的原因是，在你写代码时操作的执行顺序通常在你的大脑中。

顺序通常很重要，他总是反映在应用的某个角落，但是它不应该反映在模块结构上。

**设计模块的时候，关注每个需要执行的任务上，而不是他们的执行顺序。**

小心：在时间拆分中，执行顺序反映了代码结构，相同的操作发生在不同类或方法中的不同时间。如果相同的逻辑被用于不同地方，最终会导致信息泄露。

### 5.4 Example HTTP Server
### 5.5 Example too many classes
### 5.6 Information hiding within  a class

## 6. General-Purpose Modules are Deeper

在设计一个新的模块时，你将面临的一个最常见的决定：是提供一个通用的解决方案，还是只解决当前问题。

花时间开发通用解决方案对未来可能节约更多时间。
## 6.5  Questions to ask yourself

什么样的接口既能满足我的所有需求，又是最简单的？

如果你减少了API的方法，但并没有减少功能，那么你可能得到更通用的方法。

## 7. Different Layer,Different Abstraction

系统分层设计，每层有自己的抽象逻辑。

### 7.2 When is interface duplication is OK?<什么时候接口重复没问题？>


### 7.3 Decorators<装饰器>

装饰器设计模式可以起到串联多层之间API重复的作用，JDK中IO模块就是一个很好的例子。

## 8. Pull Complexity Downwards

## 9. Better Together Or better Apart?

软件设计中一个最基本的问题就是，两个功能是应该分开实现，还是一起实现？

这个问题适用于系统的各个方面，例如功能，方法，类和服务。

## 10. Define Errors Out Of Existence<定义不存在的错误>
### 10.1  Why exceptions add complexity

我这里讲的异常，是指超出了控制流外的非正常条件，不是编程语言级别的异常，很多语言都有异常处理机制。

抛出异常是容易的，处理异常却非常复杂，异常处理之间也经常包含关联，例如因为网络原因，客户端需要重试远程调用，
但是如果只是网络延迟呢，那么接收端必须要处理重复调用的情况（幂等）。

所以异常本身就具有很强的复杂性。

### 10.2 Too many exceptions

防止在设计中过度使用异常。

## 11. Design it Twice<二次设计>

软件设计并不容易，很多时候你一开始的设计并不一定就是最好的。

在设计的时候提供更多的选型，选择更好的那个，当你有了多个选择的时候，你就可以比较：

- 哪个设计的接口更简单？
- 哪个设计的接口更通用？
- 哪个设计的接口更容易高效实现？

二次设计可以运用于软件开发的所有阶段。

## 12. Why Write Comments?The Four Excuses

写注释的过程，如果运用得当，会提升系统的设计。相反一个好的软件设计如果没有文档辅助，它的价值会大打折扣。

### 12.1 Good code is self-documenting

一些人认为如果代码写得足够好，就不需要注释。真实情况并不是这样，代码并不能描述所有情况，有时候需要依赖注释。

很不幸，这种观点并没有得到普遍认同，很多开发人员认为写注释是在浪费时间。

**如果用户使用一个方法需要阅读代码，说明这里没有抽象**

### 12.2  I don’t have time to write comments
### 12.3  Comments get out of date and become misleading
### 12.4  All the comments I have seen are worthless

## 13. Comments Should Describe Things that Aren't Obvious from the Code

写注释的原因是，开发人员用来描述代码不能表达的想法，便于未来理解和修改代码。

## 14. Choosing Names<命名>
### 14.2  Create an image
### 14.3  Names should be precise
### 14.4 Use names consistently

## 15. Write The Comments First


### 15.1  Delayed comments are bad comments

写代码前先写注释，很多开发人员认为代码一直在改变，提前写文档毫无意义。

推迟写文档的结果是，最后没有文档。

### 15.2  Write the comments first

我在一开始写注释

- 先写接口注释
- 然后写公共方法的注释
- 在多个注释之间来回审查感觉没什么问题
- 给重要的变量写注释
- 然后才是去写实现，在实现中写上必要的注释。
- 
### 15.3  Comments are a design tool

## 16. Modifying Existing Code

软件开发是一个迭代增加的过程，大型软件系统都有一系列演进阶段，每个阶段中存在修改或新增模块，这意味着系统设计持续演进，
不可能一开始就相处最好的设计。一个成长中的系统设计是在系统演进中通过改变达成的。

## 17. Consistency<一致性>

一致性是强有力的降低系统复杂性的工具。

强调系统一致性，包括概念，解决问题的方式，
## 18. Code Should be Obvious
## 19. Software Trends<软件趋势>
### 19.1 Object-oriented programming and inheritance<面向对象编程与继承>

在面向对象编程中，继承有两种形式：
接口间继承：目的在于多个实现间复用相同接口，使解决方式适用于不用问题，从而降低复杂性。
如果一个接口被更多地不同实现，那么说明这个接口会变得更Deep（抽象），这是抽象的核心概念。

比如IO的读写接口被磁盘读写接口和网络读写接口继承。
### 19.2  Agile development<敏捷开发>

敏捷开发由于其快速迭代的特性，很容易陷入战术编程思维。
### 19.3  Unit tests<单元测试>
过去，开发人员几乎不写测试。没有测试的系统很难被重构，单元测试在软件设计中扮演相当重要的角色。
### 19.4  Test-driven development<测试驱动开发>

测试驱动开发的问题是他专注于可用特性开发工作上，而不是寻找更好的设计。
### 19.5 Design patterns
设计模式最大的风险是过度使用，不是所有问题都能被现有模式完美解决。只有在系统适合某个模式的时候才使用。
## 20. Designing for Performance<性能设计>

### 20.1  How to think about performance<如何看待性能>

### 20.2  Measure before modifying

性能优化前，先想好衡量性能的方案，这样才能量化你做的性能优化。

------

参考阅读：

- [系统困境与软件复杂度：为什么我们的系统会如此复杂？](https://mp.weixin.qq.com/s/g6f8-eSUjc_-fsLt0hKlZQ)
