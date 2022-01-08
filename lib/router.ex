defmodule Router do
  use Plug.Router
  require Math

  plug Plug.Static, at: "/static", from: "public/static"

  plug(:match)
  plug(:dispatch)

  def render(template, args \\ []) do
    defaults = [
      base_url: Generator.base_url(), 
      icons: Icons.icons(), 
      render: fn(template) -> render(template) end,
      render_args: fn(template, args) -> render(template, args) end,
      components: Components,
      sigil_e: fn(s, _opts) -> s end,
    ]

    args = Keyword.merge(defaults, args)
    EEx.eval_file(template, args)
  end

  get "" do
    templated = render("templates/index.html.eex")
    send_resp(conn, 200, templated)
  end

  get "/labs" do
    templated = render("templates/labs.html.eex", labs: Lab.get_labs(), category: "All")
    send_resp(conn, 200, templated)
  end

  get "/labs/:category" do
    category = String.replace_suffix(category, ".html", "")
    is_page_category = fn lab -> 
      lab_categories = Lab.categories(lab)
      Enum.member?(lab_categories, category)
    end

    labs = Lab.get_labs() |> Stream.filter(is_page_category)

    templated = render("templates/labs.html.eex", labs: labs, category: category)

    send_resp(conn, 200, templated)
  end

  get "/in_progress" do
    send_resp(conn, 200, "This page is in progress")
  end

  get "/lab/:lab" do
    lab = "content/labs/#{lab}.md"
          |> File.read!()
          |> EarmarkParser.as_ast()
          |> then(fn {:ok, ast, _} -> ast end)

    templated = render("templates/lab.html.eex", lab: lab)

    send_resp(conn, 200, templated)
  end

  match _ do
    send_resp(conn, 404, "404")
  end
end
