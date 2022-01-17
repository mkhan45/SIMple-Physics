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

  def simulator_card(name, url, icon, description) do
      ~e"""
        <a href="#{url}" class="px-3 max-w-xs">
          <h3 class="text-lg font-semibold text-center underline decoration-emerald-400 decoration-2"> #{name} </h3>
          <div class="mb-1"> #{sim_icon(icon)} </div>
          <hr class="border-emerald-400 border-2 mx-auto mb-1"/>
          <p> #{description} </p>
        </a>
      """
  end

  def sim_icon(sim, accent \\ "#000000")

  def sim_icon(:mechanics, accent) do
      ~e"""
      <svg class="mx-auto" width=10em height=5em viewBox="-50 -50 100 50">
        <%= for y <- 0..-4 do %>
          <%= for x <- -(-4-y)..(-4-y) do %>
            <% color = if x == -3 || x == 3 || y == -4, do: "#{accent}", else: "#000000" %>
            <%= color %>
            <rect x="<%= 9 * x %>" y="<%= 9 * y %>" width="8" height="8" 
                  stroke="none" fill="<%= color %>"/>
          <% end %>
        <% end %>
      </svg>
      """ 
      |> EEx.eval_string()
  end

  def sim_icon(:gravity, accent) do
      ~e"""
      <svg class="mx-auto" width=10em height=5em viewBox="-50 -50 100 60">
        <circle r="7.5%" stroke="black"/>
        <%# Not sure why up to 15 is needed %>
        <%= for i <- 1..15 do %>
          <% start_x = Math.cos((i - 1) / 10) * 40 %>
          <% start_y = Math.sin((i - 1) / 10) * -40 %>
          <% end_x = Math.cos(i / 10) * 40 %>
          <% end_y = Math.sin(i / 10) * -40 %>
          <% width = (15 - i) / 15 * 0.75 + 0.15 %>
          <path 
             d="M<%=start_x%>,<%=start_y%> A40,40 0 0 1 <%=end_x%>,<%=end_y%>" 
             stroke-width="<%= width %>%" stroke="#{accent}" fill="none"
          />
          <circle cx="40%" r="2%" stroke="#000" fill="#000"/>
        <% end %>
      </svg>
      """
      |> EEx.eval_string()
  end

  def post_video(url) do
    ~e"""
    <div>
        <video controls loop>
            <source src="#{Generator.base_url}/static/video/#{url}" type="video/webm"/>
        </video>
    </div>
    """
  end
end
