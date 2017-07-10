require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is a thing' do
     expect{User.new}.to_not raise_error
   end

   it 'has name and email' do
     user = User.new
     user.fullname = 'Bill Nye'
     user.email = 'BillNye@scienceGuy.com'
     user.save
     u2 = User.find_by_fullname('Bill Nye')
     expect(u2.fullname).to eq 'Bill Nye'
     expect(u2.email).to eq 'BillNye@scienceGuy.com'
   end
end
