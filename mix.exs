defmodule Blog.Mixfile do
  use Mix.Project

  def project do
    [app: :blog,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :ecto, :postgrex],
     mod: {Blog, []}]
  end


  defp deps do
    [{:ecto, "~> 2.1.0-rc.1"},
     {:postgrex, "~> 0.12.1"}]
  end
end
