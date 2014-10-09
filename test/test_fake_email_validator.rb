require 'minitest_helper'

class TestFakeEmailValidator < MiniTest::Unit::TestCase

  @@user_class = Class.new do
    include ActiveModel::Validations

    attr_accessor :email

    validates :email, fake_email: true
  end

  def setup
    @user = @@user_class.new
  end

  def test_incorrect_email
    @user.email = 'test@b@d.com'

    assert !@user.valid?
    assert_equal 'is invalid format', @user.errors[:email].first
  end

  def test_fake_email
    @user.email = 'test@mailinator.com'

    assert !@user.valid?
    assert_equal 'is fake domain', @user.errors[:email].first
  end

  def test_fake_email_with_third_sub_domain
    @user.email = 'test@gsrv.co.uk'

    assert !@user.valid?
    assert_equal 'is fake domain', @user.errors[:email].first
  end

  def test_fake_email_with_fake_sub_domain
    @user.email = 'test@a.10mail.org'

    assert !@user.valid?
    assert_equal 'is fake domain', @user.errors[:email].first
  end

  def test_real_email_1
    @user.email = 'test@gmail.com'

    assert @user.valid?
  end

  def test_real_email_with_third_sub_domain
    @user.email = 'test@mail.co.uk'

    assert @user.valid?
  end

end
