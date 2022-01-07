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
    templated = render("templates/labs.html.eex", labs: Lab.get_labs())
    send_resp(conn, 200, templated)
  end

  get "/labs/:category" do
    labs = Lab.get_labs
           |> Enum.filter(&
             &1 |> Lab.categories() |> Enum.member?(category)
           )
    templated = render("templates/labs.html.eex", labs: labs)

    send_resp(conn, 200, templated)
  end

  match _ do
    send_resp(conn, 404, "404")
  end
end
