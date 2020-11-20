# DDD出现的背景
今日听说了一种开发模型设计：领域驱动设计（Domain-Driven Design，简称DDD）。这种模型据说是在2014年便提出，但是在如今互联网发展极度迅速的大环境下，DDD相比敏捷开发，极限编程，DDD可能一眼看上去“古老而缓慢”，但是不可否认，在如今主流的开发过程中，有几点问题暴露正越来越突出。

## 混乱的service
软件开发追求的就是“高内聚，低耦合”，这点大家都知道。而在我们实际的开发过程中，比较容易被业内接受的三层架构，即`controller—>service—>dao`，确实能够在技术上将项目拆分耦合度较低的三层。

其中controller主要是负责对视图的处理，dao则是对实体对象的处理，而我们的主要业务逻辑存放于service层，但随着业务的扩展，逐渐出现了service层内的逻辑混乱，代码不堪入目。

很多时候我们在编写service的时候，都会设计好这个service会做些什么，然后为它取一个响当当的大名，但是后面总是有什么原因，我们最终不得不在这个service中加上越来越多的逻辑，以至于最后代码走查时，就连自己写的代码也会觉得逻辑混乱。

这时候三层架构的矛盾便越来越突出：随着业务扩展，service层将越来越庞大，越来越混乱，我们不得不将他继续拆分，本着面向对象的思想，做着面向过程的事，拆分成越来越多的小方法。由于不规范的开发习惯，很多小方法可能保存了业务逻辑中的中间状态，至此这种架构矛盾已经非常明显了：我们原本学习的那些OO思想现在其实都没有用到，而越来越多的方法导致原本的service业务逻辑越来越模糊。
## 数据库-ER导向系统设计
当我们一旦开始一个新的项目开发的时候，第一步总是去设计数据库E-R，设计完数据库后开始编写实体类，这些类原本该是面向对象中的重要组成部分，而在这种数据库导向设计中，便成为了一种数据库数据实体的载体，面向对象的设计思想，在一定程度上却变成了数据流式的设计思想。

在这种导向的系统设计中，这些实体类仅包含自身的属性，或者说是数据库的字段，却不包含自身的行为(setter和getter不考虑在内)，因此原本属于对象的行为，便要存放于其他方法中，造成了其他方法的混乱难于管理和维护。
# 何为DDD

至少30年以前，一些软件设计人员就已经意识到领域建模和设计的重要性，并形成一种思潮，Eric Evans将其定义为领域驱动设计（Domain-Driven Design，简称DDD）。这就是DDD诞生的由来。
他强调的就是领域对象驱动设计设计的重要性，而这里的领域，这涉及到我们具体的业务，下一章我们具体讨论。

这里直接给出Eric Evans大佬的这本书的译本地址：[领域驱动设计:软件核心复杂性应对之道（修订版)
](https://weread.qq.com/web/reader/62432dc0715a3e4a624c98dkc81322c012c81e728d9d180)

```
其模型和一些术语名词留下一章中详解。
```

# 着手DDD
为了能够更加深入的了解DDD的设计思想，我准备将我之前的一个三层架构系统作出适应向DDD的重构。
[项目地址](https://github.com/PowerDos/Mall-Vue/tree/forMallServerSpringBoot)
# 项目结构
先介绍一下原项目的结构：
mall-server
* springcloud-example-common `项目公用模块`
    * springcloud-example-handler `项目公用异常处理模块，待完善`
    * springcloud-example-common  `项目公用util`
* springcloud-example-basic `微服务基础设施模块`
    * springcloud-example-zuul  `项目网关模块`
* springcloud-example-entity `项目实体类模块（DO,DTO等）`
* springcloud-example-service-api `微服务接口api模块（member,goods,order,remark,seckill等）`
* springcloud-example-service-imp `微服务接口实现模块（member,goods,order,remark,seckill等）`

原项目采用三层架构：controller+service+dao。
* springcloud-example-service-api模块存放了项目所有的api接口，而其具体实现在springcloud-example-service-imp模块中。
![springcloud-example-service-imp](https://img-blog.csdnimg.cn/2020110915380810.png#pic_center)
他下面的五个子模块则是不同业务的各自的实现。

* springcloud-example-common下的springcloud-example-common模块存放了项目的公用工具类(redis，分布式雪花算法生成器，token工具，对象转化工具等)
*  springcloud-example-entity存放了项目的所有实体类，包括数据库实体，业务对象和视图对象等。

# 如何重构
* 在我的原架构中，我将所有的实体对象抽取到了单独与业务的模块，用于其他模块间的公用，如果一旦要采用DDD架构，肯定是要将实体放在各自的业务模块中的。
* 另外我们所有的业务逻辑将拆分到各个领域对象中，而原来的service仅仅做简单的调度工作。
* 在原架构中，数据的来源和去向都是跟业务耦合的，无论是来自DB，cache，或是其他，都与业务逻辑耦合，在DDD架构中，我们要将他们从业务逻辑中剥离出来。

# 重构路线
首先需要分析系统的业务需求，抽取成不同的领域对象，接着开始填充领域对象的行为，最后在service中使用这些领域对象，涉及到数据操作的，使用repo层来进行数据的IO，无论是DB还是cache。
