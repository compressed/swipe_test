class ListController < UITableViewController

  def viewDidLoad
    view.dataSource = view.delegate = self
    @items = []
    @items << Item.new({text:'testing 1 2 3'})

    # right
    recognizer = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:'handleSwipe:')
    self.view.addGestureRecognizer(recognizer)
    # left
    recognizer = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:'handleSwipe:')
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft
    self.view.addGestureRecognizer(recognizer)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @items.size
  end

  CELLID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CELLID)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell
    end

    item = @items[indexPath.row]
    cell.textLabel.text = item.text
    cell.accessibilityLabel = 'number 3'
    cell
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    item = @items[indexPath.row]
  end

  def handleSwipe(recognizer)
    locationInView = recognizer.locationInView(self.view)
    indexPath = self.tableView.indexPathForRowAtPoint(locationInView)

    if indexPath
      cell = self.tableView.cellForRowAtIndexPath(indexPath)
      new_view = UIView.alloc.initWithFrame(cell.frame)
      new_view.backgroundColor = UIColor.redColor
      new_view.accessibilityLabel = 'new view'
      cell.contentView.addSubview(new_view)
    end
  end
end
