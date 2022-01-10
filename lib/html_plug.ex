defmodule HTMLPlug do
  def init(options), do: options

  def call(conn, _opts) do
    if conn.path_info |> Enum.count() > 0 do
      last_path_info = Enum.at(conn.path_info, -1) |> String.replace_suffix(".html", "")
      new_path_info = (conn.path_info |> Enum.drop(-1)) ++ [last_path_info]
      %{ conn | path_info: new_path_info }
    else
      conn
    end
  end
end
