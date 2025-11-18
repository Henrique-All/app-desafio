user1 = User.find_or_create_by(email: 'john@example.com') do |u|
  u.name = 'John Doe'
end

user2 = User.find_or_create_by(email: 'jane@example.com') do |u|
  u.name = 'Jane Smith'
end

purposes = Consent::PURPOSES

User.all.each do |user|
  purposes.each do |purpose|
    Consent.find_or_create_by(user: user, purpose: purpose) do |c|
      c.granted = false
    end
  end
end

puts "Usuários: #{User.count}, Consentimentos: #{Consent.count}"