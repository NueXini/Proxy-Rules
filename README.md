# Proxy-Rules

- [Clash](https://github.com/Dreamacro/clash) 
  - 推荐的配置文件为[NueXini_basic.ini](https://raw.githubusercontent.com/NueXini/Proxy-Rules/master/Clash/config/NueXini_basic.ini)
  - 负载均衡配置文件为[basic_load-balance.ini](https://raw.githubusercontent.com/NueXini/Proxy-Rules/master/Clash/basic_load-balance.ini)

------

- SSR (Acl文件中)

文件               | 默认  | 去广告  | 局域网 |   国内IP段  |   国内域名    |     国外
----              | ----  |  ----  | ----  |   ----     |     ----     |    ----
[banAD.acl](https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/banAD.acl)         |  代理  |   是   |  直连  |    有-直连  | 常用域名-直连  |  代理-常用国外域名增强
[onlybanAD.acl](https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/onlybanAD.acl)     |  代理  |   是   |  直连  |    无      |    无         |  代理-常用国外域名增强
[nobanAD.acl](https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/nobanAD.acl)       |  代理  |   否   |  直连  |    有-直连  |  常用域名-直连 |  全局代理
[backcn-banAD.acl](https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/backcn-banAD.acl)  |  代理  |   是   |  直连  |    有-代理  |    无         | 直连-gfwlist列表 
[gfwlist-banAD.acl](https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/gfwlist-banAD.acl) |  直连  |   是   |  直连  |    无      |    无         |  代理-gfwlist列表
[fullgfwlist.acl](https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/fullgfwlist.acl )   |  直连  |   否   |  直连  |    无      |    无         |  代理-gfwlist列表
[gfwlist-user.rule](https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/gfwlist-user.rule) |  直连  |   是   |  直连  |    无      |     无        |  代理-gfwlist列表

------

- Shadowrocket
  - 配置文件[Shadowrocket.conf](https://raw.githubusercontent.com/NueXini/Proxy-Rules/master/Shadowrocket/Shadowrocket.conf)
  - 功能：国外网站代理，中国大陆网站直连，去部分广告

------

- OpenWrt-SSRP
  - [All.list](https://raw.githubusercontent.com/NueXini/Proxy-Rules/master/OpenWrt-SSRP/All.list) Netflix,HBO,Hulu
  - [TikTok.list](https://raw.githubusercontent.com/NueXini/Proxy-Rules/master/OpenWrt-SSRP/TikTok.list) 国际抖音
  - [Steam.list](https://raw.githubusercontent.com/NueXini/Proxy-Rules/master/OpenWrt-SSRP/Steam.list) 游戏平台其他区CDN
  - [SteamCN.list](https://raw.githubusercontent.com/NueXini/Proxy-Rules/master/OpenWrt-SSRP/SteamCN.list) 游戏平台Steam国区CDN
  - [Epic.list](https://raw.githubusercontent.com/NueXini/Proxy-Rules/master/OpenWrt-SSRP/Epic.list) 游戏平台Epic的CDN