import UIKit

class NotificationListViewModel: NSObject {
    let reusableIdentifier = "notificationTypes"
    fileprivate let data = NotificationType.allCases
    
    fileprivate func scheduleNotification(of type: NotificationType) {
        switch type {
        case .plainNotification:
            schedulePlainNotification()
        case .notificationWithAttachment,
             .actionableNotification,
             .backgoundNotification:
            print("Scheduling notification of type - \(type.rawValue)")
        }
    }
    
    private func schedulePlainNotification() {
        // TODO: Add custom message while asking for permissions
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
            guard granted else {
                print("User has not allowed Notification for this app")
                // Implement alert box which will navigate user to settings
                return
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Missing you!!"
            content.subtitle = "😍"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request  = UNNotificationRequest(identifier: "plain", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error {
                    print("Failed to schedule notification")
                }
            }
            
        }
    }
}

extension NotificationListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath)
        var listConfig = cell.defaultContentConfiguration()
        listConfig.text = data[indexPath.row].rawValue
        listConfig.image = UIImage(systemName: "greaterthan")
        cell.contentConfiguration = listConfig
        
        return cell
    }
}

extension NotificationListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = data[indexPath.row]
        scheduleNotification(of: type)
    }
}
