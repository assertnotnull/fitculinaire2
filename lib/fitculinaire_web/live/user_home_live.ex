defmodule FitculinaireWeb.UserHomeLive do
  use FitculinaireWeb, :live_view

  # alias Fitculinaire.Accounts

  def build_url(hash), do: "https://www.gravatar.com/avatar/#{hash}?s=40&d=default"

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        gravatar:
          :crypto.hash(:md5, socket.assigns.current_user.email)
          |> Base.encode16()
          |> String.downcase()
          |> build_url
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>User home page</div>
    """
  end
end
