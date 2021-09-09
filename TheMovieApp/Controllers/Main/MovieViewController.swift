
import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    @IBOutlet weak var stackContainerIdioms: UIStackView!
    @IBOutlet weak var stackContainerGenders: UIStackView!
    @IBOutlet weak var btnSeeTrailer: UIButton!
    
    var movie:Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMovieDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupUI(){
        btnSeeTrailer.layer.cornerRadius = 12
    }
    
    func setupData(){
        let url = "\(ApiConstant.baseUrlImage)/\(movie!.backdropPath!)"
        
        btnSeeTrailer.isHidden = movie?.homepage == nil
        
        imgBanner.setImage(fromUrl: url)
        lblMovieTitle.text = movie!.title
        lblScore.text = String(movie!.voteAverage)
        textDescription.text = movie!.overview
        
        for idiom in movie!.spokenLanguages!{
            
            let label = UILabel()
            
            label.text = idiom.name
            
            stackContainerIdioms.addArrangedSubview(label)
        }
        
        for gender in movie!.genres!{
            
            let label = UILabel()
            
            label.text = gender.name
            
            stackContainerGenders.addArrangedSubview(label)
        }
        
    }
    
    func fetchMovieDetail(){
        Movie.fetchMovieDetails(movieId: movie!.id) { response in
            self.movie = response
            
            if response != nil{
                self.setupData()
            }
        }
    }
    
    
    @IBAction func onClickedSeeTrailer(_ sender: Any) {
        let urlVideo:String = movie!.homepage!
        
        if let url = URL(string: urlVideo){
            UIApplication.shared.open(url)
        }
        
    }
}
