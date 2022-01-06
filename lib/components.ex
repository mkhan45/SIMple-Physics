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

  def link_btn(url, text) do
    animation = if text != "In Progress" do
      "hover:scale-110 transition-all motion-reduce:transform-none"
    else
      ""
    end
    ~e"""
    <a class=
        "rounded-none bg-emerald-400 text-white font-semibold #{animation}" 
       href="#{url}"
    >
      #{text}
    </a>
    """
  end
end
