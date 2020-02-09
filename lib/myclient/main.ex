defmodule Myclient.Main do
  alias Mix.Shell.IO, as: Shell

  def start do
    start_fetching()
  end

  defp start_fetching do
    Shell.info("=== AirTr ===")
    IO.puts(Myclient.Client.decode(~s({"name":"Steve Irwin","nationality":"Australian"}))["name"])

    #Myclient.Client.get("https://global.adsbexchange.com/VirtualRadar/AircraftList.json?lat=51.47024&lng=-0.462885&fDstL=0&fDstU=16", ["Referer": "https://global.adsbexchange.com/VirtualRadar/desktop.html"])

    Process.sleep(5000)
    start_fetching()
  end
end
