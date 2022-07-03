---
title: API设计之版本控制
date: 2022-04-09
layout: post
categories: ["API Design"]
tags: ["versioning","api"]
draft: false
---

为了追求系统的健壮性，稳定性，越来越多的系统采用分布式软件架构，分布式意味着跨应用访问成为系统交互的一种特点，特别是微服务架构在商业系统中的大量运用。

API作为应用之间交互协议，当单体应用演变为远程调用后，API持续变更成为一个跨应用或跨团队之间协作的常态，如何维护API，在研发过程中变得尤为重要，非常有必要将API版本控制作为设计的一部分来重视。

### 目的

API版本控制的目的是为了降低API在迭代过程中对用户的影响，并提供一套对第三方开发者有利的演进规则，以及升级策略，尽可能避免用户功能被破坏。

### 发布管理

#### 变更管理

从服务提供方的视角来看，版本发布与服务实现变更是密切相关的，同时也会对第三方开发者带来影响，所以服务方需要严格管理API版本发布内容，每次发布对API做出不限于以下情况的说明：

- 是否在协议不变更的情况，进行了服务优化？
- 是否在老协议上新增了入参，新入参对内部业务逻辑有什么影响？
- 新增协议与现有协议之间有什么关系，是否是独立的？
- 新增协议接口与老接口哪些内容不兼容？告知第三方开发者如何升级。
  
有些较为庞大的组织，按系统维度进行了API划分，变更说明也应该以系统维度来说明。

变更的影响说明可以大致分为以下三类：

- 1、 API架构变化（影响范围较大，不能兼容）
- 2、 局部新特性变更（影响较小，提供兼容）
- 3、 问题修复（完全兼容）

变更说明应该以公开文档的形式公布给第三方开发者。

### 生命周期管理

对于整个API来说，必须以两种视角来看到API版本，一种是第三方开发者视角，一种是API服务视角。

![API version and Service version](/images/2022-04-09-api-design-versioning/version-number-map.png)

尽管对API进行生命周期管理，好处在于一方面可以控制内部开发节奏，另一方面给第三方开发者提供调试和升级时间。但是在API版本号与API服务内部同时演进的情况下，第三方开发者并不关心API服务内部的演进路线，
API服务方也应该尽量减少第三方开发者的理解负担，所以API版本号的变更不易过于频繁。


不同的业务和产品，对API版本发布的周期管理会有所不同，主要有以下两种主流的版本化管理策略：

#### 1、基于时间发布

对不同的变更影响，定义不同的发布周期，例如，将`API架构变化`这种影响范围较大的场景，周期时间应该更长，其次是`局部新特性变更`，`问题修复`发布周期最短。

`API架构变化`：每三个月发布一次，`局部新特性变更`：每三周发布一次，`问题修复`：每周一次。

不同的业务，可以调整这个周期，但时间周期长短上应该遵循：`问题修复` < `局部新特性变更` < `API架构变化`

基于时间周期发布，对于第三方开发者来说的好处是`可预知性`，有明确的API支持时间范围，何时过期，何时被删除。

#### 1、基于语义化版本号发布

基于语义化[版本号](https://semver.org/lang/zh-CN/)的三个维度来管理，例如，版本号:`主版本号.次版本号.小版本号`

- 1、主版本号（对应`API架构变化`）
- 2、次版本号（对应`局部新特性变更`）
- 3、小版本号（对应`问题修复`）

版本号发布方式，常用于不需要周期发布的产品，或API在较长的时间范围内稳定的产品。

同时需要注意：语义化版本号策略更多地是来至API服务方的视角，主要目标是跟踪API不同的兼容性问题。

#### 基于WEB的API版本发布方案

对于REST API可选的三种方案：

- 方案1：将版本号放到路径中，例如：_https://api.akulaku.com/**v1.0**/products/users_ 或使用不同的域名 _https://**apiv1**.akulaku.com/products/users_
- 方案2：将版本号放在HTTP header头中，例如，在header中放入：v=1.0
- 方案3：将版本号放到参数中，例如：_https://api.akulaku.com/products/users?**api-version=1.0**_

方案1和2都需要借助DNS或API网关对请求路由，不同版本的API路由到不同的API服务上。



方案3则需要API服务内部管理版本号映射

|  API版本号   | API内部服务版本号  |
|  ----  | ----  |
| v1.0  | v1.0.0，v1.0.1 |
| v2.0  | v2.0.0 |
| ......  | ...... |

### 案例

#### Shopify

Shopify作为全球最大的一站式商家平台，强大的API为其提供了核心竞争力。

Shopify的API管理区分了两类API，一类是非版本化的API，一类是版本化的API，
其中版本化的API是`基于时间发布`。

例如官方给的REST API demo：_/admin/api/**2022-07**/products.json_

同时官方也提供了API状态周期表：

| Stable version | Release date | Date stable version is supported until |
|  ----  | ----  | ----|
| 2021-01 | January 1, 2021 | January 1, 2022 |
| 2021-04 | April 1, 2021 | April 1, 2022 |
| 2021-07 | July 1, 2021 | July 1, 2022 |
| 2021-10 | October 1, 2021 | October 1, 2022 |

给第三方调用者提供了明确的API支持时间。

### 参考

- [How to Design a Good API and Why it Matters](https://static.googleusercontent.com/media/research.google.com/zh-CN//pubs/archive/32713.pdf)
- [Microsoft API Versioning](https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#12-versioning)
- [Shopify API Versioning](https://shopify.dev/api/usage/versioning)
- [Google Cloud API Versioning](https://cloud.google.com/apis/design/versioning)
