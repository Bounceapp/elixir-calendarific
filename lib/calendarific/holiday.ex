defmodule Calendarific.Holiday do
  @derive [Poison.Encoder]
  alias Calendarific.HttpClient

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
    case @endpoint |> HttpClient.request(country: country_code, year: year) do
      {:ok, body} ->
        Poison.decode!(body, as: %{"response" => %{"holidays" => [%Calendarific.Holiday{}]}})[
          "response"
        ]["holidays"]

      {:error, reason} ->
        {:error, reason}
    end
  end
end
