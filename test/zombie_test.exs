defmodule ZombieTest do
  use ExUnit.Case
  doctest Zombie

  test "greets the world" do
    assert Zombie.hello() == :world
  end
end
