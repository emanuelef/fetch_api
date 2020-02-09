defmodule Mix.Tasks.Start do
  use Mix.Task
  def run(_), do: Myclient.Main.start
end
