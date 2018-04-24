defmodule Forum.UserController do
  use Forum.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Forum.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Forum.User, id)
    render conn, "show.html", user: user
  end
end
