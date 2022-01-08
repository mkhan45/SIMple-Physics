defmodule Generator do
  @pages [
    "",
    "labs",
    "labs/Gravity",
    "labs/Mechanics",
  ]

  def base_url(), do: System.get_env() |> Access.get("BASE_URL", "")

  def gen_pages() do
    System.cmd("tailwind", ["-i", "./CSS/base.css", "-o", "./public/static/CSS/base.css"])

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