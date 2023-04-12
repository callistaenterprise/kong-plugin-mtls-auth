# kong-plugin-mtls-auth

**kong-plugin-mtls-auth** is an Open Source plugin for [Kong](https://github.com/Mashape/kong) which authenticates
clients using mTLS. It is similar (but simpler) than the [mTLS](https://docs.konghq.com/hub/kong-inc/mtls-auth/) plugin provided in Kong Enterprise edition.
      
Information extracted from the mTLS client certificate can be made available using headers for
the upstream service, or used by other plugins (such as the [kong-plugin-mtls-acl](https://github.com/callistaenterprise/kong-plugin-mtls-acl) plugins)
to further limit access. 

The implementation of this plugin was inspired by the 
[mtls-validate](https://github.com/emersonqueiroz/kong-plugin-mtls-validate) plugin.

## Installation

If you're using `luarocks` execute the following:

    luarocks install kong-plugin-mtls-auth

You also need to set the `KONG_PLUGINS` environment variable

    export KONG_PLUGINS=mtls-auth

## Configuration

Configure nginx to use verify client certificate in `kong.conf`:

	nginx_proxy_ssl_client_certificate = /path/to/rootCA.crt
	nginx_proxy_ssl_verify_client = on
    
To enable the plugin only for one service:

    curl -X POST http://localhost:8001/services/{ID}/plugins \
        --data "name=mtls-auth"  \
        --data "config.upstream_cert_cn_header=X-Client-Cert-San"

To enable the plugin using declarative config in `kong.yml`:

    plugins: 
    - name: mtls-auth
      config:
        upstream_cert_cn_header: "X-Client-Cert-San"


### Parameters

| Parameter                          | Default | Required | Description                                                                                                                |
|------------------------------------|---------|----------|----------------------------------------------------------------------------------------------------------------------------|
| `error_response_code`              | 401     | false    | Response code to return if client certificate validation fails                                                             |
| `upstream_cert_header`             |         | false    | HTTP header name in which the client certificate in PEM format (urlencoded) will be made available to the upstream service |
| `upstream_cert_fingerprint_header` |         | false    | HTTP header name in which the client certificate fingerprint will be made available to the upstream service                |
| `upstream_cert_serial_header`      |         | false    | HTTP header name in which the client certificate serial number will be made available to the upstream service              |
| `upstream_cert_i_dn_header`        |         | false    | HTTP header name in which the client certificate issuer DN will be made available to the upstream service                  |
| `upstream_cert_s_dn_header`        |         | false    | HTTP header name in which the client certificate subject DN will be made available to the upstream service                 |
| `upstream_cert_cn_header`          |         | false    | HTTP header name in which the client certificate Common Name will be made available to the upstream service                |
| `upstream_cert_org_header`         |         | false    | HTTP header name in which the client certificate Organization will be made available to the upstream service               |


## License

Copyright 2023 Björn Beskow, Callista Enterprise AB

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.