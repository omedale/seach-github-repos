require 'test_helper'

class SearchRepositoriesTest < ActiveSupport::TestCase
  def test_valid_search_repositories
    result = Github::SearchRepositories.new({ q: 'test' }, 20).call
    assert result.success?
  end

  def test_invalid_search_repositories
    result = Github::SearchRepositories.new({ q: nil }, 20).call
    assert !result.success?
  end
end
