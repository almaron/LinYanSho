if params[:short]
  json.(@char, :id, :name, :group_id, :status_id)
  json.profile_attributes do
    json.season_id @char.profile.season_id
    json.birth_date @char.profile.birth_date
  end
else
  json.(@char, :id, :name, :status_line, :status_id, :open_player)
  json.avatar image_tag(@char.avatar_url(:thumb)) if @char.avatar?
  json.avatar? @char.avatar?
  json.profile do
    json.(@char.profile, :real_age, :birth_date, :place, :beast, :person, :points, :phisics, :look,:bio, :character, :items, :other, :comment)
  end
  json.group do
    json.id @char.group_id
    json.name I18n.t("char_groups.names.#{@char.group.name}")
  end

  if (@char.open_player && @char.open_player > 0) || (current_user && (current_user.is_in? :admin || @char.owned_by == current_user))
    json.owner { json.(@char.owned_by, :id, :name) }
  end

  json.roles @char.char_roles do |char_role|
    json.(char_role, :role_id, :points)
    json.head char_role.role.head
    json.role_skills char_role.role_skills do |skill|
      json.done skill.done
      json.skill_name skill.skill.name
    end
  end

  json.userEditable @char.owned_by == current_user
  json.adminEditable current_user && current_user.is_in?([:admin, :master])

end

json.phisic_skills @char.phisic_skills do |skill|
  json.id skill.id
  json.skill_id skill.skill_id
  json.level_id skill.level_id
  json.skill_name skill.skill.name
  json.level_name skill.level.name
end

json.magic_skills @char.magic_skills do |skill|
  json.id skill.id
  json.skill_id skill.skill_id
  json.level_id skill.level_id
  json.skill_name skill.skill.name
  json.level_name skill.level.name
end