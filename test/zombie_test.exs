defmodule ZombieTest do
  use ExUnit.Case
  require Zombie

  test "zombie" do
    File.rm_rf(".iex_state")
    son = %{name: "Mujju", age: 3, likes: [:legos, "greenery", :slides]}
    Zombie.bury(binding())
    Zombie.resurrect()
    assert Zombie.Vars.son() == son
  end
end
