defmodule FitculinaireWeb.MenuLive do
  use FitculinaireWeb, :live_view

  def build_url(hash), do: "https://www.gravatar.com/avatar/#{hash}?s=40&d=default"

  def mount(_params, _session, socket) do
    IO.inspect(socket.assigns)

    # socket =
    #   assign(socket,
    #     gravatar:
    #       :crypto.hash(:md5, socket.assigns.current_user.email)
    #       |> Base.encode16()
    #       |> String.downcase()
    #       |> build_url
    #   )

    IO.inspect(socket.assigns)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="navbar bg-base-100">
      <div class="navbar-start">
        <div class="dropdown">
          <label tabindex="0" class="btn btn-ghost lg:hidden">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-5 w-5"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M4 6h16M4 12h8m-8 6h16"
              />
            </svg>
          </label>
          <.live_component
            module={FitculinaireWeb.MenuComponent}
            id={0}
            classes="menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-52"
          />
        </div>
        <.link href={~p"/app"} aria-current="page" class="w-inline-block w--current">
          <div class="logo">
            <img
              src="https://cdn.lindoai.com/c/rec8y2k2EIPrlFzEB/images/logo-full-256x.png"
              alt="{_product_name}"
              class="logo-transparent pt-2"
            />
          </div>
        </.link>
      </div>
      <div class="navbar-center hidden lg:flex">
        <ul class={@classes}>
          <li><.link href={~p"/recipes"}>Recettes</.link></li>
          <li tabindex="0">
            <.link href={~p"/"}>
              Programmes
              <svg
                class="fill-current"
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                viewBox="0 0 24 24"
              >
                <path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" />
              </svg>
            </.link>
            <ul class="p-2">
              <li><a>Musuclation</a></li>
              <li><a>Cardio</a></li>
            </ul>
          </li>
          <li><.link href="/pantry">Garde-manger</.link></li>
        </ul>
      </div>
      <div class="navbar-end">
        <div class="dropdown dropdown-end">
          <label tabindex="0" class="btn btn-ghost btn-circle ">
            <div class="w-10 rounded-full overflow-hidden">
              <%!-- <img src={@gravatar} /> --%>
            </div>
          </label>
          <ul
            tabindex="0"
            class="menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-52"
          >
            <li>
              <.link href={~p"/users/settings"}>
                Settings
              </.link>
            </li>
            <li>
              <.link href={~p"/users/log_out"} method="delete">
                Log out
              </.link>
            </li>
          </ul>
        </div>
      </div>
    </div>
    """
  end
end
