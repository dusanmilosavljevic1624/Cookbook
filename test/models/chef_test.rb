require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "Andrej", email: "andrej@test.com")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "chef name should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end

  test "email should be less than 105 characters" do
    @chef.email = "a" * 110
    assert_not @chef.valid?
  end

  test "email should be unique" do
    chef_copy = @chef.dup
    chef_copy.email = @chef.email.upcase
    @chef.save
    assert_not chef_copy.valid?
  end

  test "email validation should accept valid address" do
    valid_address = %w[user@eee.com R_TDD-DS@eee.lel.com user@example.com student.student@student.com]
    valid_address.each do |address|
      @chef.email = address
      assert @chef.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid address" do
    invalid_address = %w[test@example,net something_at_something.org foo@ba+r.com]
    invalid_address.each do |address|
      @chef.email = address
      assert_not @chef.valid?, "#{address.inspect} should be invalid"
    end
  end

end