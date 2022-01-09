defmodule Generator do
  @pages [
    "",
    "labs",
    "labs/Gravity",
    "labs/Mechanics",
    "tutorials",
    "tutorials/Gravity",
    "tutorials/Mechanics",
    "in_progress"
  ]

  def base_url(), do: System.get_env() |> Access.get("BASE_URL", "")

  def lab_pages() do
    Post.get_labs() 
    |> Enum.map(&Post.url/1) 
    |> Enum.map(fn url -> "lab/#{url}" end)
  end

  def tutorial_pages() do
    Post.get_tutorials() 
    |> Enum.map(&Post.url/1) 
    |> Enum.map(fn url -> "tutorial/#{url}" end)
  end

  def gen_pages() do
    System.cmd("tailwind", ["-i", "./CSS/base.css", "-o", "./public/static/CSS/base.css"])

    pages = Stream.concat([lab_pages(), tutorial_pages(), @pages])
    for page <- pages do
      resp = HTTPoison.get!("localhost:4000/#{page}")

      page = if page == "", do: "index", else: page
      path = "public/#{page}.html"
      File.mkdir_p!(path |> Path.dirname())
      :ok = File.write(path, resp.body)

      IO.puts("Generated #{page}.html")
    end
  end
end
