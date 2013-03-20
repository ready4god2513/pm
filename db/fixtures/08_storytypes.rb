# Generated at 2013-03-20 16:55:49 -0700 with
#   /Users/brandon/.rvm/gems/ruby-1.9.3-p392@global/bin/rake seeder model=StoryType

# =============== StoryType 1 ===============

StoryType.seed(:id) do |s|
  s.id = 1
  s.team_id = 1
  s.name = "chore"
  s.slug = "chore"
  s.hidden = false
  s.sort_order = 2
  s.created_at = "2013-03-20 03:15:24 UTC"
  s.updated_at = "2013-03-20 03:15:24 UTC"
end

# =============== StoryType 2 ===============

StoryType.seed(:id) do |s|
  s.id = 2
  s.team_id = 1
  s.name = "feature"
  s.slug = "feature"
  s.hidden = false
  s.sort_order = 3
  s.created_at = "2013-03-20 03:15:25 UTC"
  s.updated_at = "2013-03-20 03:15:25 UTC"
end

# =============== StoryType 3 ===============

StoryType.seed(:id) do |s|
  s.id = 3
  s.team_id = 1
  s.name = "release"
  s.slug = "release"
  s.hidden = true
  s.sort_order = nil
  s.created_at = "2013-03-20 03:15:30 UTC"
  s.updated_at = "2013-03-20 03:15:30 UTC"
end

# =============== StoryType 4 ===============

StoryType.seed(:id) do |s|
  s.id = 4
  s.team_id = 1
  s.name = "bug"
  s.slug = "bug"
  s.hidden = false
  s.sort_order = 1
  s.created_at = "2013-03-20 03:16:17 UTC"
  s.updated_at = "2013-03-20 03:16:17 UTC"
end

