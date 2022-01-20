# 카드나 : 다양한 나를 펼치다
### "거기 아요 최고라카드나? 🎴🎴"

## 🃏 프로젝트 소개
> *내가 아는 나와 다른 사람이 아는 나를 카드로 만들어 `조하리의 창(Johari's Windows)`의 `열린 창(Open area)`를 넓히자.*<br/>
> 이를 통해 다양한 나를 소개하고 서로를 더욱 깊게 알아갈 수 있는 서비스
<div align="center">

![Cardna_Concept_Github](https://user-images.githubusercontent.com/48648026/148782516-b327f8b9-06aa-48d8-8121-5f63b83cdb08.jpeg)
![Swift](https://img.shields.io/badge/swift-v5.5.2-orange?logo=swift) ![Xcode](https://img.shields.io/badge/xcode-v13.2.1-blue?logo=xcode)<br/>
![Moya](https://img.shields.io/badge/Moya-v15.0.0-brightgreen) ![SnapKit](https://img.shields.io/badge/SnapKit-v5.0.1-skyblue) ![Then](https://img.shields.io/badge/Then-v2.7.0-lightgrey)
</div>
<br/>

## 👨‍👩‍👧‍👦 카족들 소개
![Cardna_iOS_Github](https://user-images.githubusercontent.com/48648026/148782952-5e7262af-6244-4fcf-8f89-361709e8e3ee.jpg)
| ```Lead``` ```씨워터``` 김혜수 | ```무명이``` 이경민 | ```닝팝``` 이남준 |
| :-: | :-: | :-: |
| <img src="https://user-images.githubusercontent.com/48648026/148783045-b676033a-a6b9-4afb-8abf-a66d9e537dd5.png" width="250"> | <img src="https://user-images.githubusercontent.com/48648026/148783025-0cff0c36-0b3e-47de-b1a0-3ac6e0e7b180.png" width="250"> | <img src="https://user-images.githubusercontent.com/48648026/148783060-952f18de-ed60-40e3-a872-6411fd8192b6.png" width="250"> |
| [@hyesuuou](https://github.com/hyesuuou) | [@meenyweeny](https://github.com/meenyweeny) | [@ningpop](https://github.com/ningpop) |
| 리드 경험과 사람을 얻고 싶고, <div></div>안해본 기능을 구현하고 싶습니다. | YB에게 알려줄 수 있는 <div></div>실력을 갖고 싶습니다. | iOS를 제대로 도전해보는<div></div>경험을 얻어가고 싶습니다. |
<br/>

## 프로젝트 내에서 본인이 맡은/개발한 기능들이나 뷰에 대해서 기재해주세요! 

[Notion 바로가기](https://silken-pyroraptor-823.notion.site/ffe5265b1c464cbfabaaf9bdb11cf2ab)

## 이번 프로젝트를 하면서 어려웠던 부분과 이를 어떻게 극복했는지 작성해주세요!

[Notion 바로가기](https://silken-pyroraptor-823.notion.site/21dcc721098b40c985c35b203fb00e4b)

## 💻 Coding Convention
<details>
<summary>펼쳐서 보기</summary>

### 코드레이아웃
***들여쓰기 및 띄어쓰기***

- 들여쓰기: 1 Tab
- : 을 쓸 때에는 콜론의 오른쪽에만 공백을 둔다.
    
    ```swift
    let names: [String: String]?
    ```
    

***줄바꿈***

- 모든 파일은 빈 줄로 끝나도록 한다.
- MARK 구문의 위와 아래는 공백이 필요하다.
    
    ```swift
    // MARK: Layout
    
    override func layoutSubviews() {
      // doSomething()
    }
    
    // MARK: Actions
    
    override func menuButtonDidTap() {
      // doSomething()
    }
    ```
    
- 함수 줄바꿈은 다음과 같이 한다.
    
    ```swift
    override func layoutSubviews() {
      // doSomething()
    }
    ```
    
- 함수 정의가 너무 길어지면 다음과 같이 줄바꿈한다.
    
    ```swift
    func collectionView(_ collectionView: UICollectionView,
    			  cellForItemAt indexPath: IndexPath
    				) -> UICollectionViewCell {
      // doSomething()
    }
    ```
    
    파라미터 기준 줄바꿈 → 1개마다 내리고 리턴도 내림
    

***import***

모듈 임포트는 **알파벳 순으로 정렬**합니다. 

내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.

UIKit과 Foundation 둘다 쓰지 말기 (UIKit안에 Foundation 포함)

```swift
import UIKit

import SwiftyColor
import SwiftyImage
import Then
import URLNavigator
```

### 네이밍

***클래스***

- 클래스 이름에는 UpperCamelCase를 사용합니다.
- 클래스 이름에는 접두사를 붙이지 않습니다.
    
    Prefix
    

***함수***

- 함수 이름에는 lowerCamelCase를 사용합니다.
- Action 함수의 네이밍은 '주어 + 동사 + 목적어' 형태를 사용합니다.
    - Tap(눌렀다 뗌)*은 `UIControlEvents`의 `.touchUpInside`에 대응하고, *Press(누름)*는 `.touchDown`에 대응합니다.
    - *will~*은 특정 행위가 일어나기 직전이고, *did~*는 특정 행위가 일어난 직후입니다.
    - is*~*는 일반적으로 `Bool`을 반환하는 함수에 사용됩니다.
    
    **좋은 예**
    
    ``` swift
    func backButtonDidTap() {
      // ...
    }
    ```
    
    **나쁜 예:**
    
    ```swift
    func back() {
      // ...
    }
    
    func pressBack() {
      // ...
    }
    ```
    

***변수***

- 변수 이름에는 lowerCamelCase를 사용합니다.

***상수***

- 상수 이름에는 lowerCamelCase를 사용합니다.
    
    **좋은 예:**
    
    ``` swift
    let maximumNumberOfLines = 3
    ```
    
    **나쁜 예:**
    
    `let kMaximumNumberOfLines = 3
    let MAX_LINES = 3`
    

***열거형***

- enum의 각 case에는 lowerCamelCase를 사용합니다.
    
    **좋은 예:**
    
    ```swift
    enum Result {
      case .success
      case .failure
    }
    ```
    
    **나쁜 예:**
    
    ```swift
    enum Result {
      case .Success
      case .Failure
    }
    ```
    

***약어***

- 약어로 시작하는 경우 소문자로 표기하고, 그 외의 경우에는 항상 대문자로 표기합니다.
    
    **좋은 예:**
    
    ```swift
      let userID: Int?
      let html: String?
      let websiteURL: URL?
      let urlString: String?
    
    ```
    
    **나쁜 예:**
    
    ```swift
      let userId: Int?
      let HTML: String?
      let websiteUrl: NSURL?
      let URLString: String?
    
    ```
    

***Delegate***

- Delegate 메서드는 프로토콜명으로 네임스페이스를 구분합니다.
    
    **좋은 예:**
    
    ```swift
    protocol UserCellDelegate {
      func userCellDidSetProfileImage(_ cell: UserCell)
      func userCell(_ cell: UserCell, didTapFollowButtonWith user: User)
    }
    ```
    
    **나쁜 예:**
    
    ```swift
    protocol UserCellDelegate {
      func didSetProfileImage()
      func followPressed(user: User)
    
      // `UserCell`이라는 클래스가 존재할 경우 컴파일 에러 발생
      func UserCell(_ cell: UserCell, didTapFollowButtonWith user: User)
    }
    ```
    

### 클로저

- 파라미터와 리턴 타입이 없는 Closure 정의시에는 `() -> Void`를 사용합니다.
    
    **좋은 예:**
    
    ``` swift
    let completionBlock: (() -> Void)?
    ```
    
    **나쁜 예:**
    
    `let completionBlock: (() -> ())?
    let completionBlock: ((Void) -> (Void))?`
    
- Closure 정의시 파라미터에는 괄호를 사용하지 않습니다.
    
    **좋은 예:**
    
    ``` swift
    { operation, responseObject in
      // doSomething()
    }
    ```
    
    **나쁜 예:**
    
    `{ (operation, responseObject) in
      // doSomething()
    }`
    
- Closure 정의시 가능한 경우 타입 정의를 생략합니다.
    
    **좋은 예:**
    
    ``` swift
    ...,
    completion: { finished in
      // doSomething()
    }
    ```
    
    **나쁜 예:**
    
    `...
    completion: { (finished: Bool) -> Void in
      // doSomething()
    }`
    
- Closure 호출시 또다른 유일한 Closure를 마지막 파라미터로 받는 경우, 파라미터 이름을 생략합니다.
    
    **좋은 예:**
    
    ``` swift
    UIView.animate(withDuration: 0.5) {
      // doSomething()
    }
    ```
    
    **나쁜 예:**
    
    `UIView.animate(withDuration: 0.5, animations: { () -> Void in
      // doSomething()
    })`
    

### 클래스와 구조체

- 클래스와 구조체 내부에서는 `self`를 명시적으로 사용합니다. (최대한 쓰자)
- 구조체를 생성할 때에는 Swift 구조체 생성자를 사용합니다.
    
    **좋은 예:**
    
    ``` swift
    let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    ```
    
    **나쁜 예:**
    
    `let frame = CGRectMake(0, 0, 100, 100)`
    

### 타입

- `Array<T>`와 `Dictionary<T: U>` 보다는 `[T]`, `[T: U]`를 사용합니다.
    
    **좋은 예:**
    
    ``` swift
    var messages: [String]?
    var names: [Int: String]?
    ```
    
    **나쁜 예:**
    
    `var messages: Array<String>?
    var names: Dictionary<Int, String>?`
    

### 주석

- `///`를 사용해서 문서화에 사용되는 주석을 남깁니다.
    
    ```swift
    /// 사용자 프로필을 그려주는 뷰
    class ProfileView: UIView {
    
    	/// 사용자 닉네임을 그려주는 라벨
    	var nameLabel: UILabel!
    }
    ```
    
- `// MARK:-`를 사용해서 연관된 코드를 구분짓습니다.
    
    Objective-C에서 제공하는 `#pragma mark`와 같은 기능으로, 연관된 코드와 그렇지 않은 코드를 구분할 때 사용합니다.
    
    ```swift
    // MARK: - Init
    
    override init(frame: CGRect) {
      // doSomething()
    }
    
    deinit {
      // doSomething()
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
      // doSomething()
    }
    
    // MARK: Actions
    
    override func menuButtonDidTap() {
      // doSomething()
    }
    ```
    

### MARK 구문 (ViewController)

- 큰 마크구문 (MARK: - )

```swift
// MARK: - Property
var index = 0
var nameList: [Name]

// MARK: - IBOutlet

// MARK: - VC LifeCycle

// MARK: - Function

// MARK: - Objc Function

// MARK: - IBAction

// MARK: - TableView Extension 

// MARK: - CollectionView Extension**
```

중 필요한 것만 쓰기! 순서는 위와 같이 고정

### 파일이름

약어사용X

ViewController

TableViewCell

CollectionViewCell

### 함수

최대한 단위를 쪼개고, 아래로 내려갈수록 작은 단위

``` swift
func setUI() {
	setNavigationBarUI()
	setTitleUI()
}

func setNavigationBarUI() { 
}

func setTitleUI() {
}
```

collectionview, tableview 초기세팅 

``` swift
func setCV() {
	collectionView.delegate = self
	collectionView.dataSource = self
}

func setTV() {
}
```

생명주기와 관련된 함수 내에는 코드를 작성하지 않음 (함수만작성)

``` swift
~~ viewDidLoad() {
	여긴 함수만!!
	setUI()
	setCV()
}
```

### 뷰컨 파일

**HomeVC**.swift

**HomeVC+Extension**.swift

``` swift
extension HomeVC {

}
```

### 띄어쓰기 공백

의미없는 공백 x

``` swift
func 함수1() {

}

func 함수2() {

}
```
</details>

<br/>

## 🌿 Git/Github Convention
### Git Commit Convention
Commit 메시지에 작업 분류를 작성하지 않고, Issue 번호로만 관리<br/>
ex.) 작업하기 위해 생성한 Issue의 번호가 3번일 때, commit message는 `[#3] (작업한 내용)` 으로 남긴다.
<br/>

### Git Branch 전략 - Git-flow
<img src="https://user-images.githubusercontent.com/48648026/148783471-e57e4436-b143-428d-a95c-ec118fb54694.png" width="600">

develop → default 브랜치

- feature/#이슈번호-hs(이름)
  - ex.) 혜수가 작업 시, 생성한 issue가 #3번이라면 develop 브랜치로부터 `feature/#3-hs` 라는 이름으로 브랜치 생성

main → 릴리즈 버전
<br/>
<br/>

## 📂 Project Foldering Convention
```
🗂 Network
    🗂 Mock
        - json 예시파일.json
    🗂 Base
        - NetworkResult.swift
    🗂 APIModels
        - 서버모델.swift
    🗂 APIConstants
        - APIConstant.swift
    🗂 APIService
        🗂 (ex. AuthAPI)
            - AuthRouter.swift (Router파일)
            - AuthService.swift (서비스파일)
        🗂 (ex. CardAPI)
            - CardRouter.swift
            - CardService.swift
🗂 Configuration
    🗂 Resources
        - LaunchScreen.storyboard
        🗂 Font
            - 폰트파일
        🗂 Asset
    🗂 Supports
        - AppDelegate.swift
        - SceneDelegate.swift
    🗂 AppExtensions
        - UIView+.swift
        - UITextField+.swift
        - UIColor+.swift
        - UIFont+.swift
    🗂 Constants
        - Const.swift
        - Image.swift
        - Xib.siwft
        - Storyboard.swift
        - ...
🗂 Source
    🗂 AppSources
        🗂 AppComponents (공통 컴포넌트들)
            - OKButton.swift
            - ... 
        🗂 AppModels
            - API랑은 관련없지만 따로 필요할 것 같은 모델
        🗂 AppProtocols
            - 앱 전체에서 공통으로 쓸만한 프로토콜
        🗂 AppXibs
            - 공통 xib파일 (ex. 카드셀)
    🗂 Scene (뷰별로 분리)
        🗂 Scene1
            - Scene1.Storyboard
            - Scene1ViewController.swift (ViewController)
            🗂 Cells
            🗂 Extensions
            🗂 Protocol
Info.plist
```
<br/>

## 🛠 Technical Stack
- Swift 5.5.2
- Xcode 13.2.1
- Another Library
  - Moya 15.0.0
  - Snapkit 5.0.1 + Then 2.7.0
<br/>

## 📱 Test Device
- iPhone SE 2nd Gen (375 x 667)
- iPhone 13 Pro (390 x 844)
- iPhone 13 mini (375 x 812)
<br/>
