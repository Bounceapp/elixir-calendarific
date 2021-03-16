defmodule Calendarific.Apis.Holidays do
  @derive [Poison.Encoder]

  alias Calendarific.HttpClient
  alias Calendarific.Types

  @endpoint "holidays"

  def fetch(country_code, year) do
    HttpClient.request(:get, @endpoint, country: country_code, year: year)
    |> Map.get("response")
    |> Map.get("holidays")
    |> Enum.map(fn h ->
      h
      |> Poison.encode!()
      |> Poison.decode!(
        as: %Types.Holiday{
          country: %Types.Country{},
          date: %Types.Date{datetime: %Types.DateTime{}},
          states: [%Types.State{}]
        }
      )
    end)
  end
end
