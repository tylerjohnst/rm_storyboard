class PlayerDetailsViewController < UITableViewController
  extend IB

  outlet :nameTextField, UITextField

  attr_accessor :delegate

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    if indexPath.section.zero?
      nameTextField.becomeFirstResponder
    end
  end

  def done(sender)
    @delegate.create_player(nameTextField.text)
    @delegate.player_details_view_saved(self)
  end

  def cancel(sender)
    @delegate.player_details_view_cancelled(self)
  end
end