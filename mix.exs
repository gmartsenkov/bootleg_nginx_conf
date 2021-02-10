defmodule BootlegNginxConf.MixProject do
  use Mix.Project

  def project do
    [
      app: :bootleg_nginx_conf,
      version: "0.1.0",
      elixir: "~> 1.11",
      description: "Bootleg task to upload nginx config to remote servers",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bootleg, ">= 0.13.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "bootleg_nginx_conf",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/gmartsenkov/bootleg_nginx_conf"}
    ]
  end
end
