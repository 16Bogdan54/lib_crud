class UsersQuery
  attr_accessor :full_name, :age, :sort

  def initialize(full_name = nil, age = nil, sort = nil)
    @full_name = full_name
    @age = age
    @sort = sort
  end

  def results_name
    users = User.all
    users = users.where("concat(name, ' ', surname) LIKE ?", "%#{full_name}%") if full_name.present?
    users = users.where(age: age) if age.present?
    if sort.present?
      direction = %w[asc desc].include?(sort) ? sort : 'asc'
      users = users.order(Arel.sql("concat(name, ' ', surname) #{direction}"))
    else
      users = users.order(created_at: :asc)
    end
    users
  end

end
