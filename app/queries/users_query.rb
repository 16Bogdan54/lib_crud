class UsersQuery
  attr_accessor :search, :sort

  def initialize(search = nil, sort = nil)
    @search = search
    @sort = sort
  end

  def results_name
    users = User.all
    users = users.where("concat(name, ' ', surname) LIKE ?", "%#{search}%") if search.present?
    if sort.present?
      direction = %w[asc desc].include?(sort) ? sort : 'asc'
      users = users.order(Arel.sql("concat(name, ' ', surname) #{direction}"))
    else
      users = users.order(created_at: :asc)
    end
    users
  end

end
