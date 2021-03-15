defmodule Calendarific.MixProject do
  use Mix.Project

  def project do
    [
      app: :calendarific,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: "A wrapper for the holiday API Calendarific",
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:poison, "~> 4.0"}
    ]
  end
end
