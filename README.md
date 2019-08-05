# OA

#### 介绍
办公自动化系统，功能包括人员管理、部门管理、报销单的审批与处理等

#### 项目架构
三层架构

持久层--MyBatis、
业务层--JavaBean
表现层--SpringMVC、

分别对应三个模块，oa_dao、oa_biz、oa_web

基于MVC模式

服务器：Tomcat 8

数据库：Maria 10 

项目管理：Maven 3.3.9


#### 所遇问题、解决方式

1. JSTL标签库，导入Contant常量类，在c:if的test中获取不到相应的值，更换Tomcat版本为8，问题解决


#### 界面效果图

