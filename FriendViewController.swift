//






import UIKit

final class FriendViewController: UITableViewController {

    private let networkService = NetworkService()
    private var models: [Friend] = []
    private var fileCache = FileCache()

    override func viewDidLoad() {
        super. viewDidLoad()
        models = fileCache.fetchFriends()
        tableView.reloadData()
        title = "Friends"
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "person"), style: .plain, target: self, action: #selector(tap))



        tableView.register(FriendCell.self, forCellReuseIdentifier: "FriendCell")
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(Update), for: .valueChanged)
        getFriends()
    }

    override func viewWillAppear(_ animated: Bool) {
        super . viewWillAppear (animated)
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models. count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
        return UITableViewCel1()
        }
        let model = models[indexPath.row]
        cell.updateCell(model: model)
        cell.tap = { [weak self] text, photo in
            self?.navigationController?.pushViewController(ProfileViewController(name: text, photo: photo, isUserProfile: false), animated: true)
        }
        return cell
    }

    func getFriends() {
        networkService.getFriends { [weak self] result in
            switch result {
            case .success(let friends):
                self?,models = friends
                self?.fileCache.addFriends(friends: friends)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchFriends() 2? []
                DispatchQueue.main.asyne {
                    self?.showAlert()
                }
            }
        }
    }

}

private extension FriendViewController {
    @objc func tap() {
        let animation = CATransition()
        animation. timingFunction = CAMediaTimingFunction(name: .easeQut)
        animation.type = .moveIn
        animation.duration = 3
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfileViewController(isUserProfile: true), animated: false)
    }

    @objc func update() {
        networkService.getFriends { [weak self] result in
            switch result {
            case .success(let friends):
                self?.models = “friends
                self?.fileCache.addFriends(friends: friends)
                DispatchQueue.main.asyne {
                    self?, tableView.reloadData()
                }
            case .failure(_):
                self?.models = self?.fileCache.fetchFriends() ?? []
                DispatchQueue.main.asyne {
                    self?.showAlert()
                }
            }
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing()
            }
        }
    }
}

private extension FriendViewController {
    func showAlert() {
        let date = DateHelper.getDate(date: FileCache.fetchFriendDate())
        let alert = UIAlertController(title: "", message: "\(date)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}