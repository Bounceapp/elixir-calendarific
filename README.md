# Calendarific for Elixir [![Hex pm](https://img.shields.io/hexpm/v/calendarific.svg?style=flat)](https://hex.pm/packages/calendarific) [![hex.pm downloads](https://img.shields.io/hexpm/dt/calendarific.svg?style=flat)](https://hex.pm/packages/calendarific)

An Elixir wrapper for the holiday API Calendarific (https://calendarific.com/)

# Installation

This package can be installed by adding `calendarific` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:calendarific, "~> 0.1.4"}
  ]
end
```

# Configuration

To make calls to Calendarific, it is necessary to configure your Calendarific API Key on your `config.exs` file:

```elixir
config :calendarific, api_key: System.get_env("CALENDARIFIC_API_KEY")
# OR
config :calendarific, api_key: "YOUR API KEY"
```

# Examples

## Holidays

To fetch holidays for a given country and year, you can use the `holidays/2` method:

```elixir
iex> Calendarific.holidays(country: "US", year: 2021)
[
  %Calendarific.Types.Holiday{
    country: %Calendarific.Types.Country{id: "us", name: "United States"},
    date: %Calendarific.Types.Date{
      datetime: %Calendarific.Types.DateTime{day: 1, month: 1, year: 2021},
      iso: "2021-01-01"
    },
    description: "New Year's Day is the first day of the Gregorian calendar, which is widely used in many countries such as the USA.",
    locations: "All",
    name: "New Year's Day",
    states: "All",
    type: ["National holiday"]
  },
  ...
]
```

# Documentation

The docs can be found at [https://hexdocs.pm/calendarific](https://hexdocs.pm/calendarific).

# License

More info at [LICENSE](LICENSE).
