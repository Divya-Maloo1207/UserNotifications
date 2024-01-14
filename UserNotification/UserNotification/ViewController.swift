import UIKit

class ViewController: UIViewController {
    
    private let tableViewModel = NotificationListViewModel()
    
    private var tableView: UITableView = {
        UITableView(frame: .zero)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        configureView()
        configureConstraints()
    }
    
    private func configureView() {
        tableView.dataSource = tableViewModel
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewModel.reusableIdentifier)
        view.addSubview(tableView)
    }
    
    private func configureConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}

