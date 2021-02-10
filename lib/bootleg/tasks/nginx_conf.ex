defmodule Bootleg.Tasks.NginxConf do
  use Bootleg.Task do
    task :upload_nginx_conf do
      alias Bootleg.{UI, Config}

      UI.info("Copying NGINX config to remote...")

      template_filepath = Config.get_key(:nginx_template)
      sites_available_path = Config.get_key(:nginx_sites_available_path)
      sites_enabled_path = Config.get_key(:nginx_sites_enabled_path)
      config_name = Config.get_key(:nginx_config_name)

      evaled_file = EEx.eval_file(template_filepath, Config.get_all())

      temp_config_file = Path.join("/tmp", "nginx_bootleg_conf_template")

      File.write!(temp_config_file, evaled_file)

      upload :app, temp_config_file, Path.join(sites_available_path, config_name)
      remote :app do
        "ln -fs #{Path.join(sites_available_path, config_name)} #{Path.join(sites_enabled_path, config_name)}"
      end

      File.rm(temp_config_file)

      UI.info("NGINX config upload was successful")
    end

    before_task :deploy, :upload_nginx_conf
  end
end
