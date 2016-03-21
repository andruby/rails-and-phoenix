defmodule Talks.RoomChannel do
  use Talks.Web, :channel

  def join("rooms:lobby", payload, socket) do
    {:ok, socket}
  end
end
