defmodule LiveDemoWeb.PageController do
  use LiveDemoWeb, :controller

  def index(conn, _params) do
    live_render(conn, LiveDemoWeb.PageView, session: %{})
  end
end
