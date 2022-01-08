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

    lab_pages = Lab.get_labs() 
            |> Enum.map(&Lab.url/1) 
            |> Enum.map(fn url -> "lab/#{url}" end)

    for page <- Stream.concat([lab_pages, @pages]) do
      resp = HTTPoison.get!("localhost:4000/#{page}")

      page = if page == "", do: "index", else: page
      path = "public/#{page}.html"
      File.mkdir_p!(path |> Path.dirname())
      :ok = File.write(path, resp.body)

      IO.puts("Generated #{page}.html")
    end
  end
end
