defmodule Myclient.Geo do
  @feet_to_metres_factor 0.3048

  def feet_to_metres(feet), do: round(feet * @feet_to_metres_factor)
end
