
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableViewMain: UITableView!
    @IBOutlet weak var valueType: UISegmentedControl!
    
    var movieType: MovieType = .playingNow
    
    var movies:[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        fetchMovies()
        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        tableViewMain.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        tableViewMain.separatorStyle = .none
    }
    
    func fetchMovies(){

        Movie.fetchMovies(movieType: movieType) { movies in
            
            if movies.isEmpty{
                let vc = UIStoryboard(name: "Commons", bundle: nil).instantiateViewController(withIdentifier: "AlertDialogViewController") as! AlertDialogViewController
                   
                   vc.onConfirm = {
                       self.navigationController?.popViewController(animated: true)
                   }
                self.navigationController?.present(vc, animated: true)
            }
            
            self.movies = movies
            
            self.tableViewMain.reloadData()
        }
        
    }
    
    @IBAction func onChangeValue(_ sender: Any) {
        
        movieType = valueType.selectedSegmentIndex == 0 ? .playingNow : .mostPopular
        
        fetchMovies()
    }
    
   
}

//
// MARK: UITableViewDelegate, UITableViewDataSource protocols
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let identifier = "MovieTableViewCell"
        let cell = tableView.dequeueReusableCell(
            withIdentifier: identifier,
            for: indexPath)
        
        if let cell = cell as? MovieTableViewCell {
           
            cell.setupUI(movie: movies[indexPath.row])
            
            cell.onAction = {
                let vc = UIStoryboard(
                    name: "MovieDetails",
                    bundle: nil).instantiateViewController(
                        withIdentifier: "MovieViewController") as! MovieViewController
                
                vc.movie = self.movies[indexPath.row]

                self.navigationController?.pushViewController(vc, animated: true)
            }

            }
            
        
        
        cell.selectionStyle = .none
       
        return cell
    }
}
