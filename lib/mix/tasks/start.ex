defmodule Mix.Tasks.Start do
  use Mix.Task
  def run(_), do: IO.puts(Myclient.Client.decode(~s({"name":"Steve Irwin","nationality":"Australian"}))["name"])
end
