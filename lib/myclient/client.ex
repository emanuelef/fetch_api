defmodule Myclient.Client do
  def get(url) do
    case(HTTPoison.get(url)) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  def decode(json_body) do
    case(Jason.decode(json_body)) do
      {:ok, mapped} -> mapped
      {:error, _} -> "Error parsing Json"
    end
  end

end
