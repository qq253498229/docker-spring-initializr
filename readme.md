###

- 本项目是[spring官方脚手架](https://github.com/spring-io/initializr)的修改版，旨在帮助中国用户加快访问速度
- 实际地址为 https://init.codeforfun.cn/
- 希望大家工作学习顺利


##### 说明

- 修改了 initializr-service/src/main/resource/application.yml 修改后内容[查看](application.yml)
  - application.yml文件定义了各种依赖的版本。
- 修改了 initializr-web/src/main/java/io/spring/initializr/web/support/DefaultInitializrMetadataProvider 修改后内容[查看](DefaultInitializrMetadataProvider.java)
  - fetchBootVersions方法返回null，避免强制从spring中心更新版本号。
  - 由于本人测试spring-boot:2.0.0.M7版本目前比较好用，于是设置成了默认项。如需增加版本请提交issue/pull request
- 如需自己搭建initializr，可自行修改。
- 阿里云docker image : registry.cn-beijing.aliyuncs.com/wangdali/spring-initializr
  - [Dockerfile](Dockerfile)
  - [docker-compose.yml](docker-compose.yml)