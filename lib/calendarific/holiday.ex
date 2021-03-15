defmodule Calendarific.Holiday do
  @derive [Poison.Encoder]
  alias Calendarific.{
    HttpClient,
    Holiday
  }

  @type country :: %{
          id: String.t(),
          name: String.t()
        }

  @type datetime :: %{
          year: integer(),
          month: integer(),
          day: integer()
        }

  @type date :: %{
          iso: String.t(),
          datetime: datetime
        }

  @type state :: %{
          id: integer(),
          abbrev: String.t(),
          name: String.t(),
          exception: String.t(),
          iso: String.t()
        }

  @type h :: %__MODULE__{
          name: String.t(),
          description: String.t(),
          country: country,
          date: date,
          type: [String.t()],
          locations: String.t(),
          states: [state] | String.t()
        }

  defstruct [
    :name,
    :description,
    :country,
    :date,
    :type,
    :locations,
    :states
  ]

  @endpoint "holidays"

  def fetch(country_code, year) do
    HttpClient.request(:get, @endpoint, country: country_code, year: year)
    |> Map.get("response")
    |> Map.get("holidays")
    |> Enum.map(fn h ->
      h |> Poison.encode!() |> Poison.decode!(as: %Holiday{})
    end)
  end
end
