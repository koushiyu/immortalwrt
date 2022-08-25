local utl = require "luci.util"

local sys   = require "luci.sys"
local zones = require "luci.sys.zoneinfo"
local fs    = require "nixio.fs"
local conf  = require "luci.config"

m = Map("ping", translate("自定义Ping测试"), translate("编译&汉化 @匕首，昔年 ；3000块钱进我群，5路5G带回家~"))

d = m:section(TypedSection, "ping", " ")
d.anonymous = true

c1 = d:option(ListValue, "enable", translate("Ping 测试功能状态 : "), translate("每 20 秒 Ping 一次，如果失败将会重新启动调制解调器或重新启动路由器"));
c1:value("0", translate("Disabled"))
c1:value("1", translate("Enabled"))
c1.default=0

interval = d:option(Value, "interval", translate("测试时间间隔 :"), translate("测试连接之间的秒数，可接受值是 20 到 120 秒")); 
interval.rmempty = true;
interval.optional=false;
interval.datatype = 'range(20,120)';
interval.default="20";

type = d:option(ListValue, "type", translate("测试类型 :"), translate("测试类型指的是网页检索或 Ping"));
type:value("0", translate("Ping检测方式"))
type:value("1", translate("网页检测方式"))
type.default=1

d1 = d:option(ListValue, "delay", translate("重新连接延迟"),translate("重新启动模块后检查连接前的延迟，默认为40（以秒为单位）"));
d1:value("40", "40 秒")
d1:value("45", "45 秒")
d1:value("50", "50 秒")
d1:value("55", "55 秒")
d1:value("60", "60 秒")
d1:value("70", "70 秒")
d1:value("80", "80 秒")
d1:value("90", "90 秒")
d1:value("100", "100 秒")
d1:value("120", "120 秒")
d1.default=40

return m