defmodule Calendarific.Apis.Holidays do
  alias Calendarific.HttpClient
  alias Calendarific.Types

  @endpoint "holidays/json"

  @spec fetch(params) :: {:ok, list(Holiday)} | {:error, any()}
        when params: %{
               :country_code => String.t(),
               :year => number(),
               optional(:language) => String.t(),
               optional(:uuid) => boolean()
             }
  def fetch(params) do
    HttpClient.request(:get, @endpoint, params)
    |> Map.get("response")
    |> parse_holidays()
  end

  defp parse_holidays([]), do: []

  defp parse_holidays(response) do
    response
    |> Map.get("holidays")
    |> Enum.map(&parse_holiday/1)
  end

  defp parse_holiday(h) do
    %Types.Holiday{
      id: h["id"],
      uuid: h["uuid"],
      name: h["name"],
      description: h["description"],
      country: parse_country(h["country"]),
      date: parse_date(h["date"]),
      type: h["type"],
      locations: h["locations"],
      states: parse_states(h["states"])
    }
  end

  defp parse_country(nil), do: nil

  defp parse_country(map) do
    %Types.Country{
      id: map["id"],
      name: map["name"]
    }
  end

  defp parse_date(nil), do: nil

  defp parse_date(map) do
    %Types.Date{
      iso: map["iso"],
      datetime: parse_datetime(map["datetime"])
    }
  end

  defp parse_datetime(nil), do: nil

  defp parse_datetime(map) do
    %Types.DateTime{
      year: map["year"],
      month: map["month"],
      day: map["day"]
    }
  end

  defp parse_states(states) when is_list(states) do
    Enum.map(states, fn s ->
      %Types.State{
        id: s["id"],
        abbrev: s["abbrev"],
        name: s["name"],
        exception: s["exception"],
        iso: s["iso"]
      }
    end)
  end

  defp parse_states(states), do: states
end
