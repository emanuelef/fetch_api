# FetchApi

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fetch_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fetch_api, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/fetch_api](https://hexdocs.pm/fetch_api).

Get dependencies
mix deps.get

Run iex with all dependencies in mix.exs
iex -S mix

Test get
Myclient.Client.get("https://api.github.com")
Myclient.Client.decode(~s({"name":"Steve Irwin","nationality":"Australian"}))
