//
//  Label.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/28.
//

import UIKit

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

struct BundleStory {
    static let myThatDayTitle = "나의 그날"
    static let someoneThatDayTitle = "누군가의 그날"
}

struct Settings {
    static let unregisterContent = " 회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.\n\n· 사용하고 계신 이메일 로그인 정보는 탈퇴할 경우 하루 동안 재가입이 불가능합니다.\n\n· 탈퇴 후 회원 정보 및 서비스 이용기록은 모두 삭제되어 복구가 불가능합니다.\n· 삭제된 데이터는 복구되지 않습니다. 삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업해주세요.\n· 삭제정보: SNS 로그인 정보, 닉네임, 나의 그날 게시물, 다른 사람의 게시물에 반응한 좋아요 및 코멘트 기록"
}

struct ToastMessage {
    static let heartToast = "당신의 마음을 전달했습니다."
    static let trashToast = "삭제가 완료됐습니다."
    static let sendToast = "전송이 완료됐습니다."
    static let reportToast = "신고가 완료됐습니다."
}

struct AlertMessage {
    static let trashMessage = "다른 이야기를 적어보고 싶은가요?\n삭제하면 해당 이야기는 누군가에게\n전해지지 않으며, 복구가 어려워요."
    static let sendMessage = ""
    static let reportMessage = ""
    static let modifyMessage = "이야기를 수정하겠어요?\n누군가는 이미 수정 전 이야기를\n확인했을 수도 있어요."
}


