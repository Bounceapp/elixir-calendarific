defmodule Calendarific.Types do
  defmodule Country do
    @type country :: %{
            id: String.t(),
            name: String.t()
          }

    defstruct [:id, :name]
  end

  defmodule DateTime do
    @type datetime :: %{
            year: integer(),
            month: integer(),
            day: integer()
          }

    defstruct [:year, :month, :day]
  end

  defmodule Date do
    @type date :: %{
            iso: String.t(),
            datetime: DateTime.t()
          }

    defstruct [:iso, :datetime]
  end

  defmodule State do
    @type state :: %{
            id: integer(),
            abbrev: String.t(),
            name: String.t(),
            exception: String.t(),
            iso: String.t()
          }

    defstruct [:id, :abbrev, :name, :exception, :iso]
  end

  defmodule Holiday do
    @type holiday :: %{
            id: number(),
            uuid: binary(),
            name: String.t(),
            description: String.t(),
            country: Country.t(),
            date: Date.t(),
            type: [String.t()],
            locations: String.t(),
            states: [State.t()] | String.t()
          }

    defstruct [
      :id,
      :uuid,
      :name,
      :description,
      :country,
      :date,
      :type,
      :locations,
      :states
    ]
  end
end
