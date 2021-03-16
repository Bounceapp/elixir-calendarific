defmodule Calendarific.HttpClient do
  use HTTPoison.Base

  def request(:get, url, params) do
    case get(url, [], params: [api_key: api_key()] ++ params) do
      {:ok, %HTTPoison.Response{status_code: code, body: body}} when code in 200..299 ->
        body

      {:ok, %HTTPoison.Response{body: body}} ->
        raise "Request returned non-200 response: #{body}"

      {:error, error} ->
        raise "Calendarific.HttpClient error: #{error}"
    end
  end

  defp api_key do
    Application.fetch_env!(:calendarific, :api_key)
  end

  def process_request_url(url) do
    "https://calendarific.com/api/v2/" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!()
  end
end
