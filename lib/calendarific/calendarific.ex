defmodule Calendarific do
  @moduledoc """
  Documentation for `Calendarific`.
  """

  @doc """
  Fetches holidays for a given country and year.

  ## Examples

      iex> Calendarific.holidays("US", 2021) |> List.first
      %Calendarific.Holiday{
        country: %{"id" => "us", "name" => "United States"},
        date: %{
          "datetime" => %{"day" => 1, "month" => 1, "year" => 2021},
          "iso" => "2021-01-01"
        },
        description: "New Year's Day is the first day of the Gregorian calendar, which is widely used in many countries such as the USA.",
        locations: "All",
        name: "New Year's Day",
        states: "All",
        type: ["National holiday"]
      }

  """
  defdelegate holidays(country_code, year), to: Calendarific.Holiday, as: :fetch
end
