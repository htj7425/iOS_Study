//
//  ViewController.swift
//  dynamic_table_view_tutorial
//
//  Created by Taejun Ha on 2023/09/03.
//

import UIKit

//UITableViewDelegate 테이블 뷰에 대한 설정을 하는 것
//UITableViewDataSource 테이블에 데이터소스를 집어 넣는 것

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let contentArray = [
        "계속해서 성장하는 개발자 하태준입니다.",
        "멋쟁이사자처럼 iOS APP School 지원 완료.",
        "TableView사용\n- TableView에 들어갈 Cell은 Nib파일로 생성\n- 각 Cell의 크기가 Dynamic하게 조절되도록 만들었음",
        "UITableViewDelegate : 테이블 뷰에 대한 설정을 하는 것\nUITableViewDataSource : 테이블에 데이터소스를 집어 넣는 것",
        "#1. TableView\niOS의 UITableView는 하나의 열에 세로로 스크롤되는 콘텐츠 행들을 표시합니다. 스크롤을 할 수 있는 만큼 UIScrollView를 상속받고 있습니다. 테이블의 각 행에는 앱 콘텐츠의 일부분이 표함됩니다. 예를 들어 연락처앱은 각 연락처의 이름을 별도의 행에 표시합니다. 또 설정앱은 사용가능한 설정 그룹이 행으로 표시됩니다. 하나의 긴 행을 표시하도록 테이블을 구성하거나 관련 행을 섹션형태로 그룹화하여 콘텐츠를 더 쉽게 탐색할 수도 있습니다.",
        "#2. TableView\n일반적으로 Navigation View Controller와 함께 사용하는 것이 일반적입니다. 이는 테이블의 다양한 계층의 탐색을 용이하도록 도와줍니다. UITableView는 각 행의 콘텐츠를 표시하는 cell로 구성됩니다. 표준 cell 구성은 텍스트와 이미지의 단순한 조합이지만 원할 경우 사용자 커스템 cell을 만들수도 있습니다. 또한 header, footer를 생성해 각 그룹에 대한 추가적인 정보를 제공할수도 있습니다."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //셀 리소스 파일 가져오기 - 아래 두 코드 다 같은 기능
//        let myTableViewCellNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        let myTableViewCellNib = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        
        // 셀에 리소스 등록
        self.myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCell") // forCellReuseIdentifier 이거는 그냥 이름 정해준거임
        
        self.myTableView.rowHeight = UITableView.automaticDimension // 자동으로 높이를 유동적으로 해주는 코드
        self.myTableView.estimatedRowHeight = 120 // 이건 내가 예상하기론 이정도 높이면 되겠다는 코드
        
        // 아주 중요     -      UITableViewDelegate, UITableViewDataSource를 myTableView에 연결 해주는거임
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        print("contentArray.count : \(contentArray.count)")
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //테이블뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.userContentLabel.text = contentArray[indexPath.row ]
        
        return cell
        
    }
    
    
}
