defmodule Myclient.Main do
  alias Mix.Shell.IO, as: Shell

  @adbs_url "https://global.adsbexchange.com/VirtualRadar/AircraftList.json?lat=51.47024&lng=-0.462885&fDstL=0&fDstU=16"
  @headers [Referer: "https://global.adsbexchange.com/VirtualRadar/desktop.html"]

  def start do
    start_fetching()
  end

  defp convert_to_map(json_text) do
    Myclient.Client.decode(json_text)
  end

  defp start_fetching do
    HTTPoison.start()
    Shell.info("=== AirTr ===")
    
    case Myclient.Client.get(@adbs_url, @headers) do
      {200, body} -> convert_to_map(body)
    end

    Process.sleep(5000)
    start_fetching()
  end
end
