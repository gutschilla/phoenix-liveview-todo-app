defmodule LiveDemoWeb.PageView do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <h1>TODO</h1>
    <div class="container">
      <%= for {item, index} <- Enum.with_index(@items) do %>
        <div class="row">
            <input
              type="text"
              value="<%= item %>"
              phx-keyup="update_item"
              phx-focus="set_focus" phx-value="<%= index %>"
            />
            <button phx-click="remove" value="<%= index %>" > X </button>
        </div>
      <% end %>
    </div>
    <div class="container">
      <input
        type="text"
        id="new_item"
        phx-keyup="change_new_item"
        value="<%= @new_item %>"
      />
      <button phx-click="add">
        add item (<%= @new_item %>)
      </button>
    </div>
    <hr/>
    <ul>
      <%= for item <- @items do %><li><%= item %><% end %>
    </ul>
    """
  end

  def mount(_session, socket) do
    # if connected?(socket), do: Process.send_after(self(), :tick, 1000)
    init_values = [
      items: ["foo", "bar", "baz"],
      new_item: "new item",
      focus: nil,
    ]
    {:ok, assign(socket, init_values)}
  end

  def handle_event("add", _, socket) do
    new_item = socket.assigns.new_item
  {:noreply, update(socket, :items, fn list -> [new_item | list] end)}
  end

  def handle_event("remove", index_str, socket) do
    {index, _} = Integer.parse(index_str)
    {:noreply, update(socket, :items, fn list -> List.delete_at(list, index) end)}
  end

  def handle_event("change_new_item", value, socket) do
    {:noreply, update(socket, :new_item, fn _ -> value end)}
  end

  def handle_event("set_focus", index_str, socket) do
    {index, _} = Integer.parse(index_str)
    {:noreply, update(socket, :focus, fn _ -> index end)}
  end

  def handle_event("update_item", value, socket) do
    index = socket.assigns.focus
    {:noreply, update(socket, :items, fn list -> List.replace_at(list, index, value) end)}
  end

end
