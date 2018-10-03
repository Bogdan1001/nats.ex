defmodule Gnat.Mixfile do
  use Mix.Project

  def project do
    [
      app: :gnat,
      version: "0.4.2",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package(),
      propcheck: [counter_examples: "test/counter_examples"],
      deps: deps(),
      docs: [
        main: "readme",
        logo: "gnat.png",
        extras: ["README.md"],
      ]
    ]
  end

  def application do
    [extra_applications: [:logger, :ssl]]
  end

  defp deps do
    [
      {:benchee, "~> 0.6.0", only: :dev},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.15", only: :dev},
      {:poison, "~> 3.0"},
      {:propcheck, "~> 1.0", only: :test},
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      description: "A nats client in pure elixir. Resiliance, Performance, Ease-of-Use.",
      licenses: ["MIT"],
      links: %{
        "Github" => "https://github.com/mmmries/gnat",
        "Docs" => "https://hexdocs.pm/gnat",
      },
      maintainers: ["Jon Carstens", "Devin Christensen", "Dave Hackett","Steve Newell", "Michael Ries", "Garrett Thornburg", "Masahiro Tokioka"],
    ]
  end
end
