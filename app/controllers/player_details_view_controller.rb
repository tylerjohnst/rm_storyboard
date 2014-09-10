class PlayerDetailsViewController < UITableViewController
  extend IB
  include ChildViewHelpers

  outlet :nameTextField, UITextField
  outlet :gameNameLabel, UILabel

  # @return [PlayersViewController] the delegate class
  attr_accessor :delegate
  attr_accessor :game, :player

  def viewDidLoad
    super
    @game = @player.game
    nameTextField.text = @player.name || ''
    set_game_name_label
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    if indexPath.section.zero?
      nameTextField.becomeFirstResponder
      tableView.deselectRowAtIndexPath(indexPath, animated:false)
    end
  end

  def done(sender)
    update_player_properties
    delegate.save_player(@player, @player.new?)
    delegate.player_details_view_saved(self)
  end

  def cancel(sender)
    delegate.player_details_view_cancelled(self)
  end

  def select_game(game)
    @game = game
    set_game_name_label
  end

  def prepareForSegue(segue, sender:sender)
    if segue.identifier == 'PickGame'
      child_view = segue.destinationViewController
      child_view.delegate = self
      child_view.selected = @game
    end
  end

  private

  def update_player_properties
    @player.name = nameTextField.text
    @player.game = @game
    puts @player.inspect
  end

  def set_game_name_label
    gameNameLabel.text = @game
  end
end