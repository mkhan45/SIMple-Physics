defmodule Mix.Tasks.GenSite do
  use Mix.Task

  def run(_) do
    Mix.Task.run("app.start")
    Generator.gen_pages()
  end
end
