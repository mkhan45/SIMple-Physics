defmodule Router do
  use Plug.Router
  require Math

  plug Plug.Static, at: "/static", from: "public/static"

  plug(:match)
  plug(:dispatch)

  def render(template, args \\ []) do
    defaults = [
      base_url: Generator.base_url(), 
      icons: Icons.icons(), 
      render: fn(template) -> render(template) end,
      render_args: fn(template, args) -> render(template, args) end,
      components: Components,
      sigil_e: fn(s, _opts) -> s end,
    ]

    args = Keyword.merge(defaults, args)
    EEx.eval_file(template, args)
  end

  get "" do
    templated = render("templates/index.html.eex")
    send_resp(conn, 200, templated)
  end

  get "/labs" do
    templated = render(
      "templates/post_list.html.eex",
      post_type: "Lab",
      path: "lab",
      posts: Post.get_labs(),
      category: "All",
      list_path: "labs"
    )
    send_resp(conn, 200, templated)
  end

  get "/labs/:category" do
    category = String.replace_suffix(category, ".html", "")
    is_page_category = fn lab -> 
      lab_categories = Post.categories(lab)
      Enum.member?(lab_categories, category)
    end

    labs = Post.get_labs() |> Stream.filter(is_page_category)

    templated = render(
      "templates/post_list.html.eex",
      post_type: "Lab",
      posts: labs,
      category: category,
      path: "lab",
      list_path: "labs"
    )

    send_resp(conn, 200, templated)
  end

  get "/lab/:lab" do
    lab = Post.read_post("content/labs/#{lab}.md")
    templated = render("templates/post.html.eex", post: lab, list_path: "labs")

    send_resp(conn, 200, templated)
  end

  get "/tutorials" do
    templated = render(
      "templates/post_list.html.eex",
      posts: Post.get_tutorials(),
      category: "All",
      path: "tutorial",
      list_path: "tutorials",
      post_type: "Tutorial"
    )
    send_resp(conn, 200, templated)
  end

  get "/tutorials/:category" do
    category = String.replace_suffix(category, ".html", "")
    is_page_category = fn lab -> 
      lab_categories = Post.categories(lab)
      Enum.member?(lab_categories, category)
    end

    tutorials = Post.get_tutorials() |> Stream.filter(is_page_category)

    templated = render(
      "templates/post_list.html.eex",
      posts: tutorials,
      category: category,
      path: "tutorial",
      list_path: "tutorials",
      post_type: "Tutorial"
    )

    send_resp(conn, 200, templated)
  end

  get "tutorial/:tutorial" do
    tutorial = Post.read_post("content/tutorials/#{tutorial}.md")
    templated = render("templates/post.html.eex", post: tutorial, list_path: "tutorials")

    send_resp(conn, 200, templated)
  end

  get "/in_progress" do
    send_resp(conn, 200, "This page is in progress")
  end

  match _ do
    send_resp(conn, 404, "404")
  end
end
