class UsersQuery
  attr_accessor :full_name, :age, :sort_name, :sort_age

  def initialize(full_name = nil, age = nil, sort_name = nil, sort_age = nil)
    @full_name = full_name
    @age = age
    @sort_name = sort_name
    @sort_age = sort_age
  end

  def results
    users = User.all

    users = users.where("concat(name, ' ', surname) LIKE ?", "%#{full_name}%") if full_name.present?
    users = users.where(age: age) if age.present?

    if sort_name.present?
      direction = %w[asc desc].include?(sort_name) ? sort_name : 'asc'
      users = users.order(Arel.sql("concat(name, ' ', surname) #{direction}"))
    else
      users = users.order(created_at: :asc)
    end

    if sort_age.present?
      direction = %w[asc desc].include?(sort_age) ? sort_age : 'asc'
      users = users.order(Arel.sql("concat(name, ' ', surname) #{direction}"))
    else
      users = users.order(created_at: :asc)
    end


    users
  end

end
