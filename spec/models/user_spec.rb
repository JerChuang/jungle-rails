require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be able to be created' do   #

      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password: '12345678', password_confirmation: '12345678'

      expect(@user).to be_valid
    end

    it 'should not be able to be created without a first_name' do   #

      @user = User.create last_name: 'Wilson', email: 'alice.wilson@test.com', password: '12345678', password_confirmation: '12345678'

      expect(@user).to_not be_valid
    end

    it 'should not be able to be created without a last_name' do   #

      @user = User.create first_name: 'Alice', email: 'alice.wilson@test.com', password: '12345678', password_confirmation: '12345678'

      expect(@user).to_not be_valid
    end

    it 'should not be able to be created without a e-mail' do   #

      @user = User.create first_name: 'Alice', last_name: 'Wilson', password: '12345678', password_confirmation: '12345678'

      expect(@user).to_not be_valid
    end

    it 'should not be able to be created without password' do   #

      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password_confirmation: '12345678'

      expect(@user).to_not be_valid
    end

    it 'should not be able to be created without password confirmation' do   #

      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password: '12345678'

      expect(@user).to_not be_valid
    end

    it 'should not be able to be created if password does not match password_confirmation' do   #

      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password: '12345678', password_confirmation: '123456789'

      expect(@user).to_not be_valid
    end

    it 'should not be able to be created if email is not Unique' do   #

      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.COM', password: '12345678', password_confirmation: '12345678'
      @user2 = User.create first_name: 'Alice', last_name: 'Wilson', email: 'ALICE.WILSON@TEST.com', password: '12345678', password_confirmation: '12345678'

      expect(@user2).to_not be_valid
    end

    it 'should not be able to be created if password is less than 8 characters' do   #

      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password: '1234567', password_confirmation: '1234567'

      expect(@user).to_not be_valid
    end

  end

  describe 'Associations' do
    it 'should have many reviews' do
      assc = described_class.reflect_on_association(:reviews)
      expect(assc.macro).to eq :has_many
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return user if authenticated with e-mail and password' do
      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password: '12345678', password_confirmation: '12345678'
      expect(@user).to eq User.authenticate_with_credentials('alice.wilson@test.com', '12345678')
    end
    it 'should return false if not authenticated with correct password' do
      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password: '12345678', password_confirmation: '12345678'
      expect(User.authenticate_with_credentials('alice.wilson@test.com', '1234567')).to eq false
    end
    it 'should return user if authenticated with e-mail with wrong case' do
      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password: '12345678', password_confirmation: '12345678'
      expect(User.authenticate_with_credentials('alice.WILson@test.com', '12345678')).to eq @user
    end
    it 'should return user if authenticated with e-mail with leading or trailing spaces' do
      @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password: '12345678', password_confirmation: '12345678'
      expect(User.authenticate_with_credentials('   alice.WILson@test.com       ', '12345678')).to eq @user
    end

    
  end


end

# create_table "users", force: :cascade do |t|
#   t.string   "first_name"
#   t.string   "last_name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end