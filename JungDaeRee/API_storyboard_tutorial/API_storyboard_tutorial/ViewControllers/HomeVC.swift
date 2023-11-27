//
//  ViewController.swift
//  API_storyboard_tutorial
//
//  Created by Taejun Ha on 11/27/23.
//

import UIKit
import Toast

class HomeVC: UIViewController, UISearchBarDelegate, UIGestureRecognizerDelegate {
    @IBOutlet var searchFilterSegment: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchIndicator: UIActivityIndicatorView!
    
    var keyboardDismissTabGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: HomeVC.self, action: nil)
    
    //MARK: - override method
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeVC - viewDidLoad() called")
        // Do any additional setup after loading the view.
        
        self.config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVC - viewWillAppear() called")
        // 키보드 올라가는 이벤트를 받는 처리
        // - NotificationCenter는 원래 기본적으로 키보드가 올라가고 내려가면 알아서 방송을 송출함 우리는 그걸 필요에 따라 받기만 하면 됨
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHandle(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideHandle(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // - 앱 시작 때 서치바에 포커싱 주기
        self.searchBar.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeVC - viewWillDisappear() called")
        // 키보드 Notification 해제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 화면이 넘어가기 전에 데이터 준비
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HomeVC - prepare() called / segue.identifier : \(segue.identifier)")
        
        switch segue.identifier {
        case SEGUE_ID.USER_LIST_VC:
            let nextVC = segue.destination as! UserListVC
            guard let userInputValue =  self.searchBar.text else {return}
            nextVC.vcTitle = userInputValue + "🧑‍💻"
        case SEGUE_ID.PHOTO_COLLECTION_VC:
            let nextVC = segue.destination as! PhotoCollectionVC
            guard let userInputValue =  self.searchBar.text else {return}
            nextVC.vcTitle = userInputValue + "🏞️"
        default:
            break
        }
        
    }

    //MARK: - fileprivate methods
    
    fileprivate func config(){
        // UI 설정
        // - 검색 Butotn
        self.searchButton.layer.cornerRadius = 10
        
        // - SearchBar
        self.searchBar.searchBarStyle = .minimal
        self.searchBar.delegate = self
        
        self.keyboardDismissTabGesture.delegate = self
        
        // - 제스처 추가하기
        self.view.addGestureRecognizer(keyboardDismissTabGesture)
        
    }
    
    fileprivate func pushVC() {
        var segueId: String = ""
        
        switch searchFilterSegment.selectedSegmentIndex{
        case 0:
            segueId = "goToPhotoCollectionVC"
        case 1:
            segueId = "goToUserListVC"
        default:
            segueId = "goToPhotoCollectionVC"
        }
        
        // 화면 이동
        // - 이동할 화면의 id는 segueId, sender 즉, 보내는 사람은 나 자신
        self.view.endEditing(true)
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    @objc func keyboardWillShowHandle(notification: NSNotification) {
        print("HomeVC - keyboardWillShowHandle() called")
        
        // 키보드 사이즈 가져오기
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        {
            print("keyboardSize.height: \(keyboardSize.height)")
            print("searchButton.frame.origin.y : \(searchButton.frame.origin.y)")
            
            let distance = keyboardSize.height - searchButton.frame.origin.y
            
            if distance < 0 {
                self.view.frame.origin.y = distance - searchButton.frame.height
            }
        }
    }
    
    @objc func keyboardWillHideHandle(notification: NSNotification) {
        print("HomeVC - keyboardWillHideHandle() called")
        self.view.frame.origin.y = 0
    }
    
    //MARK: - IBAction method
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        print("HomeVC - searchFilterValueChanged() called / index : \(sender.selectedSegmentIndex)")
        
        var searchBarPlaceHolder = ""
        
        switch sender.selectedSegmentIndex {
        case 0:
            searchBarPlaceHolder = "사진 키워드"
        case 1:
            searchBarPlaceHolder = "사용자 이름"
        default:
            searchBarPlaceHolder = "사진 키워드"
        }
        
        self.searchBar.placeholder = searchBarPlaceHolder + "입력"
    
        // searchBar에 포커싱이 주어지면 키보드가 나타남
        self.searchBar.becomeFirstResponder() // 포커싱 주기
//        self.searchBar.resignFirstResponder() // 포커싱 해제인데 포커싱이 해제되면 키보드가 사라짐
    }

    
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
//        print("HomeVC - onSearchButtonClicked() called / selectedIndex : \(searchFilterSegment.selectedSegmentIndex)")
        
        // 화면으로 이동
        pushVC()
    }
    
    
    //MARK: - UISearchBar Delegate methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HomeVC - searchbarSearchButtonClicked()")
        
        guard let userInputString = searchBar.text else { return }
        
        if userInputString.isEmpty {
            self.view.makeToast("📣 검색 키워드를 입력해주세요.", duration: 1.0, position: .center)
        } else {
            // 화면으로 이동
            pushVC()
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() searchText : \(searchText)")
        
        if(searchText.isEmpty) {
            self.searchButton.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                //포커싱 해제
                searchBar.resignFirstResponder()
            })
        } else {
            self.searchButton.isHidden = false
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        
        print("shouldChangeTextIn : \(inputTextCount)")

        if inputTextCount >= 12 {
            self.view.makeToast("📢 12자 까지만 입력가능합니다.", duration: 1.0, position: .center)
            return false
        } else {
            return true
        }
    }
    
    //MARK: - UIGestureRecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("HomeVC - gestureRecognizer shouldReceive() called")
        
        // 터치로 들어온 뷰가 세그먼트 혹은 서치바이면 키보드 사라지지 않게 함
        if (touch.view?.isDescendant(of: searchFilterSegment) == true) {
            print("세그먼트가 터치되었다.")
            return false
        } else if (touch.view?.isDescendant(of: searchBar) == true) {
            print("서치바가 터치되었다.")
            return false
        } else {
            view.endEditing(true)
            print("화면이 터치되었다.")
            return true
        }
    }
}
