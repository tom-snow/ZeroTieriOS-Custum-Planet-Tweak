# ZeroTieriOSFix

一个允许 `ZeroTier One` 应用使用自定义的行星服务器的 `Tweak`。

基于`v1.12.2`版本开发并测试通过，其他版本可以参考代码自行实现。

此插件目前是自用的，不会及时更新。

如果需要支持最新版本的`ZeroTier One`客户端，可以创建`issue`。

如果想自定义行星服务器，请参考文章[内网穿透工具 ZeroTier 的私有化部署和组网](https://byteage.com/157.html?from=github)，或者使用[Docker快速搭建行星服务器](https://github.com/xubiaolin/docker-zerotier-planet)

## 如何使用
越狱安装插件后将 planet 文件放到以下目录中的任意一个位置：

```shell
# 1. 应用容器 Documents 目录(第一优先级)，其中 [ZeroTier One] 是 ZeroTier One 的容器 uuid
/var/mobile/Containers/Data/Application/[ZeroTier One]/Documents/planet
# 2. 应用主体 Bundle 目录(第二优先级)，其中 [ZeroTier One] 是 ZeroTier One 的 Bundle uuid
/var/containers/Bundle/Application/[ZeroTier One]/ZeroTier One.app/planet
# 3. 设备 mobile 用户 Documents 目录(第三优先级，TrollFools 注入可能无权限)
/var/mobile/Documents/planet
# 第四优先级：插件自带的行星服务器
```

补充说明，本插件仅供学习研究，第二种使用自定义行星服务器的方法是手动替换官方 planet 文件，具体路径如下，其中 [ZeroTierPTP] 是 ZeroTierPTP 的 uuid：（如果初次安装， `Application Support` 及其子目录不存在请手动创建）

```shell
/var/mobile/Containers/Data/PluginKitPlugin/[ZeroTierPTP]/Library/Application Support/com.zerotier.ZeroTier-One.ZeroTierPTP/planet
```

# ZeroTieriOSFix

A `Tweak` that allows the `ZeroTier One` app to use a custom planet server.

Developed and tested based on version `v1.12.2`. For other versions, you can refer to the code and implement it yourself.

This plugin is currently for personal use and will not be updated regularly.

If you need support for the latest version of the `ZeroTier One` client, you can create an `issue`.

If you want to customize the planet server, please refer to the article [Private Deployment and Networking of the Intranet Penetration Tool ZeroTier](https://byteage.com/157.html?from=github), or use [Docker to Quickly Set Up a Planet Server](https://github.com/xubiaolin/docker-zerotier-planet).

## How to Use
After jailbreaking and installing the plugin, place the planet file in any of the following directories:

```shell
# 1. Application container Documents directory (highest priority), where [ZeroTier One] is the container uuid of ZeroTier One
/var/mobile/Containers/Data/Application/[ZeroTier One]/Documents/planet
# 2. Application main Bundle directory (second priority), where [ZeroTier One] is the Bundle uuid of ZeroTier One
/var/containers/Bundle/Application/[ZeroTier One]/ZeroTier One.app/planet
# 3. Device mobile user Documents directory (third priority, TrollFools injection may not have permission)
/var/mobile/Documents/planet
# Fourth priority: the planet server that comes with the plugin
```

Additionally, this plugin is for learning and research purposes only. The second method to use a custom planet server is to manually replace the official planet file. The specific path is as follows, where [ZeroTierPTP] is the uuid of ZeroTierPTP: (If installing for the first time, please manually create the `Application Support` and its subdirectories if they do not exist)

```shell
/var/mobile/Containers/Data/PluginKitPlugin/[ZeroTierPTP]/Library/Application Support/com.zerotier.ZeroTier-One.ZeroTierPTP/planet
```
