defmodule Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "" do
    templated = EEx.eval_file("templates/index.html.eex")
    send_resp(conn, 200, templated)
  end

  match _ do
    send_resp(conn, 404, "404")
  end
end
