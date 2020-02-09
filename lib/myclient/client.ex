defmodule Myclient.Client do
  def get(url) do
    url
    |> HTTPoison.get()
    |> case do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  def decode(json_body) do
    json_body
    |> Jason.decode()
    |> case do
      {:ok, mapped} -> mapped
      {:error, _} -> "Error parsing Json"
    end
  end
end
