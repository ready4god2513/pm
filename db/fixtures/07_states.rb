# Generated at 2013-03-19 20:56:43 -0700 with
#   /Users/brandon/.rvm/gems/ruby-1.9.3-p392@global/bin/rake seeder model=State

# =============== State 1 ===============

State.seed(:id) do |s|
  s.id = 1
  s.team_id = 1
  s.sort_order = 5
  s.name = "accepted"
  s.slug = "accepted"
  s.hidden = false
  s.created_at = "2013-03-20 03:15:25 UTC"
  s.updated_at = "2013-03-20 03:15:25 UTC"
end

# =============== State 2 ===============

State.seed(:id) do |s|
  s.id = 2
  s.team_id = 1
  s.sort_order = 4
  s.name = "delivered"
  s.slug = "delivered"
  s.hidden = false
  s.created_at = "2013-03-20 03:15:31 UTC"
  s.updated_at = "2013-03-20 03:15:31 UTC"
end

# =============== State 3 ===============

State.seed(:id) do |s|
  s.id = 3
  s.team_id = 1
  s.sort_order = 1
  s.name = "unstarted"
  s.slug = "unstarted"
  s.hidden = false
  s.created_at = "2013-03-20 03:15:32 UTC"
  s.updated_at = "2013-03-20 03:15:32 UTC"
end

# =============== State 4 ===============

State.seed(:id) do |s|
  s.id = 4
  s.team_id = 1
  s.sort_order = 2
  s.name = "started"
  s.slug = "started"
  s.hidden = false
  s.created_at = "2013-03-20 03:15:33 UTC"
  s.updated_at = "2013-03-20 03:15:33 UTC"
end

# =============== State 5 ===============

State.seed(:id) do |s|
  s.id = 5
  s.team_id = 1
  s.sort_order = 3
  s.name = "finished"
  s.slug = "finished"
  s.hidden = false
  s.created_at = "2013-03-20 03:27:25 UTC"
  s.updated_at = "2013-03-20 03:27:25 UTC"
end

# =============== State 6 ===============

State.seed(:id) do |s|
  s.id = 6
  s.team_id = 1
  s.sort_order = 0
  s.name = "rejected"
  s.slug = "rejected"
  s.hidden = false
  s.created_at = "2013-03-20 03:44:07 UTC"
  s.updated_at = "2013-03-20 03:44:07 UTC"
end

