FactoryBot.define do
  factory(:group) do
    name {'Something Cool'}
  end
end


FactoryBot.define do
  factory(:user) do
    user_name {'Jimmy Newtrieeeno'}
  end
end

FactoryBot.define do
  user = FactoryBot.create(:user)
  group = FactoryBot.create(:group)
  factory(:message) do
    title{'Super Duper Thesis'}
    content {'Heeeeeey there. This is my thesis. OKAY?'}
    user_id {user.id}
    group_id {group.id}
  end
end
