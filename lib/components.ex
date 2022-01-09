defmodule Components do
  # for syntax highlighting
  def sigil_e(s, _opts), do: s

  def nav_link(url, inner) do
    ~e"""
    <a href="#{url}" class="text-base font-semibold">
      #{inner}
    </a>
    """
  end

  def link_btn(url, text, enabled \\ true) do
    animation = if enabled do
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
          <h2 class="text-center md:text-left font-semibold text-lg">#{name}</h2>
          <p class="max-w-xs">#{contents}</p>
        </div>
    """
  end

  def ul_link(url, title) do
    ~e"""
        <a class="decoration-2 decoration-emerald-400 transition-all duration-75
                  md:hover:border-l-4 md:border-l-2 border-emerald-400 pl-1.5
                  underline underline-offset-2 decoration-4 decoration-emerald-400
                  md:no-underline"
           href="#{url}">
          #{title}
        </a>
    """
  end

  def category_list(title \\ "Categories", path) do
    ~e"""
      <div class="mx-auto md:ml-6 md:max-w-xs">
        <h2 class="md:mt-14 text-xl font-semibold text-center md:text-left hidden md:inline-block"> #{title} </h2>
        <ul class="mx-auto flex flex-row md:flex-col gap-x-2 justify-center">
          <li class="mb-1">#{ ul_link("#{Generator.base_url()}/#{path}.html", "All") }</li>
          <li class="mb-1">#{ ul_link("#{Generator.base_url()}/#{path}/Gravity.html", "Gravity") }</li>
          <li class="mb-1">#{ ul_link("#{Generator.base_url()}/#{path}/Mechanics.html", "Mechanics") }</li>
        </ul>
    </div>
    """
  end
end
