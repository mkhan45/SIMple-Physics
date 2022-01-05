defmodule Router do
  use Plug.Router

  plug Plug.Static, at: "/static", from: "static"

  plug(:match)
  plug(:dispatch)

  def render(template, args \\ []) do
    defaults = [
      base_url: Generator.base_url(), 
      icons: Icons.icons(), 
      render: fn(template) -> render(template) end,
      render_args: fn(template, args) -> render(template, args) end,
      components: Components,
    ]

    args = Keyword.merge(defaults, args)
    EEx.eval_file(template, args)
  end

  get "" do
    templated = render("templates/index.html.eex")
    send_resp(conn, 200, templated)
  end

  match _ do
    send_resp(conn, 404, "404")
  end
end
