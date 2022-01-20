//
//  MyPageSettingRulesViewController.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/20.
//

import UIKit

class MyPageSettingRulesViewController: UIViewController {

    // MARK: - Property
    let privacyContent: String = """
카드나는 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.
    
    * 이 개인정보처리방침은 2022년 1월 1부터 적용됩니다.

    제1조(개인정보의 처리 목적) 카드나는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.

    1. 홈페이지 회원가입 및 관리

    회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리 목적으로 개인정보를 처리합니다.

    제2조(개인정보의 처리 및 보유 기간) ① 카드나는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
    <홈페이지 회원가입 및 관리>
    <홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<3년>까지 위 이용목적을 위하여 보유, 이용됩니다.
    보유근거 : 카드나 회원 관리 및 운영

    제4조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)
    ① 정보주체는 카드나에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
    ② 제1항에 따른 권리 행사는카드나에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 카드나는 이에 대해 지체 없이 조치하겠습니다.
    ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
    ④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
    ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
    ⑥ 카드나는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.

    제5조(처리하는 개인정보의 항목 작성) ① 카드나는 다음의 개인정보 항목을 처리하고 있습니다.
    < 홈페이지 회원가입 및 관리 >
    필수항목 : 이메일, 비밀번호, 이름, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보
    선택항목 : 이메일, 비밀번호, 이름, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보

    제6조(개인정보의 파기)
    ① 카드나는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다. ② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다. 1. 법령 근거 : 2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜 ③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.1. 파기절차. 카드나는 파기 사유가 발생한 개인정보를 선정하고, 카드나의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.


    2. 파기방법

    전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다

    제7조(개인정보의 안전성 확보 조치)  카드나는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
    1. 정기적인 자체 감사 실시개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다. 2. 내부관리계획의 수립 및 시행개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다. 3. 접속기록의 보관 및 위변조 방지개인정보처리시스템에 접속한 기록을 최소 1년 이상 보관, 관리하고 있으며,다만, 5만명 이상의 정보주체에 관하여 개인정보를 추가하거나, 고유식별정보 또는 민감정보를 처리하는 경우에는 2년이상 보관, 관리하고 있습니다.또한, 접속기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다. 4. 개인정보에 대한 접근 제한개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다. 5. 비인가자에 대한 출입 통제개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.

    제8조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항)
    ① 카드나는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.

    제9조 (개인정보 보호책임자)
    ① 카드나는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
    • 개인정보 보호책임자
    • 성명 :곽민주
    • 연락처 : CARDNAteam@gmail.com

    제11조(권익침해 구제방법) 정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다. 1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr) 2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr) 3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr) 4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다. ※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.

    제12조(개인정보 처리방침 변경)
    ① 이 개인정보처리방침은 2022년 1월 1부터 적용됩니다.
    ② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다.
"""
    let serviceContent: String = """
제  1 조 (목적)

본 약관은 회원(본 약관에 동의한 자를 말합니다 이하 "회원"이라고 합니다.) 이 카드나(이하 "회사"라고 합니다.)이 제공하는 카드나 앱 서비스(이하 "서비스"라고 합니다.)를 이용함에 있어 회사와 회원의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

제 2 조 (정의)

① “서비스”란 회사가 제공하는 카드나 서비스를 의미합니다. 카드나 서비스는 단말기(모바일, PC 등의 장치를 포함)를 이용하는 모든 이용자가 이용할 수 있도록 제공합니다.
② “이용자”란 “앱”에 접속하여 이 약관에 따라 “앱”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ “회원”이라 함은 “앱”에 회원 등록을 한 자로서, 계속적으로 “앱”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

제 3 조 (약관의 명시, 효력 및 개정)

① 회사는 본 약관의 내용을 회원이 알 수 있도록 서비스 페이지 내에 항시 게시함으로써 이를 공지합니다.

② 회사는 콘텐츠산업 진흥법, 정보통신망 이용 촉진 및 정보보호 등에 관한 법률, 약관의 규제에 관한 법률, 소비자기본법 등 관련 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.

③ 회사가 약관을 개정할 경우에는 개정약관 및 개정약관의 시행일자와 개정사유를 명시하여 그 시행일자 15일 전부터 시행일 이후 상당한 기간 동안 본 서비스 페이지에게시하며, 개정된 약관은 그 시행일에 효력이 발생합니다. 단, 개정 내용이 회원에게 불리한 경우에는 그 시행일자 30일 전부터 시행일 이후 상당한 기간 동안 본 서비스페이지에 게시하거나 팝업화면을 게시하는 등 이용자가 충분히 인지할 수 있는 합리적으로 가능한 방법으로 공지하며, 개정된 약관은 그 시행일에 효력이 발생됩니다.

④ 회사가 전항에 따라 회원에게 통지하면서 공지 일로부터 개정 약관 시행일까지 거부 의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 불구하고 회원의 거부의 의사표시가 없는 경우에는 변경된 약관에 동의한 것으로 봅니다. 회원이 개정 약관에 동의하지 않을 경우 회원은 제14조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다.

제 4 조 (약관 동의 및 서비스 이용계약의 체결)

① 회사와 회원 간의 서비스 이용계약은 이용자가 본 약관 내용에 대해 동의하고 서비스 이용 신청을 하면 회사가 그 신청을 승낙함으로써 성립합니다.

② 회사는 이용자가 서비스 회원가입 페이지의 “동의함” 버튼을 클릭하거나 이용자가 본 서비스의 이용을 시작한 경우 본 약관에 동의한 것으로 간주합니다.

③ 회사는 이용자가 필수사항 등을 성실히 입력하여 서비스 이용 신청을 완료하였을 때에는 신청 내용을 확인한 후 지체 없이 이를 승낙하여야 합니다. 단, 회사는 아래 각호에 해당하는 경우에는 승낙을 유보할 수 있습니다.

1. 서비스의 설비용량에 현실적인 여유가 없는 경우
2. 서비스를 제공하기에는 기술적으로 문제가 있다고 판단되는 경우

④ 본 서비스 이용계약은 회사가 신청 절차 상에서 가입 완료를 표시한 시점에 성립합니다.

제 5 조 (개인정보의 보호 및 관리)

① 회사는 서비스를 제공하기 위하여 회원으로부터 서비스 이용에 필요한 개인 정보를 수집할 수 있습니다.

② 회사는 관련 법령이 정하는 바에 따라 회원의 개인 정보를 보호하기 위해 노력하며, 회원의 개인 정보의 보호 및 사용에 대해서는 회사가 별도로 고지하는 개인정보처리방침을 적용합니다.

③ 회사는 회사의 귀책 없이 회원의 귀책사유로 인하여 회원의 정보가 노출된 경우 이에 대해서는 책임을 지지 않습니다.

제 6 조 (게시물의 관리 및 임시조치)

① 서비스 내 모든 게시물 및 콘텐츠의 관리 권한 및 책임은 해당 게시물 및 콘텐츠를 게시한 회원에게 있습니다. 단, 회원의 요청이 있거나 기타 회사가 서비스의 원활한 운영을 위하여 필요하다고 판단되는 경우, 회사는 게시물의 관리 등과 관련한 사항을 개선, 지원하는 등의 활동을 할 수 있습니다.

② 회원의 게시물 등이 관련 법령에 위반되는 내용을 포함하는 경우, 회사는 해당 관련 법령이나 적법한 권리자의 요청에 따라 해당 게시물 등에 대한 게시 중단 및 삭제 등의 조치를 취할 수 있습니다.

③ 회사는 게시물 등에 회사의 약관 및 서비스 이용약관에 위반되는 사유가 있는 것으로 확인된 경우, 이용약관 따라 해당 게시물에 대해 조치를 취할 수 있습니다.

④ 정보통신망 이용 촉진 및 정보보호 등에 관한 법률(이하 “정보통신망법”이라 합니다)의 규정에 의해 다른 회원의 공개된 게시물 등이 본인의 사생활을 침해하거나 명예를 훼손하는 등 권리를 침해받은 회원 또는 제3자(이하 “삭제 등 신청인”이라 합니다)는 그 침해사실을 소명하여 회사에 해당 게시물 등의 삭제 또는 반박 내용의 게재를 요청할 수 있습니다. 이 경우 회사는 해당 게시물 등의 권리 침해 여부를 판단할 수 없거나 당사자 간의 다툼이 예상되는 경우 해당 게시물 등에 대한 접근을 임시적으로 차단하는 조치(이하 “임시 조치”라 합니다)를 최장 30일까지 취합니다.

⑤ 전항에 의해 본인의 게시물 등이 임시 조치된 회원(이하 “게시자”라 합니다)은 임시 조치 기간 중 회사에 해당 게시물 등을 복원해 줄 것을 요청(이하 “재게시 청구”라 합니다) 할 수 있으며, 회사는 임시 조치된 게시물의 명예훼손 등 판단에 대한 방송통신심의위원회 심의 요청에 대한 게시자 및 삭제 등 신청인의 동의가 있는 경우 게시자 및 삭제 등 신청인을 대리하여 이를 요청하고 동의가 없는 경우 회사가 이를 판단하여 게시물 등의 복원 여부를 결정합니다. 게시자의 재게시 청구가 있는 경우 임시 조치 기간 내에 방송통신심의위원회 또는 회사의 결정이 있으면 그 결정에 따르고 그 결정이 임시 조치 기간 내에 있지 않는 경우 해당 게시물 등은 임시 조치 만료일 이후 복원됩니다. 재게시 청구가 없는 경우 해당 게시물 등은 임시 조치 기간 만료 이후 삭제됩니다.

⑥ 회사는 서비스 내에 게시된 게시물 등이 원저작자의 중대한 권리를 침해한다고 인정하는 경우 회원 또는 제3자의 신고가 없는 경우에도 임시 조치(이하 “임의의 임시 조치”라 합니다)를 취할 수 있습니다.

⑦ 회원의 게시물 등으로 인한 법률상 이익 침해를 근거로, 원저작자가 회원 또는 회사를 대상으로 하여 민·형사상의 법적 조치를 취하는 경우, 회사는 동 법적 조치의 결과인 법원의 확정판결이 있을 때까지 관련 게시물 등에 대한 접근을 잠정적으로 제한할 수 있습니다. 게시물 등의 접근 제한과 관련한 법적 조치의 소명, 법원의 확정판결에 대한 소명 책임은 당사자가 부담합니다.

제 7 조 (회원의 의무)

① 회원은 아래 각 호에 해당하는 행위를 하여서는 안됩니다.

1. 신청 또는 변경 시 허위 내용의 등록
2. 타인의 정보 도용
3. 회사의 허락 없이 서비스를 이용하여 영업/광고 활동 등을 하는 행위
4. “앱”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5. “앱” 기타 제3자의 저작권 등 지적재산권에 대한 침해
6. “앱” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 앱에 공개 또는 게시하는 행위
8. 선정적이고 음란한 내용 기타 공공질서 및 사회 상규에 반하는 내용을 게시하는 행위
9. 회사의 직원이나 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 도용하여 게시물 등을 작성하거나 이메일을 발송하는 행위
10. 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해·파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드·파일·프로그램을 포함하고 있는 자료를 게시하거나 다른 회원에게 발송하는 행위
11. 스토킹(stalking).스팸성 댓글의 게재 등 다른 회원의 정상적인 서비스 이용을 방해하는 행위
12. 회사가 제공하는 소프트웨어 등을 개작하거나 리버스 엔지니어링, 디컴파일, 디스어셈블 하는 행위
13. 본 약관 및 회사가 규정한 을 위반하는 행위
    
    서비스 이용약관
    

③ 회사는 회원이 전항 각 호의 행위를 하는 경우 해당 게시물 등을 삭제 또는 임시 조치할 수 있고 회원의 서비스 이용을 제한하거나 그 사유가 중대한 경우 일방적으로 본 계약을 해지할 수 있습니다.

④ 회원이 본 조 제2항 각 호의 행위를 함으로써 회사에 손해가 발생한 경우, 회사는 해당 회원에 대해 손해배상을 청구할 수 있습니다.

⑤ 본 서비스 내에서 회사의 관여 없이 회원 간 이루어지는 일체의 행위(거래 행위 포함)와 관련하여 발생하는 모든 의무와 책임은 해당 회원에게 있으며, 회사는 그 내용에 대하여 책임을 지지 않습니다.

제 8 조 (저작권의 귀속 및 이용 제한)

① 회사가 작성한 저작물에 대한 저작권 기타 지적재산권은 회사에 귀속합니다.

② 이용자는 “앱”을 이용함으로써 얻은 정보 중 회사에게 지적재산권이 귀속된 정보를 회사의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.

③ 회사는 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.

제 9 조 (서비스 이용의 제한 및 중지)

① 회사는 아래 각 호에 해당하는 사유가 발생한 경우에는 회원의 서비스 이용을 제한하거나 중지시킬 수 있습니다.

1. 회원이 회사의 서비스 운영을 고의 또는 과실로 방해하는 경우
2. 회원이 제 7조의 의무를 위반한 경우
3. 기타 중대한 사유로 인하여 회사가 해당 회원에 대해 서비스 제공을 지속하는 것이 상당하지 않다고 판단되는 경우

② 회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한 기간 등을 회원에게 알립니다.

제 10 조 (계정의 관리 책임)

회원은 본인의 계정 관리에 대한 책임을 부담하며, 본인 계정을 제3자가 무단 이용하는 등 회원의 귀책사유로 인해 발생하는 모든 불이익에 대한 책임을 부담합니다.

제 11 조 (양도 금지)

회원의 서비스 받을 권리는 이를 양도 내지 증여의 대상으로 하거나 질권의 목적으로 활용할 수 없습니다.

제 12 조 (회원 탈퇴 및 자격 상실 등)

① 회원은 “앱”에 언제든지 탈퇴를 요청할 수 있으며 “앱”은 즉시 회원 탈퇴를 처리합니다.

② 회원이 다음 각 호의 사유에 해당하는 경우, “앱”은 회원자격을 제한 및 정지시킬 수 있습니다.

1. 가입 신청 시에 허위 내용을 등록한 경우
2. 다른 사람의 “앱” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
3. “앱”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

③ 회원이 서비스를 탈퇴한 경우 회원의 개인 정보에 대한 보관 등은 회사의 개인정보처리방침에 따릅니다.

④ 회원 탈퇴 시 회원으로서의 모든 혜택은 소멸됩니다. 회원 탈퇴와 관련하여 발생한 손해는 해당 회원이 책임을 부담하여야 하고, 회사는 일체의 책임을 지지 않습니다.

제 13 조 (면책조항)

① 회사는 다음 각 호의 사유로 서비스를 제공할 수 없는 경우 이로 인하여 회원에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.

1. 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우
2. 제 3자의고의적인 서비스 방해가 있는 경우
3. 회원의 귀책사유로 서비스 이용에 장애가 발생한 경우
4. 제1호 내지 제3호를 제외한 기타 회사의 고의∙과실이 없는 사유로 서비스를 제공하는 것이 어려운 경우

② 회사는 회원이 작성하여 서비스에 게재된 정보 및 자료의 신뢰도나 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 회원의 손해에 대하여는 책임을 부담하지 아니합니다.

제 14 조 (회원에 대한 통지)

① 회사가 회원에 대한 통지를 하는 경우, 본 약관에 별도 규정이 없는 한 회원이 회사에 제공한 이메일 주소로 통지할 수 있습니다.

제 15 조 (약관의 해석)

본 약관에 명시되지 않은 사항에 대해서는 회사와 회원 간 합의하여 결정하고, 합의가 되지 않는 경우 관련 법령 또는 상관례에 따릅니다.

제 16 조 (분쟁해결)

① 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해 보상처리기구를 설치․운영합니다.

② 회사는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 즉시 통보해 드립니다.

제 17 조 (준거법 및 재판관할)

① 회사와 이용자 간에 발생한 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.

② 회사와 이용자 간에 제기된 소송에는 한국법을 적용합니다.

**부칙**

제1조 (시행일) 본 약관은 2022년 01월 01일부터 시행합니다.
"""
    let privacyTitle: String = "개인정보 처리 방침"
    let serviceTitle: String = "서비스 이용약관"
    var nowPage: Int = 3
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setContent()
    }
    
    private func setUI() {
        setLabelUI()
    }
    
    func setLabelUI() {
        pageTitleLabel.font = .cardnaSh1Sbd
        pageTitleLabel.textColor = .w1
        contentLabel.font = .Pretendard(.regular, size: 14)
        contentLabel.textColor = .w3
    }
    
    func setContent() {
        if nowPage == 2 {
            pageTitleLabel.text = privacyTitle
            contentLabel.text = privacyContent
            contentLabel.sizeToFit()
            contentLabel.snp.makeConstraints {
                $0.height.equalTo(400)
            }
        }
        else {
            pageTitleLabel.text = serviceTitle
            contentLabel.text = serviceContent
            contentLabel.sizeToFit()
        }
    }
    
    // MARK: - IBAction
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
