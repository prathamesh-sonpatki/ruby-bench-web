require 'test_helper'

class BenchmarkTypeTest < ActiveSupport::TestCase
  test "#latest_benchmark_run" do
    benchmark_run = create(:release_benchmark_run)
    benchmark_run2 = create(:release_benchmark_run, created_at: Time.zone.now - 1.day)

    benchmark_type = create(:benchmark_type, benchmark_runs: [
      benchmark_run, benchmark_run2
    ])

    assert_equal benchmark_run, benchmark_type.latest_benchmark_run('Release')
  end
end
