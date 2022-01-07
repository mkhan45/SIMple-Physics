defmodule Lab do
  def get_labs() do
    {:ok, lab_files} = File.ls("content/labs")
    lab_files
    |> Enum.map(fn n -> "content/labs/#{n}" end)
    |> Enum.map(&File.read!/1)
    |> Enum.map(&EarmarkParser.as_ast/1)
    |> Enum.map(fn {:ok, ast, _} -> ast end)
  end

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
end
