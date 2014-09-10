class GamePickerViewController < UITableViewController

  attr_accessor :selected, :delegate

  def viewDidLoad
    super
    @games = Player::GAMES
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @games.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    game = game(indexPath)
    tableView.dequeueReusableCellWithIdentifier('GameCell').tap do |cell|
      cell.textLabel.text = game
      @selected == game ? check_row(cell) : uncheck_row(cell)
    end
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    uncheck_row find_active_cell(tableView) unless @selected.nil?
    @selected = game(indexPath)
    check_row find_active_cell(tableView)
  end

  def game(indexPath)
    @games[indexPath.row]
  end

  private

  def find_active_cell(tableView)
    indexPath = NSIndexPath.indexPathForRow(@games.index(@selected), inSection: 0)
    tableView.cellForRowAtIndexPath indexPath
  end

  def check_row(cell)
    cell.accessoryType = UITableViewCellAccessoryCheckmark
  end

  def uncheck_row(cell)
    cell.accessoryType = UITableViewCellAccessoryNone
  end
end