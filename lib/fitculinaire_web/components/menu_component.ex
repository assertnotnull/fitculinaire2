defmodule FitculinaireWeb.MenuComponent do
  use FitculinaireWeb, :live_component

  def render(assigns) do
    ~H"""
    <ul class={@classes}>
      <li><a>Recettes</a></li>
      <li tabindex="0">
        <a>
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
        </a>
        <ul class="p-2">
          <li><a>Submenu 1</a></li>
          <li><a>Submenu 2</a></li>
        </ul>
      </li>
      <li><a>Garde-manger</a></li>
    </ul>
    """
  end
end
