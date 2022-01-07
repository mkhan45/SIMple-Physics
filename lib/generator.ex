defmodule Generator do
  @base_url "."
  
  @pages [
    "",
  ]

  def base_url(), do: @base_url

  def gen_pages() do
    for page <- @pages do
      resp = HTTPoison.get!("localhost:4000/#{page}")

      page = if page == "", do: "index", else: page
      path = "public/#{page}.html"
      File.mkdir_p!(path |> Path.dirname())
      :ok = File.write(path, resp.body)

      IO.puts("Generated #{page}.html")
    end
  end
end
