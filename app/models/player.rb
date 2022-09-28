require 'elasticsearch/model'

class Player < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :team

  mapping do
    indexes :name, type: :text
    indexes :age, type: :integer
    indexes :country, type: :text
  end

  def as_indexed_json(options = {})
    self.as_json(only: [:name, :age, :country],
                 include: {
                   team: { only: [:id, :name] }
                 })
  end

  class << self
    def custom_search(query)
      __elasticsearch__.search(query)
    end

    # def multi_match_search(query)
    #   {
    #     multi_match: {
    #       query: query,
    #       type: "best_fields",
    #       fields: %w[name^4 age^1 country^2 teams.name^3],
    #       operator: "and"
    #     }
    #   }
    # end
  end
end
