defmodule Components do
  # for syntax highlighting
  def sigil_e(s, _opts), do: s

  def nav_link(url, inner) do
    ~e"""
    <a href="#{url}" class="font-semibold">
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

  def desc_card(name, contents) do
    ~e"""
        <div>
          <h2 class="font-semibold text-lg">#{name}</h2>
          <p>#{contents}</p>
        </div>
    """
  end

  def ul_link(url, title) do
    ~e"""
        <a class="hover:underline decoration-2 decoration-emerald-400 
                  border-l-2 border-emerald-400 pl-1.5" href="#{url}">
          #{title}
        </a>
    """
  end
end
