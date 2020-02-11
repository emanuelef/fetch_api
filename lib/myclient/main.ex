defmodule Myclient.Main do
  alias Mix.Shell.IO, as: Shell

  @adbs_url "https://global.adsbexchange.com/VirtualRadar/AircraftList.json?lat=51.47024&lng=-0.462885&fDstL=0&fDstU=16"
  @headers [Referer: "https://global.adsbexchange.com/VirtualRadar/desktop.html"]

  def start do
    {:ok, pid} = Stack.start_link()
    start_fetching(pid)
  end

  defp convert_to_map(json_text, pid) do
    Myclient.Client.decode(json_text)
    Stack.push(pid, :foo)
  end

  defp start_fetching(pid) do
    HTTPoison.start()
    Shell.info("=== AirTr === #{inspect(pid)}")

    case Myclient.Client.get(@adbs_url, @headers) do
      {200, body} -> convert_to_map(body, pid)
    end

    Shell.info("Size: #{Stack.size(pid)}")

    Process.sleep(5000)
    start_fetching(pid)
  end
end
