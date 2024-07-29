defmodule Calendarific.MixProject do
  use Mix.Project

  def project do
    [
      app: :calendarific,
      version: "0.1.4",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: "An elixir wrapper for the holiday API Calendarific",
      package: package(),
      deps: deps(),
      # Docs
      name: "Calendarific",
      source_url: "https://github.com/Bounceapp/elixir-calendarific",
      homepage_url: "https://github.com/Bounceapp/elixir-calendarific",
      docs: [
        # The main page in the docs
        main: "Calendarific",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 2.0"},
      {:poison, "~> 6.0"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Bounceapp/elixir-calendarific"}
    ]
  end
end
