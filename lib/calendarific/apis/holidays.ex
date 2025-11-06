defmodule Calendarific.Apis.Holidays do
  @derive [Poison.Encoder]

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
