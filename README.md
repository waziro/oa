# OA

## 介绍
办公自动化系统，功能包括人员管理、部门管理、报销单的审批与处理等

### 项目架构
三层架构
持久层--MyBatis、业务层--JavaBean、表现层--SpringMVC

### 版本
服务器：Tomcat 8，数据库：Maria 10 ，项目管理：Maven 3.3.9

### 描述
#### 主要功能：
用户登录、员工管理、部门管理、报销单处理
#### 业务流程：
报销单，员工填写报销单并提交，部门经理负责审核，可以打回、通过或直接拒绝，如果审核通 过，根据实际情况，或进入复审，或等待财务的处理
#### 相关技术：
Spring IOC、声明式事务管理、Spring标签库和拦截器，Filter过滤器

### 所遇问题、解决方式
1. JSTL标签库，导入Contant常量类，在c:if的test中获取不到相应的值，更换Tomcat版本为8，问题解决


#### 界面效果图

![Image Text](https://github.com/waziro/oa/blob/master/others/1.png?raw=true)
![Image Text](https://github.com/waziro/oa/blob/master/others/2.png?raw=true)
![Image Text](https://github.com/waziro/oa/blob/master/others/3.png?raw=true)

