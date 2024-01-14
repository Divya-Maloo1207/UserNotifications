import UIKit

class NotificationListViewModel: NSObject, UITableViewDataSource {
    let reusableIdentifier = "notificationTypes"
    private let data = NotificationType.allCases
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath)
        var listConfig = cell.defaultContentConfiguration()
        listConfig.text = data[indexPath.row].rawValue
        cell.contentConfiguration = listConfig
        
        return cell
    }
}
