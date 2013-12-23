PASSWORD = "123456"

admins_list = [
  {email: "tuan@framgia.com", password: PASSWORD, password_confirmation: PASSWORD},
  {email: "tuanlq@framgia.com", password: PASSWORD, password_confirmation: PASSWORD},
  {email: "thainh@framgia.com", password: PASSWORD, password_confirmation: PASSWORD}
]

admins_list.each do |admin|
  Admin.create! admin
end

positions_list = [
  {name: "manager", abbreviation: "MA"},
  {name: "leader", abbreviation: "LE"},
  {name: "programer", abbreviation: "PG"}
]

positions_list.each do |position|
  Position.create! position
end

project_members_list = [
  {project_id: 1, user_id: 1, leader_project_flag: true},
  {project_id: 1, user_id: 2},
  {project_id: 2, user_id: 3, leader_project_flag: true},
  {project_id: 2, user_id: 4}
]

project_members_list.each do |project_member|
  ProjectMember.create! project_member
end

skills_list = [
  {name: "Ruby"},
  {name: "PHP"}
]

skills_list.each do |skill|
  Skill.create! skill
end

team_members_list = [
  {user_id: 1, team_id: 1},
  {user_id: 2, team_id: 1},
  {user_id: 3, team_id: 2},
  {user_id: 4, team_id: 2}
]

team_members_list.each do |team_member|
  TeamMember.create! team_member
end

teams_list = [
  {name: "Team 1", leader_id: 1},
  {name: "Team 2", leader_id: 3},
]

teams_list.each do |team|
  Team.create! team
end

user_skills_list = [
  {user_id: 1, skill_id: 1, level: 1},
  {user_id: 1, skill_id: 2, level: 2},
  {user_id: 2, skill_id: 1, level: 1},
  {user_id: 2, skill_id: 2, level: 2},
  {user_id: 3, skill_id: 1, level: 1},
  {user_id: 3, skill_id: 2, level: 2},
  {user_id: 4, skill_id: 1, level: 1},
  {user_id: 4, skill_id: 2, level: 2}
]

user_skills_list.each do |user_skill|
  UserSkill.create! user_skill
end

users_list = [
  {name: "Nguyen Van A", position_id: 2,
    email: "a@framgia.com", password: PASSWORD,
    password_confirmation: PASSWORD},
  {name: "Nguyen Van B", position_id: 3,
    email: "b@framgia.com", password: PASSWORD,
    password_confirmation: PASSWORD},
  {name: "Nguyen Van C", position_id: 2,
    email: "c@framgia.com", password: PASSWORD,
    password_confirmation: PASSWORD},
  {name: "Nguyen Van D", position_id: 3,
    email: "d@framgia.com", password: PASSWORD,
    password_confirmation: PASSWORD},
]

users_list.each do |user|
  User.create! user
end

projects_list = [
  {name: "framgia os", abbreviation: "fos",
    start_date: "01-10-2013", end_date: "01-12-2013", team_id: 1},
  {name: "facebook app", abbreviation: "face",
    start_date: "01-07-2013", end_date: "01-12-2013", team_id: 1},
  {name: "ios promotion", abbreviation: "ios",
    start_date: "01-10-2013", end_date: "01-12-2013", team_id: 1},
  {name: "android game", abbreviation: "adg",
    start_date: "01-10-2013", end_date: "01-12-2013", team_id: 2}
]

projects_list.each do |project|
  Project.create! project
end
