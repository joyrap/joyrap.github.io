---
title: API设计之版本控制
date: 2022-04-09
layout: post
categories: ["API Design"]
tags: ["versioning","api"]
draft: true
---
公司或技术团队为了适应市场或环境的变化，为用户提供更多的特性，这种情况下催生出的软件产品，必然要面对频繁的需求迭代，需求迭代让软件一直处于变化过程中，这其中包括内部和与外部交互的协议。

为了追求系统的健壮性，稳定性，越来越多的系统采用分布式软件架构，分布式意味着跨应用访问成为系统交互的一种特点，特别是微服务架构在商业系统中的大量运用。

API作为应用之间交互的协议，当单体应用演变为远程调用后，API持续变更成为一个跨应用或跨团队之间协作的常态，在研发过程中变得尤为重要。

既然API变更成为了常态，那么就非常有必要将API版本控制作为设计的一部分来重视。

**未作特殊说明，本文提到的场景主要针对Web API。**

### 目的
API版本控制的目的是为了降低API在迭代过程中对终端用户的影响，并提供一套对开发人员有利的演进规则，尽可能避免用户功能被破坏。

### 版本号
API与client以及server端之间[版本号](https://semver.org/lang/zh-CN/)的演进过程：

![版本号](/images/2022-04-09-api-design-versioning/version-number.png "版本号演进")

在实际项目中，版本号语义化可参考[https://semver.org/](https://semver.org/lang/zh-CN/)，client端与server端使用统一规则，各自演进。
为了降低API维护成本，建议Web API版本号尽量只使用主版本号，例如：v1、v2、v3、...

### 兼容性
兼容性是API版本控制中首先要考虑的问题，在CS（client-server）架构中，兼容性可能发生clietn端，也可能发生在server端，特别是移动应用的场景，兼容性可能更多的放到了server端，因为APP发布后的更新非常困难（很多技术团队研究出很多可动态更新的技术，但在IOS平台这种做法是受管控的）。但即便是server端兼容可操作性更强，但实际项目中兼容性问题还是比较棘手。


#### Web API如何兼容
Web API的两种兼容性方式：
- 固定URL，参数传递API版本号

- URI区分版本号

#### 向下兼容

#### RPC服务如何兼容

### 生命周期

### 参考
- [How to Design a Good API and Why it Matters](https://static.googleusercontent.com/media/research.google.com/zh-CN//pubs/archive/32713.pdf)
- [Shopify API versioning](https://shopify.dev/api/usage/versioning)