defmodule ServerApp do
  use Application

  def tailwind_watch() do
    System.cmd("tailwind", ["-i", "./CSS/base.css", "-o", "./static/CSS/base.css", "--watch"])
  end

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http, 
        plug: Router, 
        options: [port: 4000]
      ),
      {Task, fn -> tailwind_watch() end}
    ]

    opts = [strategy: :one_for_one, name: ServerApp.Supervisor]                         
    IO.puts("Starting Server...")                                                         
    Supervisor.start_link(children, opts)
  end
end
