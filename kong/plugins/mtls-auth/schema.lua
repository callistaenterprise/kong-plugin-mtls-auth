local typedefs = require "kong.db.schema.typedefs"

return {
    name = "mtls-auth",
    fields = {
        { consumer = typedefs.no_consumer },
        { protocols = typedefs.protocols_http },
        {
            config = {
                type = "record",
                fields = {
                    {
                        error_response_code = {
                            type = "number",
                            required = false,
                            default = 401,
                        },
                    },
                    {
                        upstream_cert_header = {
                            type = "string",
                            required = false,
                        },
                    },
                    {
                        upstream_cert_fingerprint_header = {
                            type = "string",
                            required = false,
                        },
                    },
                    {
                        upstream_cert_serial_header = {
                            type = "string",
                            required = false,
                        },
                    },
                    {
                        upstream_cert_i_dn_header = {
                            type = "string",
                            required = false,
                        },
                    },
                    {
                        upstream_cert_s_dn_header = {
                            type = "string",
                            required = false,
                        },
                    },
                    {
                        upstream_cert_cn_header = {
                            type = "string",
                            required = false,
                        },
                    },
                    {
                        upstream_cert_org_header = {
                            type = "string",
                            required = false,
                        },
                    },
                },
            },
        },
    },
    entity_checks = {},
}
