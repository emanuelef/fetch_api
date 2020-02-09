defmodule Mix.Tasks.Start do
  use Mix.Task
  def run(_), do: Myclient.Client.get("https://api.github.com")
end
