defmodule Post do
  def read_post(file) do
    file 
    |> File.read!() 
    |> EEx.eval_string(base_url: Generator.base_url())
    |> EarmarkParser.as_ast() 
    |> then(fn {:ok, ast, _} -> ast end)
  end

  def get_posts_in_folder(folder) do
    {:ok, posts} = File.ls("content/#{folder}")
    posts
    |> Enum.map(fn n -> "content/#{folder}/#{n}" end)
    |> Enum.map(&read_post/1)
  end

  def get_labs(), do: get_posts_in_folder("labs")

  def get_tutorials(), do: get_posts_in_folder("tutorials")

  def title(lab_ast) do
    {"h1", _, [title], _} = lab_ast |> Enum.at(0)
    title
  end

  def url(lab_ast) do
    {"p", _, [url], _} = lab_ast |> Enum.at(1)
    url
  end

  def categories(lab_ast) do
    {"p", _, [categories], _} = lab_ast |> Enum.at(2)
    categories
    |> Code.eval_string
    |> then(fn {c, _} -> c end)
  end

  def description(lab_ast) do
    {"p", _, [description], _} = lab_ast |> Enum.at(3)
    description
  end

  def render(ast) do
    ast
    |> Enum.drop(4)
    |> Earmark.transform()
  end
end
