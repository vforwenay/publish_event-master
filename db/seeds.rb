unless User.all.exists?
	
	creator = FactoryBot.create(:user, email: 'test@publishevents.com')
	users = FactoryBot.create_list(:user, 15)
	locations = FactoryBot.create_list(:location, 5, creator: creator)
	events = FactoryBot.create_list(:event, 50, creator: creator, location: locations.sample)
	
	users.each do |user|
		FactoryBot.create(:invitation, event: events.sample, sender: creator, receiver: user, confirm: true, confirm_at: Time.now)

		FactoryBot.create(:invitation, event: events.sample, sender: user, receiver: creator, confirm: true, confirm_at: Time.now)
	end
end

puts 'Data Successfully created!'
puts '==============================='
puts 'Login with cred.'
puts 'test@publishevents.com'
puts 'password:'
puts '123456'

puts 'Thanks....................................'
