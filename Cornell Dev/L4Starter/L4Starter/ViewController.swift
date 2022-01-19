import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()

    let reuseIdentifier = "cafeteriaCellReuse"
    let cellHeight: CGFloat = 50
    
    var cafeterias: [Cafeteria] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cafeterias"
        view.backgroundColor = .systemBackground
        
        let chicken = Cafeteria(name: "chicken", isFavorite: true, rating: .good)
        let biriyani = Cafeteria(name: "Biriyani", isFavorite: true, rating: .great)
        let coffee =  Cafeteria(name: "Coffee", isFavorite: false, rating: .moderate)
        let fries = Cafeteria(name: "Fries", isFavorite: true, rating: .terrible)
        let burger = Cafeteria(name: "Burger", isFavorite: false, rating: .bad)
        cafeterias = [chicken, biriyani, coffee, fries, burger]
        // Initialize tableView
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CafeteriaTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)

        setupConstraints()
        tableView.reloadData()
    }

    func setupConstraints() {
//        Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CafeteriaTableViewCell else { return UITableViewCell() }
        let cafeteria = cafeterias[indexPath.row]
        cell.configure(for: cafeteria)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeterias.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cafeteria = cafeterias[indexPath.row]
        cafeteria.isFavorite.toggle()
        guard let cell = tableView.cellForRow(at: indexPath) as? CafeteriaTableViewCell else { return }
        cell.toggle(isFavorite: cafeteria.isFavorite)
        
    }
    
}

