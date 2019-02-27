defmodule Sequence.MixProject do
  use Mix.Project

  def project do
    [
      app: :sequence,
      version: "0.1.0",
      elixir: "~> 1.6-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {
        Sequence.Application, 456
      },
      registered: [
        Sequence.Server,
      ],
      extra_applications: [:logger],
    ]
  end

  defp deps do
    [
      {:distillery, "~> 2.0", runtime: false},
    ]
  end
end
