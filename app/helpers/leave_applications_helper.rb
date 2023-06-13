module LeaveApplicationsHelper
  def leave_application_buttons
    {
      "pending" => ["Approved", "Rejected"],
      "approved" => ["Pending", "Rejected"],
      "rejected" => ["Approved", "Pending"]
    }
  end
end
