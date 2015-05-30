require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname: "Testchef", email:"jim@test.com")
    @recipe = @chef.recipes.build(name: "Spaghetii", summary: "A delicous dish", description: "Cook in water add some sauce and ketchup and stuff")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "name length should be less than 15" do
    @recipe.name = "a" * 20
    assert_not @recipe.valid?
  end

  test "name length should be longer than 5" do
    @recipe.name = "a" * 4
    assert_not @recipe.valid?
  end

  test "summary should be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end

  test "summary length should be less than 150" do
    @recipe.summary = "a" * 155
    assert_not @recipe.valid?
  end

  test "summary length should be longer than 10" do
    @recipe.summary = "a" * 7
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end

  test "description should be less than 500" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end

  test "description should be longer than 20" do
    @recipe.description = "a" * 15
    assert_not @recipe.valid?
  end
  
  test "recipe should have a chef" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

end