extends Node

func _ready() -> void:
	for i in 78:
		if text[i].size()<=3:
			text[i].append(["0安排好了","1谢谢医生"])
			text[i].append(["0治不了","1那我走"])
	for i in 78:
		if text[i].size()<=5:
			text[i].append([
				"喝很多咖啡,翻来覆去睡不着",
				["咖啡","睡不着"]
			])

func read_text():
	var f = FileAccess.open("res://CSV/text.csv",FileAccess.WRITE_READ)
	for i in 78:
		var arr:Array = text[i]
		f.store_csv_line(PackedStringArray(arr))

var text:Dictionary = {
	0:#shangxue#2,3,6,1,1
		[
			[
				"1医生我整天整夜地睡不着",
				"1我应该怎么办?"
			],[
				"0有什么原因呢?",
				"1学习压力好大",
				"1焦虑得睡不着"
			],[
				"0可以阅读或听音乐",
				"0有助于缓解压力",
				"1好的谢谢医生",
				"1我会尝试"
			],[
				"0安排好了",
				"1谢谢医生"
			],[
				"0治不了",
				"1那我走"
			],[
				"学习压力大,整天整夜睡不着",
				["压力大","睡不着"]
			]
		],
	1:#hekafei#1,3,2,6,1
		[
			[
				"1医生",
				"1我每晚躺床上翻来覆去睡不着",
				"1我想睡觉"
			],[
				"0白天会不会喝很多咖啡呢?",
				"1每天三四杯,不喝会困"
			],[
				"0减少咖啡量,晚饭后完全避免",
				"1那我试着戒掉晚上的咖啡",
				"0睡前保持安静放松很重要",
				"1明白了,谢谢医生!"
			],[
				"0安排好了",
				"1谢谢医生"
			],[
				"0治不了",
				"1那我走"
			],[
				"喝很多咖啡,翻来覆去睡不着",
				["咖啡","睡不着"]
			]
		],
	2:#renchuang#3,4,4,1,1
		[
			[
				"1医生,我最近换地方住",
				"1睡不着",
				"0新环境让您觉得不适应吗?",
				"1房间陌生,总觉得不舒服"
			],[
				"0晚上房间灯光和声音适合吗?",
				"1有点亮,还能听到外面车声"
			],[
				"0可以试试遮光窗帘和耳塞",
				"1好的,我买来试一下"
			],[
				"0可以试试遮光窗帘和耳塞",
				"1好的,我买来试一下"
			],[
				"0治不了",
				"1那我走"
			]
		],
	3:#emeng#
		[
			[
				"1我经常梦到从高处掉下",
				"1非常惊恐"
			],[
				"0这种梦是最近才开始的吗?",
				"1是的",
				"1最近常加班,睡得也很少"
			],[
				"0调整睡眠时间",
				"0避免过度疲劳",
				"1作息调整后会改善吗",
				"0会的",
				"0睡眠规律有助缓解噩梦",
				"1明白了,谢谢医生!"
			],[
				"0安排好了",
				"1谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	4:
		[
			[
				"1我老是梦到亲人受伤,很害怕"
			],[
				"0白天是否会担心家人安全?",
				"1是的,总害怕一些意外发生"
			],[
				"0多和家人联系",
				"0安心后梦境会更平和",
				"1好的,谢谢您的建议!"
			],[
				"0多和家人联系",
				"0安心后梦境会更平和",
				"1好的,谢谢您的建议!"
			],[
				"0治不了",
				"1那我走"
			]
		],
	5:
		[
			[
				"1医生,我梦到被困住",
				"1醒后胸口很闷"
			],[
				"0梦境可能和压力或环境有关",
				"0最近如何",
				"1最近工作压力很大",
				"1常常感觉喘不过气"
			],[
				"0每天给自己留些独处时间",
				"0深呼吸放松",
				"1我会尝试调整",
				"1谢谢医生"
			],[
				"0安排好了",
				"1谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	6:#yejing
		[
			[
				"1医生,我常半夜惊醒",
				"1特别害怕",
				"0醒来时能记得梦见什么吗",
				"1记不清",
				"1就是突然惊醒,心跳很快"
			],[
				"0可能是夜惊症",
				"0晚上有压力吗?",
				"1是的,最近有家庭矛盾",
				"1很困扰"
			],[
				"0建议晚上睡前深呼吸",
				"0做些放松练习",
				"1好的,我试试,谢谢医生"
			],[
				"0建议晚上睡前深呼吸",
				"0做些放松练习",
				"1好的,我试试,谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	7:#yejing
		[
			[
				"1我晚上常突然起床,大喊大叫"
			],[
				"0醒来后意识清楚吗",
				"1不太清楚,迷迷糊糊的",
				"0这种夜惊频率如何",
				"1每周三四次,很困扰"
			],[
				"0建议规律作息,早睡早起",
				"1作息规律能减少夜惊吗",
				"0有助于调整生物钟,改善症状",
				"1好的,谢谢医生"
			],[
				"0建议规律作息,早睡早起",
				"1作息规律能减少夜惊吗",
				"0有助于调整生物钟,改善症状",
				"1好的,谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	8:#shoujishimian
		[
			[
				"1医生,我总是失眠",
				"0有什么原因吗",
				"1晚上玩手机停不下来"
			],[
				"0玩多久呢",
				"1差不多玩到凌晨两点"
			],[
				"0建议睡前远离手机",
				"1不看手机,好难入睡",
				"0可以试试阅读或冥想",
				"1好的,我试试,谢谢医生"
			],[
				"0建议睡前远离手机",
				"1不看手机,好难入睡",
				"0可以试试阅读或冥想",
				"1好的,我试试,谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	9:#emengchuangshang
		[
			[
				"1我梦到被困,逃不出来"
			],[
				"0之前有类似经历吗",
				"1有的,小时候迷路过",
				"0是否仍觉得无助",
				"1是的,心里特别压抑"
			],[
				"0尝试放松练习,减少恐惧",
				"1怎么练习呢",
				"0深呼吸,专注当下感觉",
				"1好的,谢谢医生"
			],[
				"0尝试放松练习,减少恐惧",
				"1怎么练习呢",
				"0深呼吸,专注当下感觉",
				"1好的,谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	10:#mengyou
		[
			[
				"1医生,我梦游,很害怕摔倒",
				"0梦游时会跌倒吗",
				"1有时会,很危险"
			],[
				"0这种情况多久了",
				"1有好几个月了",
				"0睡前注意安全环境"
			],[
				"1需要特别注意什么",
				"0移除障碍物,避免危险",
				"1好的,谢谢医生"
			],[
				"1需要特别注意什么",
				"0移除障碍物,避免危险",
				"1好的,谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	11:#chidongxi
		[
			[
				"1医生,室友说我梦游",
				"1他说我半夜跳下床",
				"1光脚做广播体操",
				"1然后只穿裤衩出去",
				"1凉水泡方便面回屋吃",
				"1我该怎么办?"
			],[
				"0梦游频率如何",
				"1几乎每晚都这样"
			],[
				"0睡前避免大餐,保持空腹",
				"1空腹有帮助吗",
				"0可以减少梦游动机",
				"1谢谢医生"
			],[
				"0睡前避免大餐,保持空腹",
				"1空腹有帮助吗",
				"0可以减少梦游动机",
				"1谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	12:#dahu
		[
			[
				"1医生,我睡觉常常喘不过气",
				"0这种情况多久了",
				"1有大半年了"
			],[
				"0有打鼾现象吗",
				"1有,打鼾很严重"
			],[
				"0建议检查睡眠呼吸",
				"1检查后怎么治疗",
				"0可能需要呼吸机辅助",
				"1谢谢医生,我会去检查"
			],[
				"0建议检查睡眠呼吸",
				"1检查后怎么治疗",
				"0可能需要呼吸机辅助",
				"1谢谢医生,我会去检查"
			],[
				"0治不了",
				"1那我走"
			]
		],
	13:
		[
			[
				"1医生,我打呼很严重",
				"1室友说我打呼跟杀猪一样",
				"1经常半夜被室友用拖鞋打醒",
				"1我该怎么办?"
			],[
				"0体重有超标吗",
				"1是的,有些肥胖",
				"0平时有运动习惯吗",
				"1没有,学习太忙"
			],[
				"0建议增加运动,控制体重",
				"1运动能改善呼吸吗",
				"0能缓解睡眠呼吸暂停",
				"1好的,谢谢医生"
			],[
				"0安排好了",
				"1谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	14:
		[
			[
				"1医生，我常常尿床",
				"1我该怎么办?"
			],[
				"0晚上会做噩梦吗",
				"1偶尔会,吓醒后就尿床",
				"1梦到厕所也会尿床"
			],[
				"0睡前试试冥想",
				"1冥想怎么做",
				"0专注呼吸,帮助放松",
				"1谢谢医生,我会练习"
			],[
				"0安排好了",
				"1谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
	15:
		[
			[
				"1医生",
				"1我舍友晚上常扮鬼吓我",
				"1现在我常做噩梦",
				"1怎么办?"
			],[
				"0你舍友有病吗?",
				"1他似乎有梦游症",
				"0(还真有)"
			],[
				"0带你舍友过来",
				"1他马上就来",
				"1谢谢医生"
			],[
				"0我们将尽量缓解你的症状",
				"1谢谢医生"
			],[
				"0治不了",
				"1😓😓😓"
			]
		],
	16:
		[
			[
				"1医生,我不可控制地犯困",
				"1前一秒还在积分",
				"1下一秒就睡着了",
				"1想振作起来，都没有力气"
			],[
				"0从小开始就这样吗?",
				"1是的",
				"1从小时候开始上学就这样",
				"1甚至在高考考场上睡着了"
			],[
				"0给你开了一些特效药",
				"0可能会有帮助",
				"0祝你早日康复",
				"1谢谢医生!"
			],[
				"0给你开了一些特效药",
				"0可能会有帮助",
				"0祝你早日康复",
				"1谢谢医生!"
			],[
				"0治不了",
				"1好吧"
			]
		],
	17:
		[
			[
				"1医生,我常常梦游",
				"1半夜无意识地扮鬼吓舍友",
				"1弄的舍友常做噩梦"
			],[
				"0家人也有梦游症状吗?",
				"1是的,我弟弟也梦游"
			],[
				"0可能有遗传因素的影响",
				"0我们将用专业设备治疗你",
				"1谢谢医生"
			],[
				"0安排好了",
				"1谢谢医生"
			],[
				"0治不了",
				"1好吧"
			]
		],
18:#shimian1
[
[
"1医生,我总是做恶梦",
"1醒来后非常害怕",
"1该怎么办?"
],
[
"0最近有焦虑或压力吗",
"1是的,生活压力很大",
"0有没有尝试过放松训练",
"1没有,不太懂"
],
[
"0试试深呼吸和放松练习",
"1这样有用吗",
"0可以缓解紧张,提高睡眠质量",
"1好的,谢谢医生"
],
[
"0安排好了",
"1谢谢医生"
],
[
"0治不了",
"1那我走"
]
],
19:#s2
[
[
"1医生,我晚上很难入睡",
"1躺下后总是睡不着",
"1怎么办?"
],
[
"0最近是否有情绪低落",
"1是的,感觉很疲惫",
"0白天有不愉快的经历吗",
"1有,总是烦躁"
],
[
"0试试睡前冥想和放松",
"1冥想能帮助入睡吗",
"0能缓解焦虑,帮助平静",
"1好的,谢谢医生"
],
[
"0安排好了",
"1谢谢医生"
],
[
"0治不了",
"1那我走"
]
],
20:#s3
[
[
"1医生,我经常睡不着",
"1常常躺在床上辗转反侧",
"1怎么办?"
],
[
"0晚上有使用电子设备吗",
"1有,总是玩手机",
"0有没有规律作息",
"1没有,作息不规律"
],
[
"0规律作息,减少屏幕时间",
"1作息调整能帮助吗",
"0能改善睡眠质量",
"1好的,谢谢医生"
],
[
"0安排好了",
"1谢谢医生"
],
[
"0治不了",
"1那我走"
]
],
21:#s4
[
[
"1医生,我每天都睡不着",
"1常常累得不行还睡不着",
"1怎么办?"
],
[
"0白天是否有很大压力",
"1有,工作压力很大",
"0有冥想的习惯吗",
"1没有,从未尝试过"
],
[
"0试试睡前冥想放松",
"1冥想能帮助睡眠吗",
"0有助于缓解压力,提高睡眠质量",
"1好的,谢谢医生"
],
[
"0安排好了",
"1谢谢医生"
],
[
"0治不了",
"1那我走"
]
],
22:#s5
[
[
"1医生,我总是半夜醒来",
"1醒来后就很难再入睡",
"1怎么办?"
],
[
"0晚上有吃重的食物吗",
"1没有,只吃了水果",
"0白天运动量大吗",
"1没有,太忙没时间"
],
[
"0增加运动量,调整作息时间",
"1运动能改善吗",
"0能改善睡眠质量,提高入睡速度",
"1好的,谢谢医生"
],
[
"0安排好了",
"1谢谢医生"
],
[
"0治不了",
"1那我走"
]
],
23:#s6
[
[
"1医生,我失眠很严重",
"1每天都睡不好,白天困得厉害",
"1我该怎么办?"
],
[
"0最近压力大吗",
"1有,工作压力大",
"0有没有过度咖啡因摄入",
"1有,晚上喝了咖啡"
],
[
"0减少咖啡因,早睡早起",
"1不喝咖啡能改善吗",
"0会的,有助于稳定睡眠",
"1好的,谢谢医生"
],
[
"0安排好了",
"1谢谢医生"
],
[
"0治不了",
"1那我走"
]
],
24:#e1
	[
		[
			"1医生,我常做噩梦",
			"1梦见被追赶,非常害怕",
			"1总是吓醒,无法入睡"
		],[
			"0梦境内容有变化吗",
			"1没有,都是类似的梦",
			"0白天有压力吗",
			"1有,工作压力大"
		],[
			"0试试放松训练",
			"1什么是放松训练",
			"0深呼吸,让身体放松",
			"1好的,谢谢医生"
		]
	],
25:#e2
	[
		[
			"1医生,我总梦见掉下去",
			"1每次都惊醒,很害怕",
			"1感觉心跳很快,睡不着"
		],[
			"0梦见什么地方掉下去",
			"1不太清楚,感觉掉落",
			"0最近有焦虑吗",
			"1是的,特别焦虑"
		],[
			"0睡前试试冥想",
			"1冥想有用吗",
			"0有助于放松身心",
			"1谢谢医生,我会练习"
		]
	],
26:#e3
	[
		[
			"1医生,我梦到被困住",
			"1醒来后特别害怕",
			"1觉得呼吸困难"
		],[
			"0白天心情如何",
			"1很压抑,特别紧张",
			"0最近遇到困难了吗",
			"1有,工作有些问题"
		],[
			"0建议适量运动",
			"1运动有帮助吗",
			"0能缓解压力和焦虑",
			"1谢谢医生,我会尝试"
		]
	],
27:#e4
	[
		[
			"1医生,我梦到自己考试迟到",
			"1每次都特别紧张",
			"1醒来后还很慌"
		],[
			"0最近有考试吗",
			"1有,很重要的考试",
			"0备考时紧张吗",
			"1是的,非常紧张"
		],[
			"0放松心情,合理安排复习",
			"1放松会不会浪费时间",
			"0不会,更有助提高效率",
			"1明白了,谢谢医生"
		]
	],
28:#e5
	[
		[
			"1医生,我梦到亲人受伤",
			"1特别真实,醒来后很难过",
			"1整夜都难以入睡"
		],[
			"0最近是否担心家人",
			"1是的,怕他们有意外",
			"0白天常想这些吗",
			"1是的,控制不住"
		],[
			"0建议白天多与家人联系",
			"1这样能减少噩梦吗",
			"0会的,有助安心",
			"1好的,谢谢医生"
		]
	],
29:#e6
	[
		[
			"1医生,我梦到无法呼吸",
			"1醒来后觉得特别恐惧",
			"1总觉得有人压着我"
		],[
			"0这种情况多久了",
			"1有一个月了",
			"0最近压力大吗",
			"1是的,非常焦虑"
		],[
			"0睡前放松心情,深呼吸",
			"1深呼吸真的有效吗",
			"0有助于缓解焦虑",
			"1谢谢医生,我会试试"
		]
	],
30:#j1
	[
		[
			"1医生,我半夜惊醒",
			"1梦里大喊大叫",
			"1觉得很害怕"
		],[
			"0醒来后记得梦吗",
			"1不记得,只记得害怕",
			"0最近有压力吗",
			"1有些,工作紧张"
		],[
			"0试试睡前放松",
			"1如何放松呢",
			"0深呼吸或冥想",
			"1谢谢医生"
		]
	],
31:#j2
	[
		[
			"1医生,我晚上吓醒",
			"1常常梦到危险",
			"1醒后心跳加速"
		],[
			"0白天紧张吗",
			"1是的,工作忙",
			"0最近更频繁吗",
			"1每晚都这样"
		],[
			"0睡前试泡脚",
			"1泡脚有用吗",
			"0有助放松神经",
			"1好的,谢谢医生"
		]
	],
32:#j3
	[
		[
			"1晚上惊醒,总觉得呼吸困难",
			"1梦到溺水,特别真实",
			"1醒来很恐慌"
		],[
			"0白天焦虑吗",
			"1是的,最近焦虑多",
			"0有没有休息好",
			"1经常睡不够"
		],[
			"0调整作息,早睡早起",
			"1早睡能帮助吗",
			"0有助于情绪稳定",
			"1谢谢医生,我会试试"
		]
	],
33:#j4
	[
		[
			"1医生,我半夜喊救命",
			"1感觉有人追我",
			"1醒后很害怕"
		],[
			"0最近生活有压力吗",
			"1是的,家庭压力大",
			"0睡前会焦虑吗",
			"1会,常常想很多"
		],[
			"0试着练习深呼吸",
			"1深呼吸有用吗",
			"0能缓解紧张",
			"1谢谢医生,我会练习"
		]
	],
34:#j5
	[
		[
			"1晚上总是突然惊醒",
			"1梦到自己在逃跑",
			"1觉得非常害怕"
		],[
			"0白天情绪稳定吗",
			"1有时不太稳定",
			"0工作压力大吗",
			"1最近工作很多"
		],[
			"0睡前听轻音乐",
			"1音乐能帮忙吗",
			"0可以舒缓情绪",
			"1好的,谢谢医生"
		]
	],
35:#j6
	[
		[
			"1我晚上惊醒,大喊大叫",
			"1觉得非常恐慌",
			"1完全无法控制"
		],[
			"0最近这种情况多吗",
			"1几乎每晚都会",
			"0白天心情如何",
			"1有些压抑"
		],[
			"0睡前做些轻运动",
			"1运动有用吗",
			"0有助释放压力",
			"1谢谢医生,我会尝试"
		]
	],
36:#m1
	[
		[
			"1医生,我常常梦游",
			"1家人说我晚上起床走动",
			"1我自己毫无意识",
			"1不知道该怎么办"
		],[
			"0梦游时有危险行为吗",
			"1有一次差点摔下楼梯",
			"0最近压力大吗",
			"1是的,工作很紧张"
		],[
			"0建议放松心情,睡前深呼吸",
			"1深呼吸有效吗",
			"0有助于减少梦游",
			"1好的,谢谢医生"
		]
	],
37:#m2
	[
		[
			"1医生,我夜里总是起床乱走",
			"1醒来后毫无印象",
			"1家人很担心",
			"1想寻求帮助"
		],[
			"0梦游多久了",
			"1有半年了",
			"0白天是否常感疲惫",
			"1是的,很累"
		],[
			"0建议调整作息,保持规律",
			"1这样可以减少梦游吗",
			"0对,规律作息有帮助",
			"1明白了,谢谢医生"
		]
	],
38:#m3
	[
		[
			"1医生,我晚上经常梦游",
			"1家人说我开门出去了",
			"1但我完全不记得",
			"1感觉很害怕"
		],[
			"0梦游时是否有受伤",
			"1目前没有,但很危险",
			"0梦游频率是多少",
			"1几乎每周一次"
		],[
			"0建议家人锁好门窗,保护安全",
			"1这样能防止意外吗",
			"0可以降低风险",
			"1谢谢医生,我会注意"
		]
	],
39:#m4
	[
		[
			"1医生,我总是晚上起来找东西",
			"1但早上全忘了",
			"1家人说我梦游",
			"1这让我很困扰"
		],[
			"0最近生活有变动吗",
			"1有,刚换了新工作",
			"0压力大吗",
			"1是的,非常紧张"
		],[
			"0建议练习放松技巧,睡前冥想",
			"1冥想有帮助吗",
			"0可以减轻焦虑,减少梦游",
			"1明白了,谢谢医生"
		]
	],
40:#m5
	[
		[
			"1医生,我梦游,会乱拿家里东西",
			"1醒来后完全不记得",
			"1担心安全问题",
			"1希望找到解决办法"
		],[
			"0梦游时情绪如何",
			"1家人说很平静",
			"0是否有失眠情况",
			"1有时难以入睡"
		],[
			"0建议尝试睡前泡脚,放松神经",
			"1泡脚真的有用吗",
			"0有助改善睡眠质量",
			"1好的,谢谢医生"
		]
	],
41:#m6
	[
		[
			"1医生,我夜里会自己走出去",
			"1醒来后毫无记忆",
			"1家人很担心",
			"1不知道怎么解决"
		],[
			"0梦游时家人怎么处理",
			"1他们叫醒我,我就回房",
			"0有过惊恐反应吗",
			"1没有,但很茫然"
		],[
			"0建议家人轻柔引导回床",
			"1这样有帮助吗",
			"0避免惊醒,减少刺激",
			"1谢谢医生,我会告诉家人"
		]
	],
42:#h1
	[
		[
			"1医生,我晚上呼吸困难",
			"1半夜总是憋醒",
			"1感觉很痛苦"
		],[
			"0平时打呼严重吗",
			"1是的,非常严重",
			"0体重如何,是否超标",
			"1是的,比较胖"
		],[
			"0建议减重,保持侧卧睡姿",
			"1侧卧能改善吗",
			"0可以减少呼吸暂停",
			"1谢谢医生"
		]
	],
43:#h2
	[
		[
			"1医生,我半夜常憋醒",
			"1醒来后心跳很快",
			"1非常难受"
		],[
			"0有做过睡眠检测吗",
			"1还没有做",
			"0建议做一次检测",
			"1检测能查出原因吗"
		],[
			"0可以判断呼吸暂停程度",
			"1好的,我会去做",
			"0早发现早治疗",
			"1谢谢医生"
		]
	],
44:#h3
	[
		[
			"1医生,我老公说我呼吸停顿",
			"1他说我睡觉很吓人",
			"1甚至会大口喘气"
		],[
			"0是否白天嗜睡",
			"1是的,总是犯困",
			"0晚上睡眠质量如何",
			"1感觉很浅,常醒"
		],[
			"0建议使用睡眠呼吸机",
			"1呼吸机会有效吗",
			"0能明显改善呼吸情况",
			"1谢谢医生,我试试"
		]
	],
45:#h4
	[
		[
			"1医生,我晚上总是憋气",
			"1半夜会惊醒",
			"1特别焦虑"
		],[
			"0平时有吸烟吗",
			"1有,每天一包",
			"0吸烟会加重呼吸问题",
			"1这样啊"
		],[
			"0建议戒烟,保护呼吸道",
			"1戒烟会好转吗",
			"0有助于减轻症状",
			"1好的,谢谢医生"
		]
	],
46:#h5
	[
		[
			"1医生,我早上总是头痛",
			"1晚上睡不踏实",
			"1感觉呼吸困难"
		],[
			"0睡觉姿势怎么样",
			"1喜欢仰卧睡觉",
			"0仰卧容易导致呼吸阻塞",
			"1这样啊,我不清楚"
		],[
			"0建议改为侧卧睡姿",
			"1侧卧会改善头痛吗",
			"0可能减轻呼吸暂停导致的缺氧",
			"1谢谢医生,我会试试"
		]
	],
47:#h6
	[
		[
			"1医生,我老婆说我呼吸不正常",
			"1她说我打呼很响",
			"1还会突然没声音"
		],[
			"0晚上睡眠质量怎么样",
			"1不好,常常醒",
			"0白天是否感觉疲劳",
			"1是的,特别困"
		],[
			"0建议做个睡眠监测",
			"1监测会有帮助吗",
			"0能判断呼吸暂停的情况",
			"1谢谢医生,我去做"
		]
	],
48:#ss1
	[
		[
			"1医生,我总是特别困",
			"1每天都睡不醒",
			"1不管睡多久都累",
			"1怎么办"
		],[
			"0晚上睡得好吗",
			"1还行,但白天很困",
			"0有打鼾吗",
			"1有,挺严重的"
		],[
			"0建议做个睡眠测试",
			"1可以查什么问题",
			"0查是否有睡眠呼吸暂停",
			"1好的,谢谢医生"
		]
	],
49:#ss2
	[
		[
			"1医生,我常常上班时打瞌睡",
			"1每天都提不起精神",
			"1我该怎么办"
		],[
			"0晚上睡觉够吗",
			"1够的,睡八小时",
			"0白天活动量大吗",
			"1不大,工作坐着"
		],[
			"0建议增加运动量",
			"1运动有帮助吗",
			"0有助于缓解嗜睡",
			"1好的,谢谢医生"
		]
	],
50:#ss3
	[
		[
			"1医生,我每天早上特别难醒",
			"1感觉睡不够",
			"1每次闹钟都关掉继续睡"
		],[
			"0晚上几点睡",
			"1十一点左右",
			"0有做梦吗",
			"1有时会,但记不清"
		],[
			"0建议固定起床时间",
			"1这样有用吗",
			"0能调整生物钟",
			"1谢谢医生,我试试"
		]
	],
51:#ss4
	[
		[
			"1医生,我吃饭时都能睡着",
			"1常常在桌上睡过去",
			"1朋友说我不正常"
		],[
			"0有没有过度疲劳",
			"1有时工作很累",
			"0平时午休吗",
			"1不太午休,怕耽误事"
		],[
			"0建议午休15分钟",
			"1短暂午休有用吗",
			"0能帮助恢复精神",
			"1谢谢医生,我会午休"
		]
	],
52:#ss5
	[
		[
			"1医生,我看电视都会睡着",
			"1只要坐着就困",
			"1感觉根本控制不了"
		],[
			"0平时锻炼身体吗",
			"1基本不锻炼",
			"0饮食怎么样",
			"1偏油腻,喜欢甜食"
		],[
			"0建议调整饮食,多运动",
			"1这样能改善嗜睡吗",
			"0能增强体力和精力",
			"1明白了,谢谢医生"
		]
	],
53:#ss6
	[
		[
			"1医生,我晚上睡得很好",
			"1但白天一直很困",
			"1总想再睡一会"
		],[
			"0白天有没有打盹",
			"1有,午休时常睡很久",
			"0午休多久",
			"1大概一个小时以上"
		],[
			"0建议午休不超30分钟",
			"1这样会更有精神吗",
			"0是的,长午休反而会困",
			"1谢谢医生,我会注意"
		]
	],
54:#fs1
	[
		[
			"1医生,我经常突然睡着",
			"1无论在哪,都控制不了",
			"1很困扰,怎么办"
		],[
			"0白天是否很疲惫",
			"1是的,总感觉没精神",
			"0晚上睡眠质量如何",
			"1睡得浅,总醒"
		],[
			"0建议规律作息,尽量早睡",
			"1这样能改善吗",
			"0有助于减少发作",
			"1好的,谢谢医生"
		]
	],
55:#fs2
	[
		[
			"1医生,我在开会时突然睡着",
			"1同事说我直接倒下去",
			"1特别尴尬"
		],[
			"0是否有剧烈情绪波动",
			"1是的,当时很紧张",
			"0是否经常这样",
			"1是的,情绪激动就会"
		],[
			"0建议避免情绪过激",
			"1控制情绪能有效吗",
			"0能减少突发性睡眠",
			"1谢谢医生"
		]
	],
56:#fs3
	[
		[
			"1医生,我上班时总是突然睡着",
			"1影响工作效率,很难过",
			"1不知道该怎么办"
		],[
			"0是否有睡前喝酒",
			"1偶尔会,睡前喝一杯",
			"0酒精会影响睡眠质量",
			"1原来如此"
		],[
			"0建议戒酒,调整睡眠习惯",
			"1这样能减少发作吗",
			"0有很大帮助",
			"1好的,谢谢医生"
		]
	],
57:#fs4
	[
		[
			"1医生,我吃饭时突然睡着",
			"1饭碗都差点掉了",
			"1家人很担心"
		],[
			"0平时有过多嗜睡吗",
			"1是的,经常控制不住",
			"0是否有睡眠呼吸暂停",
			"1不清楚,可能有"
		],[
			"0建议做一次睡眠检查",
			"1能诊断出问题吗",
			"0是的,帮助找到原因",
			"1谢谢医生,我会去做"
		]
	],
58:#fs5
	[
		[
			"1医生,我总是在课堂上睡着",
			"1特别想集中注意力,但控制不住",
			"1很想知道怎么改善"
		],[
			"0晚上几点睡觉",
			"1通常凌晨一两点",
			"0每天睡眠时间是否足够",
			"1大概只有五小时"
		],[
			"0建议早睡,保证足够睡眠",
			"1这样能改善吗",
			"0有助于白天保持清醒",
			"1谢谢医生,我会调整"
		]
	],
59:#fs6
	[
		[
			"1医生,我情绪激动时就会睡着",
			"1无论开心或生气都一样",
			"1很害怕这种情况"
		],[
			"0这种情况持续多久了",
			"1大概半年,越来越频繁",
			"0最近压力大吗",
			"1是的,工作压力很大"
		],[
			"0建议寻求心理辅导,缓解压力",
			"1心理辅导有效果吗",
			"0能帮助缓解情绪失控",
			"1谢谢医生,我会试试"
		]
	],
60:#fs7
	[
		[
			"1医生,我走路时突然睡着",
			"1差点摔倒,非常危险",
			"1我该怎么办"
		],[
			"0是否有过度疲劳的情况",
			"1是的,最近工作太累",
			"0晚上睡得好吗",
			"1不好,总是做梦"
		],[
			"0建议调整工作量,尽量休息",
			"1这样能减少发作吗",
			"0会有所改善,注意放松",
			"1谢谢医生"
		]
	],
61:#fs8
	[
		[
			"1医生,我突然睡着,在公交上",
			"1醒来都到站了,很尴尬",
			"1怎么才能控制住"
		],[
			"0平时是否睡眠充足",
			"1不太充足,每天五六小时",
			"0晚上是否入睡困难",
			"1是的,常常睡不着"
		],[
			"0建议睡前放松,确保足够睡眠",
			"1这样能减少发作吗",
			"0能改善白天的嗜睡",
			"1谢谢医生"
		]
	],
62:#y1
	[
		[
			"1医生,我晚上睡觉时乱动",
			"1有时会挥拳踢腿",
			"1还伤到过家人",
			"1我很担心"
		],[
			"0这种情况多久了",
			"1有半年了",
			"0发作频率高吗",
			"1几乎每晚"
		],[
			"0建议睡前尽量放松",
			"1放松有用吗",
			"0能减少冲动动作",
			"1谢谢医生,我试试"
		]
	],
63:#y2
	[
		[
			"1晚上梦中常常乱动",
			"1总会跌下床",
			"1感觉很危险",
			"1怎么办"
		],[
			"0有频繁发作吗",
			"1每周好几次",
			"0梦中是否激烈",
			"1是的,常梦到打斗"
		],[
			"0试试睡前冥想",
			"1冥想有帮助吗",
			"0能降低激烈梦境",
			"1谢谢医生,我会练习"
		]
	],
64:#y3
	[
		[
			"1医生,我睡觉时会大声喊叫",
			"1喊到喉咙痛",
			"1还会踢被子",
			"1很困扰"
		],[
			"0白天压力大吗",
			"1是的,非常焦虑",
			"0经常做恶梦吗",
			"1梦到冲突和争吵"
		],[
			"0建议放松训练",
			"1如何训练",
			"0深呼吸,集中精神",
			"1好的,谢谢医生"
		]
	],
65:#y4
	[
		[
			"1晚上我总是梦里打人",
			"1还伤到过自己",
			"1醒来后手臂疼",
			"1怎么办"
		],[
			"0有没有吃安眠药",
			"1没有,害怕副作用",
			"0梦中情绪激烈吗",
			"1是的,常常愤怒"
		],[
			"0建议心理辅导",
			"1心理辅导有效吗",
			"0有助于释放情绪",
			"1谢谢医生,我会考虑"
		]
	],
66:#y5
	[
		[
			"1医生,我睡觉时乱踢",
			"1踢到了床头柜",
			"1脚还受伤了",
			"1怎么办"
		],[
			"0发作时意识清楚吗",
			"1不清楚,只记得梦",
			"0梦中是否激烈",
			"1是的,梦到被追赶"
		],[
			"0睡前做放松练习",
			"1放松练习有用吗",
			"0能缓解过激反应",
			"1好的,谢谢医生"
		]
	],
67:#y6
	[
		[
			"1医生,我晚上总打人",
			"1家人害怕睡我旁边",
			"1梦里觉得在防御",
			"1特别困扰"
		],[
			"0这种情况多久了",
			"1大约一年了",
			"0梦境都很紧张吗",
			"1是的,充满危机感"
		],[
			"0可以试试药物治疗",
			"1药物会有副作用吗",
			"0会,但效果明显",
			"1明白了,谢谢医生"
		]
	],
68:#y7
	[
		[
			"1晚上常梦到打架",
			"1会真的出拳",
			"1老婆被吓醒",
			"1怎么办"
		],[
			"0这种情况频繁吗",
			"1每周都会发生",
			"0平时压力大吗",
			"1是的,工作很多"
		],[
			"0睡前做些放松运动",
			"1什么运动比较好",
			"0轻柔的伸展运动",
			"1好的,谢谢医生"
		]
	],
69:#y8
	[
		[
			"1晚上梦中乱动",
			"1醒来后很累",
			"1浑身酸痛",
			"1感觉睡不好"
		],[
			"0这种梦常发生吗",
			"1几乎每晚",
			"0梦中情绪强烈吗",
			"1是的,梦到冲突"
		],[
			"0建议规律作息",
			"1作息对梦有影响吗",
			"0能减少激烈梦境",
			"1明白了,谢谢医生"
		]
	],
70:#my1
	[
		[
			"1医生,我总是晚上磨牙",
			"1醒来后牙齿很痛",
			"1家人说磨牙声很响"
		],[
			"0最近工作压力大吗",
			"1是的,特别忙",
			"0是否感到焦虑",
			"1有些,总是紧张"
		],[
			"0建议试试放松训练",
			"1放松能缓解磨牙吗",
			"0有助减少夜间磨牙",
			"1谢谢医生"
		]
	],
71:#my2
	[
		[
			"1医生,我经常磨牙,影响睡眠",
			"1早上牙酸得厉害",
			"1觉得特别不舒服"
		],[
			"0磨牙多久了",
			"1大概半年吧",
			"0平时有熬夜吗",
			"1是的,经常加班"
		],[
			"0建议调整作息,早睡早起",
			"1调整作息真的有效吗",
			"0能缓解紧张情绪",
			"1谢谢医生"
		]
	],
72:#my3
	[
		[
			"1我总是磨牙,室友很烦我",
			"1他们说磨牙声吵",
			"1怎么办啊医生"
		],[
			"0平时咀嚼口香糖吗",
			"1经常嚼,特别喜欢",
			"0可能咀嚼肌过度紧张",
			"1这样会引起磨牙吗"
		],[
			"0建议减少咀嚼,放松下颌",
			"1好的,我会注意的",
			"0这样能帮助缓解磨牙",
			"1谢谢医生"
		]
	],
73:#my4
	[
		[
			"1医生,我磨牙磨得厉害",
			"1嘴巴早上总是酸痛",
			"1不知道怎么办"
		],[
			"0是否有夜间牙套",
			"1没有用过",
			"0建议考虑牙套保护",
			"1牙套有用吗"
		],[
			"0可以减少牙齿损伤",
			"1那我试试吧",
			"0可以找牙医定制合适的",
			"1好的,谢谢医生"
		]
	],
74:#my5
	[
		[
			"1医生,我每晚都磨牙",
			"1醒来下巴很酸",
			"1家人说我磨牙声响"
		],[
			"0最近是否有烦恼",
			"1有些,工作压力大",
			"0情绪会不会很紧张",
			"1是的,很难放松"
		],[
			"0睡前试试冥想放松",
			"1冥想怎么做",
			"0专注呼吸,静心练习",
			"1谢谢医生,我会试"
		]
	],
75:#my6
	[
		[
			"1医生,晚上磨牙太严重",
			"1早上感觉牙疼",
			"1特别难受"
		],[
			"0晚上会不会经常失眠",
			"1是的,常常睡不着",
			"0是不是心事很多",
			"1是,总想工作"
		],[
			"0建议晚上少思虑,放轻松",
			"1有点难做到",
			"0可以试试写日记",
			"1好的,谢谢医生"
		]
	],
76:#my7
	[
		[
			"1医生,我晚上磨牙,醒来头疼",
			"1每天都感觉不舒服",
			"1怎么办呢"
		],[
			"0头疼的情况多吗",
			"1是的,每周都有",
			"0是否觉得颈部紧绷",
			"1是,肩颈很紧"
		],[
			"0可以做些颈部放松操",
			"1颈部放松能改善磨牙吗",
			"0有助于缓解紧张状态",
			"1谢谢医生,我会试试"
		]
	],
77:#my8
	[
		[
			"1医生,我晚上老磨牙,牙齿有磨损",
			"1牙医说已经有问题",
			"1怎么办才好"
		],[
			"0是否有戴牙齿保护器",
			"1没有,觉得麻烦",
			"0建议尝试佩戴保护器",
			"1那真的有必要吗"
		],[
			"0可以保护牙齿,避免损坏加重",
			"1好的,我会试戴",
			"0这样能有效防止磨损",
			"1谢谢医生的建议"
		]
	],

}

"""
	-1:
		[
			[
				
			],[
				
			],[
				
			],[
				
			],[
				
			]
		],
"""
"""
	15:
		[
			[
				"1医生,我压力大,睡眠很差",
				"0最近遇到什么事吗",
				"1公司裁员,心里紧张"
			],[
				"0白天有时间休息吗",
				"1很少休息,很忙"
			],[
				"0试试睡前放松训练",
				"1放松训练怎么做",
				"0深呼吸,听轻音乐",
				"1好的,谢谢医生"
			],[
				"0试试睡前放松训练",
				"1放松训练怎么做",
				"0深呼吸,听轻音乐",
				"1好的,谢谢医生"
			],[
				"0治不了",
				"1那我走"
			]
		],
"""

@export var value_dic:Dictionary = {
	0:"失眠症",
	1:"梦魇",
	2:"夜惊症",
	3:"遗尿症",
	4:"睡眠呼吸暂停综合征",
	5:"梦游症",
	6:"嗜睡症",
	7:"发作性睡病",
	8:"快速眼动睡眠行为障碍",
	9:"磨牙症"
}
@export var unlock_dic:Dictionary = {
	0:false,
	1:false,
	2:false,
	3:false,
	4:false,
	5:false,
	6:false,
	7:false,
	8:false,
	9:false
}
@export var key_dic:Dictionary = {
	"睡不着":0,
	"做噩梦":1,
	"半夜惊醒":2,
	"半夜床湿":3,
	"夜里乱走":5,
	"打呼":4,
	"打瞌睡":6,
	"突然睡着":7,
	"梦中打架":8,
	"早上牙疼":9,
}
