module TriggerCProgram
  extend ActiveSupport::Concern

  included do
    after_save :trigger_c_program
  end

  private

  def trigger_c_program
    # Path to your C binary
    c_binary_path = 'c/program/all_solved_tree_record_ids'

    # Check if the binary file exists and is executable
    if File.exist?(c_binary_path) && File.executable?(c_binary_path)
      # Execute the C binary
      system(c_binary_path)
    else
      Rails.logger.error "Failed to execute C binary: #{c_binary_path} does not exist or is not executable."
    end
  end
end
