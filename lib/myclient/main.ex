defmodule Myclient.Main do
  alias Mix.Shell.IO, as: Shell

  @adbs_url "https://global.adsbexchange.com/VirtualRadar/AircraftList.json?lat=51.47024&lng=-0.462885&fDstL=0&fDstU=16"
  @headers [Referer: "https://global.adsbexchange.com/VirtualRadar/desktop.html"]
  @polling_time 6000

  def start do
    {:ok, pid} = Stack.start_link()
    start_fetching(pid)
  end

  defp convert_to_map(json_text, pid) do
    response_map = Myclient.Client.decode(json_text)
    flights = response_map["acList"]
    total = Enum.count(flights)
    Shell.info("Total planes: #{total}")

    #Enum.map(list_with_maps, & &1["Icao"])
    Enum.each(flights, & IO.puts &1["Icao"])
    Stack.push(pid, :foo)
  end

  defp start_fetching(pid) do
    HTTPoison.start()
    Shell.info("=== AirTr === #{inspect(pid)}")

    case Myclient.Client.get(@adbs_url, @headers) do
      {200, body} -> convert_to_map(body, pid)
      {:error, :timeout} -> Shell.info("Timeout!!!")
      {:error, _} -> Shell.info("Error Fetching")
    end

    Shell.info("Size: #{Stack.size(pid)}")

    Process.sleep(@polling_time)
    start_fetching(pid)
  end
end
