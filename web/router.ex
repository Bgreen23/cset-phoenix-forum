defmodule Forum.Router do
  use Forum.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Forum.Auth, repo: Forum.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Forum do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users",    UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end
end
