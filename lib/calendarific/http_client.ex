defmodule Calendarific.HttpClient do
  def request(url, params \\ []) do
    HTTPoison.request(
      :get,
      "https://calendarific.com/api/v2/" <> url,
      [],
      [{"Accept", "application/json"}],
      params: [api_key: Application.fetch_env!(:calendarific, :api_key)] ++ params
    )
    |> parse
  end

  defp parse({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    {:ok, body}
  end

  defp parse({:ok, %HTTPoison.Response{body: body, status_code: 204}}) do
    {:ok, body}
  end

  defp parse({:ok, %HTTPoison.Response{status_code: code} = response}) do
    {:error, "Expected a 200, received #{code}"}
  end

  defp parse({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, reason}
  end
end
