defmodule ServerApp do
  use Application

  def tailwind_watch() do
    System.cmd("npx", ["tailwindcss", "-i", "./CSS/base.css", "-o", "./public/static/CSS/base.css", "--watch"])
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
    IO.puts("Starting Server at http://localhost:4000...")                                                         
    Supervisor.start_link(children, opts)
  end
end
