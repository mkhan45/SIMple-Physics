defmodule Components do
  # for syntax highlighting
  def sigil_e(s, _opts), do: s

  def nav_link(url, inner) do
    ~e"""
    <a href="#{url}">
      #{inner}
    </a>
    """
  end
end
