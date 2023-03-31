defmodule FitculinaireWeb.UserHomeLive do
  use FitculinaireWeb, :live_view

  # alias Fitculinaire.Accounts

  def mount(_params, _session, socket) do
    # socket = assign(socket, key: value)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>User home page</div>
    """
  end
end
