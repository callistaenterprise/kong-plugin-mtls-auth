local plugin_name = "mtls-auth"
local package_name = "kong-plugin-"..plugin_name
local package_version = "1.0.0"
local rockspec_revision = "0"

package = package_name
version = package_version .. "-" .. rockspec_revision
supported_platforms = { "linux", "macosx" }

source = {
  url = "git://github.com/callistaenterprise/kong-plugin-mtls-auth",
  tag = "v1.0.0",
  dir = "kong-plugin-mtls-auth"
}

description = {
  summary = "Kong Gateway plugin used to authenticate clients using mTLS",
  detailed = [[
      kong-plugin-mtls-auth is a Kong Gateway plugin for authenticating clients using mTLS.
	  It is similar (but simpler) than the mTLS plugin provided in Kong Enterprise edition.
      
	  Information extracted from the mTLS client certificate can be made available using headers for
	  the upstream service, or used by other plugins (such as the kong-plugin-mtls-acl plugin)
	  to further limit access. 
  ]],
  homepage = "https://github.com/callistaenterprise/kong-plugin-mtls-auth",
  license = "Apache 2.0",
}

dependencies = {
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins."..plugin_name..".handler"] = "kong/plugins/"..plugin_name.."/handler.lua",
    ["kong.plugins."..plugin_name..".schema"] = "kong/plugins/"..plugin_name.."/schema.lua",
  }
}
