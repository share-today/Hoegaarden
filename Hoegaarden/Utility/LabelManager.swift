  //
//  Label.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/28.
//

import UIKit

struct Title {
    static let mainTitle = "하루 공유"
}


struct Login {
    static let googleLogin = "  Google로 로그인"
    static let kakaoLogin = "  카카오톡으로 로그인"
    static let appleLogin = "  Apple로 로그인"
}


struct AcceptLogin {
    static let main = "약관 동의"
}


struct Notices {
    static let noticeMain = "알림"
    
    static let minuteAgo = "00분 전"
    static let dateAgo = "00월 00일"
    
    static let yesterdayHeartNotice = "❤️ 누군가 당신의 어제에 마음을 보냈어요."
    static let heartNotice = "❤️ 당신이 보내준 코멘트가 누군가의 마음에 닿았어요."
    static let allNotice = "📢 좋은 소식이 있어요! 클릭하여 확인해 주세요!"
    
    static let allNoticeContent = "📢 좋은 소식이 있어요! 클릭하여 확인해 주세요!\n\n안녕하세요. 여러분 하루공유가 정말 좋은 소식을 들려주려 합니다. OO 이벤트를 통해 좀 더 여러분의 하루를 풍요롭게 하려 합니다.\n\n참여 방법은 하단에 더욱 자세히 나와있으니 참고 부탁드려요. ;)"
}

struct HomeMain {
    static let myTodayTitle = "나의 오늘"
    
    static let myYesterdayTitle = "나의 어제"
    
    static let someoneYesterdayTitle = "누군가의 어제"
    static let someoneYesterdayContent = "하고 싶은 일이 있는데 뜻대로 되지 않아요. 친구들은 그저 제 배경만 보고 부러워 하지만 그 안에서의 저는 죽을 맛입니다."
    
    static let textViewPlaceHolder = "누군가에게 털어놓고 싶은 일이\n있었나요?"
    static let commentTextViewPlaceHolder = "앱의 발전을 위해 좋은 의견 많이 부탁드\n려요. :)"
}


struct MyToday {
    static let contentCount = "0/100"
    static let contentSend = "보내기"
    
    static let todayDate = "yy년 MM월 dd일"
    static let characterCount = "100"
    static let fullCharacterCount = "500"
}


struct MyYesterday {
    static let yesterdayDate = "00년 00월 00일"
    
    static let emptyState = "어제는 이야기를 들려주지 않았어요."
    
    static let contentLabel = "오늘은 상사에게 후배에게 하루종일 시달려서 지쳤어요. 중간에 껴서 새우등 터지고 있는데 어디가서 말해봤자 제 이미지만 안좋아지겠죠?"
}

struct OthersYesterday {
    static let emptyState = "나의 오늘을 공유하면 누군가의\n이야기를 들을 수 있어요."
    static let allDeleteEmptyState = "모든 이야기를 확인했어요."
    
    static let date = "00년 00월 00일"
    
    static let contentCount = "0/50"
    static let contentSend = "보내기"
    
    static let characterCount = "50"
    static let fullCharacterCount = "300"
    
    static let textViewPlaceHolder = "누군가에게 들려주고 싶은 한마디가 있나요?"
}


struct BundleStory {
    static let myThatDayTitle = "나의 그날"
    static let othersThatDayTitle = "누군가의 그날"
    
    static let myThatDayDate = "00년 00월 00일"
    static let myThatDayContent = "오늘은 상사에게 후배에게 하루종일 시달려서 지쳤어요. 중간에 껴서 새우등 터지고 있는데 어디가서 말해봤자 제 이미지만 안 좋아지겠죠?"
    static let myThatDayEmptyState = "이날은 이야기를 들려주지 않았어요."
    
    static let othersThatDayEmptyState = "비어 있어요."
}


struct Settings {
    
    static let settingLabel = "시스템 설정"
    static let alertLabel = "알림"
    
    static let csLabel = "고객 센터"
    static let commentLabel = "의견 보내기"
    static let faqLabel = "FAQ"
    static let cheerLabel = "응원하기"
    
    static let appInfoLabel = "앱 정보"
    static let tosLabel = "이용 약관"
    static let privacyLabel = "개인정보 처리 방침"
    static let openLabel = "오픈소스 라이센스"
    
    static let appVersionLabel = "앱 버전"
    static let appVersion = "v 1.0"
    static let logoutLabel = "로그아웃"
    static let unregisterLabel = "회원 탈퇴"
    
    
    static let commentCount = "0/100"
    static let commentSend = "보내기"
    
    static let tosContent = "제 1장 총칙\n\n제 1조 목적\n본 약관은 하루 공유(이하 “회사”라고 합니다)가 제공하는 하루 공유 서비스 이용과 관련하여 “회원”과 “회사”간에 필요한 권리, 의무 및 책임사항, 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.\n\n제 2조 정의\n① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.\n1. 서비스”라 함은 설치되어 있는 단말기(PC, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 “회원”이 이용할 수 있는 하루 공유 및 하루 공유 관련 제반 서비스를 의미합니다.\n2. “회원”라 함은 “회사”의 서비스에 접속하여 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용하는 고객을 말합니다.\n3. “회원”이라 함은 “회사”와 이용계약을 체결하고“이용자” 아이디(ID)를 부여받은 “이용자”로서 “회사”의 정보를 지속적으로 제공받으며 “회사”가 제공하는 서비스를 지속적으로 이용할 수 있는 자를 말합니다.\n4. 아이디(ID)”라 함은 “회원”의 식별과 “서비스” 이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자와 숫자의 조합을 의미합니다.\n5. “비밀번호”라 함은 “회원”이 부여 받은 “아이디와 일치되는 “회원”임을 확인하고 비밀보호를 위해 “회원” 자신이 정한 문자 또는 숫자의 조합을 의미합니다.\n6. “아이디(ID)”라 함은 “회원”의 식별과 서비스이용을 위하여 “회원”이 정하고 “회사”가 승인하는 문자 또는 숫자의 조합을 말합니다.\n7. “게시물”이라 함은 “회원”이 “서비스”를 이용함에 있어 “서비스상”에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.\n\n제 3조 약관의 게시와 개정\n① “회사”는 본 약관의 내용을 “회원”이 쉽게 알 수 있도록 “하루 공유”의 초기화면 또는 연결화면을 통하여게시합니다.\n② “회사”는 필요한 경우 관련법령을 위반하지 않는 범위 내에서 본 약관을 개정할 수 있습니다.\n③ “회사”가 약관을 개정할 경우에는 적용일자 및 개정 사유를 명시하여 현행약관과 함께 서비스 초기화면에 그 적용일자 7일 이전부터 적용일 후 상당한 기간동안 공지하고, 기존 회원에게는 개정약관을 전자우편주소로 발송합니다.\n④ “회사”가 전항에 따라 공지하면서 “회원”에게 적용일자 전 일까지 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지하거나 통지하였음에도 “회원”이 명시적으로 거부 의사표시를 하지 않은 경우 “회원”이 개정 약관에 동의 한 것으로 봅니다.\n⑤ “회원”은 개정 약관에 동의하지 않는 경우 적용일자 전 일까지 “회사”에 거부 의사를 표시하고 “회원” 탈퇴를 할 수 있습니다.\n\n제 2장 회원 가입\n\n제 4조 회원 가입\n① 회원가입은 “이용자”가 약관의 내용에 대하여 동의를 하고 회원가입신청을 한 후 “회사”가 이러한 신청에 대하여 승낙함으로써 체결됩니다.\n② 회원가입신청서에는 다음 사항을 기재해야 합니다.1호 내지 3호의 사항은 필수사항이며, 그 외의 사항은 선택사항입니다.\n1. “회원”의 성명과 주민등록번호 또는 인터넷상 개인식별번호\n2. “아이디”와 “비밀번호”\n3. 전자우편주소\n4. 이용하려는 “콘텐츠”의 종류\n5. 기타 “회사”가 필요하다고 인정하는 사항\n③ “회사”는 상기 “이용자”의 신청에 대하여 회원가입을 승낙함을 원칙으로 합니다. 다만, “회사”는 다음각 호에 해당하는 신청에 대하여는 승낙을 하지 않을 수 있습니다.\n1. 가입신청자가 이 약관에 의하여 이전에 회원자격을\n상실한 적이 있는 경우\n2. 실명이 아니거나 타인의 명의를 이용한 경우\n3. 허위의 정보를 기재하거나, 회사가 제시하는 내용을\n기재하지 않은 경우\n4. 이용자의 귀책사유로 인하여 승인이 불가능하거나\n기타 규정한 제반 사항을 위반하며 신청하는 경우\n④ “회사”는 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.\n⑤ 제3항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, “회사”는 이를 신청자에게 알려야 합니다. “회사”의 귀책사유 없이 신청자에게 통지 할 수 없는 경우에는 예외로 합니다.\n⑥ 회원가입계약의 성립 시기는 “회사”의 승낙이 “이용자”에게 도달한 시점으로 합니다.\n\n 제 5조 회원정보의 변경\n① “회원”은 개인정보관리화면을 통하여 언제든지 자신의 개인정보를 열람하고 수정할 수 있습니다.\n② “회원”은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 “회사”에 대하여 그 변경사항을 알려야 합니다.\n③ 제2항의 변경사항을 “회사”에 알리지 않아 발생한 불이익에 대하여 “회사”는 책임지지 않습니다.\n\n제 6조 “회원”의 “아이디” 및 “비밀번호”의 관리에 대한 의무\n① “회원”의 “아이디”와 “비밀번호”에 관한 관리책임은 “회원”에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.\n② “회원”은 “아이디” 및 “비밀번호”가 도용되거나 제3자에 의해 사용되고 있음을 인지한 경우에는 이를 즉시 “회사”에 통지하고 “회사”의 안내에 따라야 합니다.\n③ 제2항의 경우에 해당 “회원”이 “회사”에 그 사실을 통지하지 않거나, 통지한 경우에도 “회사”의 안내에 따르지 않아 발생한 불이익에 대하여 “회사”는 책임지지 않습니다.\n\n제 7조 “회원”에 대한 통지\n① “회사”가 “회원”에 대한 통지를 하는 경우 “회원”이 지정한 전자우편주소로 할 수 있습니다.\n② “회사”는 “회원” 전체에 대한 통지의 경우 7일 이상 “회사”의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다. 다만, “회원” 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 제1항의 통지를 합니다.\n\n제 8조 회원탈퇴 및 자격 상실 등\n① “회원”은 “회사”에 언제든지 탈퇴를 요청할 수 있으며 “회사”는 즉시 회원탈퇴를 처리합니다.\n② “회원”이 다음 각호의 사유에 해당하는 경우, “회사”는 회원자격을 제한 및 정지시킬 수 있습니다.\n1. 가입신청 시에 허위내용을 등록한 경우\n2. “회사”의 서비스이용대금, 기타 “회사”의 서비스이용에 관련하여 회원이 부담하는 채무를 기일에 이행하지 않는 경우\n3. 다른 사람의 “회사”의 서비스이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우\n4. “회사”를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우\n③ “회사”가 회원자격을 제한·정지시킨 후, 동일한 행위가 3회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “회사”는 회원자격을 상실시킬 수 있습니다.\n④ “회사”가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 “회원”에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.\n\n제3장 콘텐츠이용계약\n\n제 9조 “콘텐츠”의 내용 등의 게시\n① “회사”는 다음 사항을 해당 “콘텐츠”의 이용초기화면이나 그 포장에 “회원”이 알기 쉽게 표시합니다.\n1. “콘텐츠”의 명칭 또는 제호\n2. “콘텐츠”의 제작 및 표시 연월일\n3. “콘텐츠” 제작자의 성명(법인인 경우에는 법인의 명칭), 주소, 전화번호\n4. “콘텐츠”의 내용, 이용방법, 이용료 기타 이용조건\n② “회사”는 “콘텐츠”별 이용가능기기 및 이용에 필요한 최소한의 기술사양에 관한 정보를 계약제 8조 회원탈퇴 및 자격 상실 등체결과정에서 “이용자”에게 제공합니다.\n\n제 10조 이용계약의 성립 등\n① “회원”은 “회사”가 제공하는 다음 또는 이와 유사한 절차에 의하여 이용신청을 합니다. “회사”는 계약 체결 전에 각 호의 사항에 관하여 “이용자”가 정확하게 이해하고 실수 또는 착오 없이 거래할 수 있도록 정보를 제공합니다.\n1. “콘텐츠” 목록의 열람 및 선택\n2. 성명, 주소, 전화번호(또는 이동전화번호), 전자우편주소 등의 입력\n3. 약관내용, 청약철회가 불가능한 “콘텐츠”에 대해 “회사”가 취한 조치에 관련한 내용에 대한 확인\n4. 이 약관에 동의하고 위 제3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)\n5. “콘텐츠”의 이용신청에 관한 확인 또는 “회사”의 확인에 대한 동의\n6. 결제방법의 선택\n② “회사”는 “이용자”의 이용신청이 다음 각 호에 해당하는 경우에는 승낙하지 않거나 승낙을 유보할 수 있습니다.\n1. 실명이 아니거나 타인의 명의를 이용한 경우\n2. 허위의 정보를 기재하거나, “회사”가 제시하는 내용을 기재하지 않은 경우\n3. 미성년자가 청소년보호법에 의해서 이용이 금지되는 “콘텐츠”를 이용하고자 하는 경우\n4. 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우\n③ “회사”의 승낙이 제12조 제1항의 수신확인통지형태로 “이용자”에게 도달한 시점에 계약이 성립한 것으로 봅니다.\n④ “회사”의 승낙의 의사표시에는 “이용자”의 이용신청에 대한 확인 및 서비스제공 가능여부, 이용신청의 정정·취소 등에 관한 정보 등을 포함합니다.\n\n제 11조 미성년자 이용계약에 관한 특칙\n“회사”는 만 20세 미만의 미성년이용자가 유료서비스를 이용하고자 하는 경우에 부모 등 법정 대리인의 동의를 얻거나, 계약체결 후 추인을 얻지 않으면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있다는 내용을 계약체결 전에 고지하는 조치를 취합니다.\n\n제 12조 수신확인통지·이용신청 변경 및 취소\n① “회사”는 “이용자”의 이용신청이 있는 경우 “이용자”에게 수신확인통지를 합니다.\n② 수신확인통지를 받은 “이용자”는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 이용신청 변경 및 취소를 요청할 수 있고, “회사”는 서비스제공 전에 “이용자”의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만, 이미 대금을 지불한 경우에는 청약철회 등에 관한 제 23조의 규정에 따릅니다.\n\n제 13조 “회사”의 의무\n① “회사”는 법령과 이 약관이 정하는 권리의 행사와 의무의 이행을 신의에 좇아 성실하게 하여야 합니다.\n② “회사”는 “이용자”가 안전하게 “콘텐츠”를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보보호정책을 공시하고 준수합니다.\n④ “회사”는 콘텐츠이용과 관련하여 “이용자”로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 지체없이 처리합니다. 이용자가 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 그 처리과정 및 결과를 전달합니다.\n\n제 14조 “이용자”의 의무\n① “이용자”는 다음 행위를 하여서는 안 됩니다.\n1. 신청 또는 변경 시 허위내용의 기재\n2. 타인의 정보도용\n3. “회사”에 게시된 정보의 변경\n4. “회사”가 금지한 정보(컴퓨터 프로그램 등)의 송신 또는 게시\n5. “회사”와 기타 제3자의 저작권 등 지적재산권에 대한 침해\n6. “회사” 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위\n7. 외설 또는 폭력적인 말이나 글, 화상, 음향, 기타 공서양속에 반하는 정보를 “회사”의 사이트에 공개 또는 게시하는 행위\n8. 기타 불법적이거나 부당한 행위\n② “이용자”는 관계법령, 이 약관의 규정, 이용안내 및 “콘텐츠”와 관련하여 공지한 주의사항, “회사”가 통지하는 사항 등을 준수하여야 하며, 기타 “회사”의 업무에 방해되는 행위를 하여서는 안 됩니다.\n\n제 15조 지급방법\n“콘텐츠”의 이용에 대한 대금지급방법은 다음 각 호의 방법 중 가능한 방법으로 할 수 있습니다. 다만, “회사”는 “이용자”의 지급방법에 대하여 어떠한 명목의 수수료도 추가하여 징수하지 않습니다.\n1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체\n2. 선불카드, 직불카드, 신용카드 등의 각종 카드결제\n3. 온라인무통장입금\n4. 전자화폐에 의한 결제\n5. 마일리지 등 “회사”가 지급한 포인트에 의한 결제\n6. “회사”와 계약을 맺었거나 “회사”가 인정한 상품권에 의한 결제\n7. 전화 또는 휴대전화를 이용한 결제\n8. 기타 전자적 지급방법에 의한 대금지급 등\n\n제 16조 콘텐츠서비스의 제공 및 중단\n① 콘텐츠서비스는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.\n② “회사”는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 콘텐츠서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 “회사”는 제 7조[“회원”에 대한 통지]에 정한 방법으로 “이용자”에게 통지합니다. 다만, “회사”가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.\n③ “회사”는 콘텐츠서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.\n④ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 콘텐츠서비스를 제공할 수 없게 되는 경우에는 “회사”는 제 7조[“회원”에 대한 통지]에 정한 방법으로 “이용자”에게 통지합니다.\n\n제 17조 콘텐츠서비스의 변경\n① “회사”는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 콘텐츠서비스를 변경할 수 있습니다.\n② “회사”는 콘텐츠서비스의 내용, 이용방법, 이용시간을 변경할 경우에 변경사유, 변경될 콘텐츠서비스의 내용 및 제공일자 등을 그 변경 전 7일 이상 해당 콘텐츠초기화면에 게시합니다.\n③ 제2항의 경우에 변경된 내용이 중대하거나 “이용자”에게 불리한 경우에는 “회사”가 해당 콘텐츠서비스를 제공받는 “이용자”에게 제 7조[“회원”에 대한 통지]에 정한 방법으로 통지하고 동의를 받습니다. 이때, “회사”는 동의를 거절한 “이용자”에 대하여는 변경전 서비스를 제공합니다. 다만, 그러한 서비스 제공이 불가능할 경우 계약을 해지할 수 있습니다.\n\n제 18조 정보의 제공 및 광고의 게재\n① “회사”는 “이용자”가 콘텐츠이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 “회원”에게 제공할 수 있습니다. 다만, “회원”은 언제든지 전자우편 등을 통하여 수신 거절을 할 수 있습니다.\n② 제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 “회원”의 사전 동의를 받아서 전송합니다.\n③ “회사”는 “콘텐츠”서비스 제공과 관련하여 콘텐츠화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편 등을 수신한 “회원”은 수신거절을 “회사”에게 할 수 있습니다.\n\n제 19조 게시물의 삭제\n① “회사”는 게시판에 정보통신망이용촉진 및 정보보호 등에 관한 법률을 위반한 청소년유해매체물이 게시되어 있는 경우에는 이를 지체 없이 삭제 합니다. 다만, 19세 이상의 “이용자”만 이용할 수 있는 게시판은 예외로 합니다.\n② “회사”가 운영하는 게시판 등에 게시된 정보로 인하여 법률상 이익이 침해된 자는 “회사”에게 당해 정보의 삭제 또는 반박내용의 게재를 요청할 수 있습니다. 이 경우 “회사”는 지체 없이 필요한 조치를 취하고 이를 즉시 신청인에게 통지합니다.\n\n제 20조 저작권 등의 귀속\n① “회원”이 “하루 공유” 내에 게시 또는 등록한 콘텐츠에 대해서는 “회원”이 저작권을 포함한 지적재산권을 갖습니다.\n② “회사”가 제공하는 “하루 공유”에 관련된 모든 상표, 서비스 마크, 로고 등에 관한 저작권 기타 지적재산권은 “회사”가 갖습니다.\n③ “회사”는 “회원”이 게시한 콘텐츠를 “회사”가 제공하는 “하루 공유를 포함한 “회사”가 제공하는 “API”를 활용한 제3자의 서비스에 노출할 수 있으며, 이와 관련된 프로모션 등에도 노출할 수 있습니다. 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집할 수 있습니다.\n④ “회사”는 저작권법 규정을 준수하며, “회원”은 언제든지 “회사”의 고객센터를 통해 저작권법 위반 콘텐츠에 대해 삭제, 비공개 등의 조치를 요청할 수 있습니다.\n⑤ “회사”가 “회원”에 대해 “하루 공유”를 제공하는 것은 본 약관에 정한 목적 하에서 “회사”가 허용한 방식으로 “하루 공유”에 대한 이용권한을 부여하는 것이며, “회원”은 “하루 공유”를 소유하거나 “하루 공유”에 관한 저작권을 보유하게 되는 것이 아닙니다.\n⑥ “회사”는 “회사”가 정한 이용조건에 따라 “회원”에게 “하루 공유를 이용할 수 있는 이용권한만을 부여하며, “회원”은 해당 권리를 제3자에게 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.\n⑦ “회사”는 “회원”의 “하루 공유” 이용 사실을 소개하기 위한 목적으로 “회원”의 닉네임, 로고, 콘텐츠를 별도의 비용 없이 게시할 수 있습니다. 다만, “회원”의 요청 시 상호 협의 하에 게시를 중단하거나 수정하여 다시 게재할 수 있습니다.\n\n제 21조 개인정보보호\n① “회사”는 제4조 제2항의 신청서기재사항 이외에 “이용자”의 콘텐츠이용에 필요한 최소한의 정보를 수집할 수 있습니다. 이를 위해 “회사”가 문의한 사항에 관해 “이용자”는 진실한 내용을 성실하게 고지하여야 합니다.\n② “회사”가 “이용자”의 개인 식별이 가능한 “개인정보”를 수집하는 때에는 당해 “이용자”의 동의를 받습니다.\n③ “회사”는 “이용자”가 이용신청 등에서 제공한 정보와 제1항에 의하여 수집한 정보를 당해 “이용자”의 동의 없이 목적 외로 이용하거나 제3자에게 제공할 수 없으며, 이를 위반한 경우에 모든 책임은 “회사”가 집니다. 다만, 다음의 경우에는 예외로 합니다.\n1. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우\n2. “콘텐츠” 제공에 따른 요금정산을 위하여 필요한 경우\n3. 도용방지를 위하여 본인확인에 필요한 경우\n4. 약관의 규정 또는 법령에 의하여 필요한 불가피한 사유가 있는 경우\n④ “회사”가 제 2항과 제 3항에 의해 “이용자”의 동의를 받아야 하는 경우에는 “개인정보”관리책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제 3자에 대한 정보제공관련사항(제공받는 자, 제공목적 및 제공할 정보의 내용)등에 관하여 정보통신망이용촉진 및 정보보호 등에 관한 법률 제 18조 제 2항이 규정한 사항을 명시하고 고지하여야 합니다.\n⑤ “이용자”는 언제든지 제 3항의 동의를 임의로 철회할 수 있습니다.\n⑥ “이용자”는 언제든지 “회사”가 가지고 있는 자신의 “개인정보”에 대해 열람 및 오류의 정정을 요구할 수 있으며, “회사”는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. “이용자”가 오류의 정정을 요구한 경우에는 “회사”는 그 오류를 정정할 때까지 당해 “개인정보”를 이용하지 않습니다.\n⑦ “회사”는 개인정보보호를 위하여 관리자를 한정하여 그 수를 최소화하며, 신용카드, 은행계좌 등을 포함한 “이용자”의 “개인정보”의 분실, 도난, 유출, 변조 등으로 인한 “이용자”의 손해에 대하여 책임을 집니다.\n⑧ “회사” 또는 그로부터 “개인정보”를 제공받은 자는 “이용자”가 동의한 범위 내에서 “개인정보”를 사용할 수 있으며, 목적이 달성된 경우에는 당해 “개인정보”를 지체 없이 파기합니다.\n⑨ “회사”는 정보통신망이용촉진 및 정보보호에 관한 법률 등 관계 법령이 정하는 바에 따라 “이용자”의 “개인정보”를 보호하기 위해 노력합니다. “개인정보”의 보호 및 사용에 대해서는 관련법령 및 “회사”의 개인정보보호정책이 적용됩니다.\n\n제4장 콘텐츠이용계약의 청약철회, 계약해제·해지 및 이용중단, 이용제한 등\n\n제 22조 “이용자”의 청약철회와 계약해제·해지\n① “회사”와 “콘텐츠”의 이용에 관한 계약을 체결한 “이용자”는 수신확인의 통지를 받은 날로부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, “회사”가 다음 각 호중 하나의 조치를 취한 경우에는 “이용자”의 청약철회권이 제한될 수 있습니다.\n1. 청약의 철회가 불가능한 “콘텐츠”에 대한 사실을 표시사항에 포함한 경우\n2. 시용상품을 제공한 경우\n3. 한시적 또는 일부이용 등의 방법을 제공한 경우\n② “이용자”는 다음 각 호의 사유가 있을 때에는 당해 “콘텐츠”를 공급받은 날로부터 3월 이내 또는 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 콘텐츠이용계약을 해제·해지할 수 있습니다.\n1. 이용계약에서 약정한 “콘텐츠”가 제공되지 않는 경우\n2. 제공되는 “콘텐츠”가 표시·광고 등과 상이하거나 현저한 차이가 있는 경우\n3. 기타 “콘텐츠”의 결함으로 정상적인 이용이 현저히 불가능한 경우\n③ 제1항의 청약철회와 제2항의 계약해제·해지는 “이용자”가 전화, 전자우편 또는 모사전송으로 “회사”에 그 의사를 표시한 때에 효력이 발생합니다.\n④ “회사”는 제3항에 따라 “이용자”가 표시한 청약철회 또는 계약해제·해지의 의사표시를 수신한 후 지체 없이 이러한 사실을 “이용자”에게 회신합니다.\n⑤ “이용자”는 제2항의 사유로 계약해제·해지의 의사표시를 하기 전에 상당한 기간을 정하여 완전한 “콘텐츠” 혹은 서비스이용의 하자에 대한 치유를 요구할 수 있습니다.\n\n제 23조 “이용자”의 청약철회와 계약해제·해지의 효과\n① “회사”는 “이용자”가 청약철회의 의사표시를 한 날로부터 또는 “이용자”에게 계약해제·해지의 의사표시에 대하여 회신한 날로부터 3영업일 이내에 대금의 결제와 동일한 방법으로 이를 환급하여야 하며, 동일한 방법으로 환불이 불가능할 때에는 이를 사전에 고지하여야 합니다. 이 경우 “회사”가 “이용자”에게 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.\n② “회사”가 제1항에 따라 환급할 경우에 “이용자”가 서비스이용으로부터 얻은 이익에 해당하는 금액을 공제하고 환급할 수 있습니다.\n③ “회사”는 위 대금을 환급함에 있어서 “이용자”가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다. 다만, 제2항의 금액공제가 필요한 경우에는 그러하지 아니할 수 있습니다.\n④ “회사”, “콘텐츠 등의 대금을 지급 받은 자” 또는 “이용자와 콘텐츠이용계약을 체결한 자”가 동일인이 아닌 경우에 각자는 청약철회 또는 계약해제·해지로 인한 대금환급과 관련한 의무의 이행에 있어서 연대하여 책임을 집니다.\n⑤ “회사”는 “이용자”에게 청약철회를 이유로 위약금 또는 손해배상을 청구하지 않습니다. 그러나 “이용자”의 계약해제·해지는 손해배상의 청구에 영향을 미치지 않습니다.\n\n제 24조 회사의 계약해제·해지 및 이용제한\n① “회사”는 “이용자”가 제12조 제2항에서 정한 행위를 하였을 경우 사전통지 없이 계약을 해제·해지하거나 또는 기간을 정하여 서비스이용을 제한할 수 있습니다.\n② 제1항의 해제·해지는 “회사”가 자신이 정한 통지방법에 따라 “이용자”에게 그 의사를 표시한 때에 효력이 발생합니다.\n③ “회사”의 해제·해지 및 이용제한에 대하여 “이용자”는 “회사”가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 “회사”가 인정하는 경우, “회사”는 즉시 서비스의 이용을 재개합니다.\n\n제 25조 회사의 계약해제·해지의 효과\n“이용자”의 귀책사유에 따른 이용계약의 해제·해지의 효과는 제27조를 준용합니다. 다만, “회사”는 “이용자”에 대하여 계약해제·해지의 의사표시를 한 날로부터 7영업일 이내에 대금의 결제와 동일한 방법으로 이를 환급합니다.\n\n제 26조 면책조항\n① “회사”는 천재지변 또는 이에 준하는 불가항력으로 인하여 “콘텐츠”를 제공할 수 없는 경우에는 “콘텐츠” 제공에 관한 책임이 면제됩니다.\n② “회사”는 “이용자”의 귀책사유로 인한 콘텐츠이용의 장애에 대하여는 책임을 지지 않습니다.\n③ “회사”는 “회원”이 “콘텐츠”와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.\n④ “회사”는 “이용자” 상호간 또는 “이용자”와 제3자 간에 “콘텐츠”를 매개로 하여 발생한 분쟁 등에 대하여 책임을 지지 않습니다.\n\n제 27조 분쟁의 해결\n“회사”는 분쟁이 발생하였을 경우에 “이용자”가 제기하는 정당한 의견이나 불만을 반영하여 적절하고 신속한 조치를 취합니다. 다만, 신속한 처리가 곤란한 경우에 “회사”는 “이용자”에게 그 사유와 처리일정을 통보합니다."
    
    static let privacyMain = "개인정보 처리 방침"
    static let privacyContent = "하루공유는 고객의 개인정보를 소중히 다루고 관련 법령을 준수하고 있습니다. 회사는 개인정보보호법 등 관련 법령에 따라 개인정보처리방침을 수립한 뒤 홈페이지에 공개하여 고객이 언제나 용이하게 열람할 수 있도록 하고 있습니다.\n\n제 1조 개인정보의 수집 및 이용에 관한 안내\n회사는 아래와 같이 제공하는 서비스에 따라 개인정보의 수집목적, 항목, 보유 및 이용기간을 달리하여 서비스 제공을 위하여 필요한 최소한의 개인정보를 수집하고 있습니다."
    
    static let openContent = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
    static let unregisterContent = " 회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.\n\n· 사용하고 계신 이메일 로그인 정보는 탈퇴할 경우 하루 동안 재가입이 불가능합니다.\n\n· 탈퇴 후 회원 정보 및 서비스 이용기록은 모두 삭제되어 복구가 불가능합니다.\n· 삭제된 데이터는 복구되지 않습니다. 삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업해주세요.\n· 삭제정보: SNS 로그인 정보, 닉네임, 나의 그날 게시물, 다른 사람의 게시물에 반응한 좋아요 및 코멘트 기록"
    static let unregisterCheckLabel = "안내 사항을 모두 확인했으며 이에 동의합니다."
}


struct ToastMessage {
    static let heartToast = "당신의 마음을 전달했습니다."
    static let sendToast = "전송이 완료됐습니다."
    static let adToast = "최대 300자를 작성해보세요."
    static let myTodayAdToast = "최대 500자를 작성해보세요."
    static let reportToast = "신고가 완료됐습니다."
    static let trashToast = "삭제가 완료됐습니다."
    static let sendCommentToast = "의견이 접수됐습니다."
    
    static let adButton = "광고 보기"
}


struct AlertMessage {
    static let othersAdMessage = "광고를 보면 최대 300자까지 더 많은\n마음속 이야기를 적을 수 있어요."
    static let myTodayAdMessage = "광고를 보면 최대 500자까지 더 많은\n마음속 이야기를 적을 수 있어요."
    
    static let myTodaySendMessage = "나의 오늘을 누군가에게 보낼까요?\n분명 나의 이야기를 잘 들어줄\n누군가에게 도착할 거예요."
    static let commentSendMessage = "이야기를 누군가에게 보낼까요?\n이야기를 전달받은 누군가의 마음은 따뜻해질 거예요."
    static let commentMessage = "의견을 보낼까요?\n주신 의견들은 꼼꼼히 읽어볼게요."
    
    static let reportMessage = "누군가의 이야기로 불쾌했나요?\n게시물을 즉시 삭제하고, 검토를 통해\n해당 사용자를 제재할게요."
   
    static let modifyMessage = "이야기를 수정하겠어요?\n누군가는 이미 수정 전 이야기를\n확인했을 수도 있어요."
    
    static let logoutMessage = "로그아웃 하겠어요?"
    static let unregisterMessage = "정말 탈퇴하겠어요?"
    
    static let commentDeleteMessage = "누군가의 이야기가 맘에 들지 않나요?\n지금 즉시 삭제할 수 있어요."
    static let sendDeleteMessage = "다른 이야기를 적어보고 싶은가요?\n삭제하면 해당 이야기는 누군가에게\n전해지지 않으며, 복구가 어려워요."
    static let myTodayDeleteMessage = "다른 이야기를 적어보고 싶은가요?\n삭제하면 해당 이야기는 누군가에게\n전해지지 않으며, 복구가 어려워요."
    static let deleteMessage = "이야기를 지우고 싶은가요?\n삭제하면 복구가 어려워요."
    
    static let cancelButton = "취소"
    static let sendButton = "보내기"
    static let reportButton = "신고하기"
    static let adButton = "광고 보기"
    static let modifyButton = "수정하기"
    static let deleteButton = "삭제하기"
    static let logoutButton = "로그아웃"
    static let unregisterButton = "탈퇴"
}
