defmodule Forum.UserView do
  use Forum.Web, :view
  alias Forum.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
