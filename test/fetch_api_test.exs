defmodule FetchApiTest do
  use ExUnit.Case
  doctest FetchApi

  test "greets the world" do
    assert FetchApi.hello() == :world
  end
end
