PASSWORD = "123456"


positions_list = [
  {name: "manager", short_name: "MA"},
  {name: "leader", short_name: "LE"},
  {name: "programer", short_name: "PG"}
]

positions_list.each do |position|
  Position.create! position
end

project_users_list = [
  {project_id: 1, user_id: 1, leader_flag: true},
  {project_id: 1, user_id: 2, leader_flag: false},
  {project_id: 2, user_id: 3, leader_flag: true},
  {project_id: 2, user_id: 4, leader_flag: false}
]

project_users_list.each do |project_user|
  ProjectUser.create! project_user
end

skills_list = [
  {name: "Ruby"},
  {name: "PHP"}
]

skills_list.each do |skill|
  Skill.create! skill
end


teams_list = [
  {name: "Team 1"},
  {name: "Team 2"},
]

teams_list.each do |team|
  Team.create! team
end

user_skills_list = [
  {user_id: 1, skill_id: 1, level: 1, experience_year: 1},
  {user_id: 1, skill_id: 2, level: 2, experience_year: 2},
  {user_id: 2, skill_id: 1, level: 1, experience_year: 1},
  {user_id: 2, skill_id: 2, level: 2, experience_year: 2},
  {user_id: 3, skill_id: 1, level: 1, experience_year: 1},
  {user_id: 3, skill_id: 2, level: 2, experience_year: 2},
  {user_id: 4, skill_id: 1, level: 1, experience_year: 1},
  {user_id: 4, skill_id: 2, level: 2, experience_year: 2}
]

user_skills_list.each do |user_skill|
  UserSkill.create! user_skill
end

users_list = [
  {name: "Admin", position_id: 2,
    email: "admin@framgia.com",
    birthday: "01-01-2011",
    isAdmin: true,
    position_id: 1,
    team_id: 1,
    password: PASSWORD,
    password_confirmation: PASSWORD},
  {name: "Nguyen Van A", position_id: 3,
    email: "a@framgia.com", 
    birthday: "01-01-2010",
    isAdmin: false,
    position_id: 2,
    team_id: 1,
    password: PASSWORD,
    password_confirmation: PASSWORD},
  {name: "Nguyen Van B", position_id: 2,
    email: "b@framgia.com", 
    birthday: "01-02-2011",
    isAdmin: false,
    position_id: 3,
    team_id: 1,
    password: PASSWORD,
    password_confirmation: PASSWORD},
  {name: "Nguyen Van C", position_id: 3,
    email: "c@framgia.com", 
    birthday: "01-02-2010",
    isAdmin: false,
    position_id: 2,
    team_id: 2,
    password: PASSWORD,
    password_confirmation: PASSWORD},
]

users_list.each do |user|
  User.create! user
end

projects_list = [
  {name: "framgia os", short_name: "fos",
    start_date: "01-10-2013", end_date: "01-12-2013", team_id: 1},
  {name: "facebook app", short_name: "face",
    start_date: "01-07-2013", end_date: "01-12-2013", team_id: 1},
  {name: "ios promotion", short_name: "ios",
    start_date: "01-10-2013", end_date: "01-12-2013", team_id: 1},
  {name: "android game", short_name: "adg",
    start_date: "01-10-2013", end_date: "01-12-2013", team_id: 2}
]

projects_list.each do |project|
  Project.create! project
end
