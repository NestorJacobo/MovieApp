
import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieDuration: UILabel!
    @IBOutlet weak var btnSeeMore: UIButton!
    
    public var onAction: (() -> Void)!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgMovie.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(movie: Movie){
        let url = "\(ApiConstant.baseUrlImage)/\(movie.posterPath!)"

        imgMovie.setImage(fromUrl: url)
        
        lblMovieTitle.text = movie.originalTitle
        
        btnSeeMore.layer.cornerRadius = 12
        
        lblMovieDuration.text = movie.releaseDate
    }
    
    @IBAction func onClickedDetails(_ sender: Any) {
        onAction()
    }
    
    
}
