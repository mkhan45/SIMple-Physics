defmodule ServerApp do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http, 
        plug: Router, 
        options: [port: 4000]
      )
    ]

    opts = [strategy: :one_for_one, name: ServerApp.Supervisor]                         
    IO.puts("Starting Server...")                                                         
    Supervisor.start_link(children, opts)
  end
end
