# Bootleg Nginx Conf
Bootleg task to upload nginx config template to remote servers (those that belong to the :app role).

## Installation
Add `bootleg_nginx_conf` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bootleg_nginx_conf, "~> 0.1.0"}
  ]
end
```

### Configurable options are set in the `config/deploy.exs`.

### Example:
``` elixir
# ./config/deploy.exs

use Bootleg.DSL

config(:nginx_template, "./config/deploy/templates/nginx_conf.eex")
config(:nginx_sites_available_path, "/opt/nginx/sites-available")
config(:nginx_sites_enabled_path, "/opt/nginx/sites-enabled")
```

### Example nginx template: 
The config defined in `config/deploy.exs` can be accessed in the template file using EEx. (Example: `<%= nginx_template %>`)
``` nginx
# ./config/deploy/templates/nginx_conf.eex

upstream phoenix_app {
    server unix:/home/deploy/app/app.socket fail_timeout=0;
}
```


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bootleg_nginx_conf](https://hexdocs.pm/bootleg_nginx_conf).

