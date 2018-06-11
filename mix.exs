defmodule Zombie.MixProject do
  use Mix.Project

  def project do
    [
      app: :zombie,
      name: "Zombie",
      description: description(),
      package: package(),
      docs: [
        extras: ~W(README.md)
      ],
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end

  defp description do
    """
    Allows you to persist your iex variables so that they can be loaded back in a new iex session.
    """
  end

  defp package do
    [
      description: description(),
      files: ~w(lib config mix.exs README.md LICENSE),
      maintainers: ["Khaja Minhajuddin"],
      licenses: ["MIT"],
      links: %{
        "Github" => "http://github.com/tripping/zombie",
        "Docs" => "http://hexdocs.pm/zombie"
      }
    ]
  end
end
