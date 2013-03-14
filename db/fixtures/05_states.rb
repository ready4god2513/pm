# Generated at 2013-03-14 14:06:49 -0700 with
#   /Users/brandon/.rvm/gems/ruby-1.9.3-p392@global/bin/rake seeder model=State

# =============== State 3 ===============

State.seed(:id) do |s|
  s.id = 3
  s.team_id = 1
  s.sort_order = 0
  s.name = "unstarted"
  s.slug = "unstarted"
  s.hidden = false
  s.created_at = "2013-03-14 18:19:57 UTC"
  s.updated_at = "2013-03-14 18:19:57 UTC"
end

# =============== State 7 ===============

State.seed(:id) do |s|
  s.id = 7
  s.team_id = 1
  s.sort_order = 1
  s.name = "rejected"
  s.slug = "rejected"
  s.hidden = false
  s.created_at = "2013-03-14 18:30:31 UTC"
  s.updated_at = "2013-03-14 18:30:31 UTC"
end

# =============== State 4 ===============

State.seed(:id) do |s|
  s.id = 4
  s.team_id = 1
  s.sort_order = 2
  s.name = "started"
  s.slug = "started"
  s.hidden = false
  s.created_at = "2013-03-14 18:19:57 UTC"
  s.updated_at = "2013-03-14 18:19:57 UTC"
end

# =============== State 6 ===============

State.seed(:id) do |s|
  s.id = 6
  s.team_id = 1
  s.sort_order = 3
  s.name = "finished"
  s.slug = "finished"
  s.hidden = false
  s.created_at = "2013-03-14 18:22:49 UTC"
  s.updated_at = "2013-03-14 18:22:49 UTC"
end

# =============== State 2 ===============

State.seed(:id) do |s|
  s.id = 2
  s.team_id = 1
  s.sort_order = 4
  s.name = "delivered"
  s.slug = "delivered"
  s.hidden = false
  s.created_at = "2013-03-14 18:19:57 UTC"
  s.updated_at = "2013-03-14 18:19:57 UTC"
end

# =============== State 1 ===============

State.seed(:id) do |s|
  s.id = 1
  s.team_id = 1
  s.sort_order = 5
  s.name = "accepted"
  s.slug = "accepted"
  s.hidden = false
  s.created_at = "2013-03-14 18:19:26 UTC"
  s.updated_at = "2013-03-14 18:19:26 UTC"
end

# =============== State 5 ===============

State.seed(:id) do |s|
  s.id = 5
  s.team_id = 1
  s.sort_order = 5
  s.name = "unscheduled"
  s.slug = "unscheduled"
  s.hidden = true
  s.created_at = "2013-03-14 18:20:00 UTC"
  s.updated_at = "2013-03-14 18:20:00 UTC"
end