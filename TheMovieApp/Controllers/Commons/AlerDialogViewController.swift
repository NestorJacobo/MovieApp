import UIKit

class AlertDialogViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnAccept: UIButton!
    
    public var textTitle: String!
    public var textMessage: String!
    public var onConfirm: (() -> Void)?
    public var showCancel: Bool = false
    public var onCancel: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        lblTitle.text = "¡Atención!"
        lblMessage.text = "No cuentas con conexión a internet"
        btnCancel.isHidden = !showCancel
    }

    @IBAction func onConfirmClicked(_ sender: Any) {
        dismiss(animated: true, completion: onConfirm)
    }
    
    @IBAction func onClickedCancel(_ sender: Any) {
        dismiss(animated: true, completion: onCancel)
    }
}
