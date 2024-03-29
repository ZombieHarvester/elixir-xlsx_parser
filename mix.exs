defmodule XlsxParser.MixProject do
  use Mix.Project

  def project do
    [
      app: :xlsx_parser,
      version: "0.1.0",
      elixir: "~> 1.7",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [main: "XlsxParser", extras: ["README.md"]],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      aliases: aliases()
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
      # prod
      {:sweet_xml, "~> 0.7"},

      # dev
      {:earmark, "~> 1.4", only: :dev},
      {:ex_doc, "~> 0.21", only: :dev},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},

      # dev and test
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false},

      # test
      {:ex_unit_notifier, "~> 0.1", only: :test},
      {:excoveralls, "~> 0.12", only: :test},
      {:simple_agent, "~> 0.0.7", only: :test},
    ]
  end

  defp description do
    "Simple parsing of xlsx spreadsheet data. Data can be retrieved or written to csv."
  end

  defp package do
    [
      maintainers: ["Mike Binns"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/TheFirstAvenger/elixir-xlsx_parser.git"}
    ]
  end

  defp aliases do
    [
      compile: ["compile --warnings-as-errors"]
    ]
  end
end
