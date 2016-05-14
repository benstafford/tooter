class CreateTootUseCase
  def self.run(user, params)
    toot = user.toots.build(params)
    if toot.save
      mentioned_users(toot).each do |mentioned_user|
        mentioned_user.mentions.create(toot: toot)
      end
    end
    toot
  end

  private

  def self.mentioned_users(toot)
    matches = toot.body.scan(/@(\w*)/).flatten

    matches.map do |match|
      User.find_by(username: match)
    end.compact
  end
end
